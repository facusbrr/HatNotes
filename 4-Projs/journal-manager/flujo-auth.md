---
id: flujo-auth
aliases: []
tags:
  - flujo-auth
---

# Workflow Completo de Autenticación

## 1. Arquitectura del Sistema

Tu sistema de autenticación está compuesto por los siguientes componentes:

- **AuthController**: Maneja las solicitudes HTTP (endpoints)
- **AuthService**: Contiene la lógica de negocio para autenticación
- **JwtStrategy**: Verifica tokens JWT para rutas protegidas
- **RedisService**: Gestiona tokens en blacklist y refresh tokens
- **PrismaService**: Interactúa con la base de datos
- **DTOs**: Validan y transforman datos de entrada
- **Interfaces**: Definen estructuras de datos (TokenInfo, JwtPayload)

## 2. Flujos Principales

### 2.1. Registro de Usuario

```
Cliente                  AuthController               AuthService               PrismaService
   |                           |                          |                           |
   |-- POST /auth/register --->|                          |                           |
   |   (RegisterDto)           |                          |                           |
   |                           |-- register(dto) -------->|                           |
   |                           |                          |-- findUnique(email) ----->|
   |                           |                          |<----- user/null ----------|
   |                           |                          | [Si existe: ConflictException]
   |                           |                          |                           |
   |                           |                          |-- hash(password) -------->|
   |                           |                          |<----- hashedPassword -----|
   |                           |                          |                           |
   |                           |                          |-- create(userData) ------>|
   |                           |                          |<----- user --------------|
   |                           |                          |                           |
   |<-- 201 Created ------------|<----- return mensaje ---|                           |
   |  { message, userId }      |                          |                           |
```

### 2.2. Login (Autenticación)

```
Cliente                  AuthController               AuthService             PrismaService          RedisService
   |                           |                          |                         |                      |
   |-- POST /auth/login ------>|                          |                         |                      |
   |   (LoginDto)              |                          |                         |                      |
   |                           |-- login(dto) ----------->|                         |                      |
   |                           |                          |-- findUnique(email) --->|                      |
   |                           |                          |<----- user/null --------|                      |
   |                           |                          | [Si no existe: UnauthorizedException]          |
   |                           |                          |                         |                      |
   |                           |                          |-- compare(password) --->|                      |
   |                           |                          |<----- isValid ----------|                      |
   |                           |                          | [Si no válido: UnauthorizedException]          |
   |                           |                          |                         |                      |
   |                           |                          |-- sign(payload) ------->|                      |
   |                           |                          |<----- accessToken ------|                      |
   |                           |                          |                         |                      |
   |                           |                          |-- sign(refreshPayload) >|                      |
   |                           |                          |<----- refreshToken -----|                      |
   |                           |                          |                         |                      |
   |                           |                          |-- set(refreshToken) ------------------->|      |
   |                           |                          |<-------------------------------- OK ----|      |
   |                           |                          |                         |                      |
   |<-- 200 OK -----------------|<----- return tokens ----|                         |                      |
   |  { accessToken, refreshToken, user }                 |                         |                      |
```

### 2.3. Acceso a Recursos Protegidos

```
Cliente                 GuardedController         JwtAuthGuard            JwtStrategy            RedisService
   |                           |                       |                       |                       |
   |-- GET /api/protected ---->|                       |                       |                       |
   |   Authorization: Bearer token                     |                       |                       |
   |                           |-- canActivate() ----->|                       |                       |
   |                           |                       |-- validate(token) --->|                       |
   |                           |                       |                       |-- verify(token) ----->|
   |                           |                       |                       |<----- isValid --------|
   |                           |                       |                       |                       |
   |                           |                       |                       |-- get("bl_"+token) -->|
   |                           |                       |                       |<----- notBlacklisted -|
   |                           |                       |                       | [Si blacklisted: UnauthorizedException]
   |                           |                       |                       |                       |
   |                           |                       |<----- user ------------|                       |
   |                           |<----- request.user ---|                       |                       |
   |                           |                       |                       |                       |
   |<-- 200 OK -----------------|                       |                       |                       |
   |   { data }                |                       |                       |                       |
```

### 2.4. Refresh Token

```
Cliente                  AuthController            AuthService            RedisService            PrismaService
   |                           |                       |                       |                       |
   |-- POST /auth/refresh ---->|                       |                       |                       |
   |   { refreshToken }        |                       |                       |                       |
   |                           |-- refreshToken() ---->|                       |                       |
   |                           |                       |-- verify(token) ----->|                       |
   |                           |                       |<----- decoded --------|                       |
   |                           |                       |                       |                       |
   |                           |                       |-- get("refresh_"+id) >|                       |
   |                           |                       |<----- storedToken ----|                       |
   |                           |                       | [Si no existe o no coincide: UnauthorizedException]
   |                           |                       |                       |                       |
   |                           |                       |-- findUnique(id) --------------->|            |
   |                           |                       |<---------------------- user ------|            |
   |                           |                       | [Si no existe: UnauthorizedException]          |
   |                           |                       |                       |                       |
   |                           |                       |-- sign(payload) ----->|                       |
   |                           |                       |<----- newAccessToken -|                       |
   |                           |                       |                       |                       |
   |<-- 200 OK -----------------|<----- return token --|                       |                       |
   |   { accessToken }         |                       |                       |                       |
```

### 2.5. Logout

```
Cliente                  AuthController            AuthService            RedisService
   |                           |                       |                       |
   |-- POST /auth/logout ----->|                       |                       |
   |   { accessToken, refreshToken }                   |                       |
   |                           |-- logout() ---------->|                       |
   |                           |                       |-- decode(accessToken) |
   |                           |                       |<----- decoded --------|
   |                           |                       |                       |
   |                           |                       |-- set("bl_"+token) -->|
   |                           |                       |<----- OK -------------|
   |                           |                       |                       |
   |                           |                       |-- decode(refreshToken)|
   |                           |                       |<----- decoded --------|
   |                           |                       |                       |
   |                           |                       |-- del("refresh_"+id) >|
   |                           |                       |<----- OK -------------|
   |                           |                       |                       |
   |<-- 200 OK -----------------|<----- return success |                       |
   |                           |                       |                       |
```

## 3. Conceptos Clave

### 3.1. JWT (JSON Web Tokens)

Los JWT son tokens firmados que contienen información codificada en formato
JSON. En tu sistema:

- **Estructura**: `header.payload.signature`
- **Payload**: Contiene `{ sub, email, role, exp, iat }`
- **Ventajas**: Stateless, escalable, seguro cuando se implementa correctamente
- **Implementación**: Utilizas `@nestjs/jwt` para crear y verificar tokens

### 3.2. Access Token vs Refresh Token

Tu sistema implementa una estrategia de tokens dual:

- **Access Token**:

  - Vida corta (1 hora)
  - Payload completo (contiene rol, email, etc.)
  - Usado para acceder a recursos protegidos
  - Tipo 'access' en la interfaz TokenInfo

- **Refresh Token**:
  - Vida larga (7 días)
  - Payload mínimo (solo contiene sub/id)
  - Almacenado en Redis con TTL
  - Utilizado para obtener nuevos access tokens
  - Tipo 'refresh' en la interfaz TokenInfo

### 3.3. Token Blacklisting

Para invalidar tokens cuando un usuario cierra sesión:

- Los access tokens se añaden a una "lista negra" en Redis
- Se almacenan con una expiración igual a la del token
- La estrategia JWT verifica si un token está en esta lista antes de permitir
  el acceso
- Los refresh tokens se eliminan de Redis durante el logout

### 3.4. DTOs y Validación

Tus DTOs (Data Transfer Objects) proporcionan:

- **Validación automática**: Con class-validator
- **Transformación**: Con class-transformer
- **Documentación**: Con decoradores para Swagger
- **Ejemplo**:

  ```typescript
  export class RegisterDto {
    @IsEmail({}, { message: "El email debe ser válido" })
    email: string;

    @IsString({ message: "La contraseña debe ser una cadena de texto" })
    @MinLength(8, { message: "La contraseña debe tener al menos 8 caracteres" })
    password: string;

    // Otros campos...
  }
  ```

### 3.5. Redis para Gestión de Tokens

Redis es una base de datos en memoria que usas para:

- **Almacenar refresh tokens**: Usando `refresh_${userId}` como clave
- **Blacklisting de tokens**: Usando `bl_${token}` como clave
- **TTL automático**: Los tokens expirados se eliminan automáticamente
- **Escalabilidad**: Permite escalar horizontalmente tu servicio de autenticación

### 3.6. Interfaces

Las interfaces definen la estructura de datos y mejoran la seguridad de tipos:

- **TokenInfo**: Define la estructura de los tokens devueltos al cliente

  ```typescript
  export interface TokenInfo {
    token: string;
    expiresIn: number;
    type: "access" | "refresh";
  }
  ```

- **JwtPayload**: Define la estructura del payload del JWT

  ```typescript
  export interface JwtPayload {
    sub: string;
    email: string;
    role: string;
    iat?: number;
    exp?: number;
  }
  ```

## 4. Recomendaciones Adicionales

1. **Rotación de Refresh Tokens**: Cada vez que se utiliza un refresh token,
   considera generar uno nuevo para aumentar la seguridad.

2. **Monitoreo de Sesiones**: Implementa un sistema que permita a los usuarios
   ver sus sesiones activas y cerrarlas remotamente.

3. **Caducidad Configurable**: Permite configurar la duración de los tokens
   mediante variables de entorno.

4. **Documentación API**: Utiliza Swagger para documentar tus endpoints de autenticación.

5. **Testing**: Implementa pruebas unitarias e integración para todos los flujos
   de autenticación.

Este workflow completo muestra cómo tu sistema de autenticación está bien diseñado
y sigue las mejores prácticas actuales. La implementación de refresh tokens y blacklisting
de tokens proporciona un buen balance entre seguridad y experiencia de usuario.
