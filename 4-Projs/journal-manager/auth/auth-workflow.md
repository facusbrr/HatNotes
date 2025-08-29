---
id: auth-workflow
aliases: []
tags: []
---

# Flujo de Autenticacion

## Registro de Usuario

```mermaid
flowchart TD
  A((Registro de Usuario)) --> B[Validar datos del usuario]
  B --> C{¿Campos obligatorios completos?}
  C -->|No| D[Retornar Error: Campos incompletos]
  C -->|Sí| E[Verificar si usuario ya está registrado]
  E --> F{¿Usuario existe en la base de datos?}
  F -->|Sí| G[Retornar Error: Usuario ya registrado]
  F -->|No| H[Hash de contraseña]
  H --> I[(Base de Datos)]
  I --> J[Crear usuario]
  J --> K[Generar token de verificación: JWT]
  K --> L[Enviar correo de verificación]
  L --> M[Esperar verificación de correo]
  M --> N{¿Correo verificado?}
  N -->|No| O[Usuario no puede ingresar al sitio]
  N -->|Sí| P((Usuario registrado y puede ingresar al sitio))
```

## Inicio de sesion

```mermaid
flowchart TD
  A((Inicio de Sesion)) --> B[Validar datos del usuario]
  B --> C{¿Usuario existe en la base de datos?}
  C -->|No| D[Retornar Error: Credenciales inválidas]
  C -->|Sí| E[(Base de Datos)]
  E --> F{¿Cuenta verificada?}
  F -->|No| G[Retornar Error: Cuenta no verificada]
  F -->|Sí| H[Verificar contraseña]
  H --> I{¿Contraseña válida?}
  I -->|No| J[Retornar Error: Credenciales inválidas]
  I -->|Sí| K[Generar tokens JWT (Acceso y Refresco)]
  K --> L[(Redis)]
  L --> M[Almacenar token de refresco en Redis]
  M --> N[Retornar tokens y datos del usuario]
  N --> O((Redirigir al Home))
```

## Cerrar sesion

```mermaid
flowchart TD
  A((Solicitud de cierre de sesión)) --> B[Decodificar token de acceso]
  B --> C{¿Token válido?}
  C -->|No| D[Retornar Error: Token inválido]
  C -->|Sí| E[(Redis)]
  E --> F[Invalidar token de acceso en Redis]
  F --> G{¿Token de refresco proporcionado?}
  G -->|No| H[Retornar éxito: Sesión cerrada]
  G -->|Sí| I[(Redis)]
  I --> J[Eliminar token de refresco en Redis]
  J --> K[Retornar éxito: Sesión cerrada]
```

## Refrescar Token

```mermaid
flowchart TD
  A((Inicio: Token de acceso expirado)) --> B[Solicitar refresco de token automáticamente]
  B --> C[Validar token de refresco]
  C --> D{¿Token válido?}
  D -->|No| E[Retornar Error: Token inválido]
  D -->|Sí| F[(Redis)]
  F --> G{¿Token presente en Redis?}
  G -->|No| H[Retornar Error: Token inválido]
  G -->|Sí| I[(Base de Datos)]
  I --> J[Consultar usuario asociado al token]
  J --> K{¿Usuario encontrado?}
  K -->|No| L[Retornar Error: Usuario no encontrado]
  K -->|Sí| M[Generar nuevo token de acceso JWT]
  M --> N[[Retornar nuevo token de acceso]]
  N --> O((Fin: Sesión continua de forma transparente))
```

## Verificar email

```mermaid
flowchart TD
  A((Solicitud de verificación de email)) --> B[Validar token de verificación]
  B --> C{¿Token válido?}
  C -->|No| D[Retornar Error: Token inválido]
  C -->|Sí| E[(Base de Datos)]
  E --> F[Consultar usuario asociado al token]
  F --> G{¿Usuario encontrado?}
  G -->|No| H[Retornar Error: Usuario no encontrado]
  G -->|Sí| I{¿Usuario ya verificado?}
  I -->|Sí| J[Retornar mensaje: Usuario ya verificado]
  I -->|No| K[Actualizar estado de verificación del usuario]
  K --> L[Cuenta verificada correctamente]
```

## Solicitud de Restablecimiento de Contraseña

```mermaid
flowchart TD
  A((Solicitud de restablecimiento de contraseña)) --> B[Validar email proporcionado]
  B --> C{¿Email válido?}
  C -->|No| D[Retornar Error: Email inválido]
  C -->|Sí| E[(Base de Datos)]
  E --> F[Consultar usuario asociado al email]
  F --> G{¿Usuario encontrado?}
  G -->|No| H[Retornar Error: Usuario no encontrado]
  G -->|Sí| I[Generar token de recuperación]
  I --> J[Actualizar token y su expiración en base de datos]
  J --> K[Enviar correo con token de recuperación]
  K --> L[Correo enviado]
```

## Cambiar contraseña

```mermaid
flowchart TD
  A((Solicitud de cambio de contraseña)) --> B[Validar token de recuperación]
  B --> C{¿Token válido?}
  C -->|No| D[Retornar Error: Token inválido o expirado]
  C -->|Sí| E[(Base de Datos)]
  E --> F[Consultar usuario asociado al token]
  F --> G{¿Usuario encontrado?}
  G -->|No| H[Retornar Error: Usuario no encontrado]
  G -->|Sí| I[Hash de nueva contraseña]
  I --> J[Actualizar contraseña en la base de datos]
  J --> K[Eliminar token de recuperación]
  K --> L[Contraseña actualizada]
```
