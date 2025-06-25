---
id: nest-auth-concepts
aliases: []
tags:
  -  #concepto
  -  #nestjs
  -  #auth
---

# NestJS – Conceptos de Auth con JWT, Prisma y Redis

Creación: 2025-06-16  
Actualización:

## Excepciones

- `BadRequestException` (400)
- `ConflictException` (409)
- `NotFoundException` (404)
- `UnauthorizedException` (401)

## DTOs

- `RegisterDto`, `LoginDto` con validación vía `class-validator`.

## Hashing

- `bcrypt.hash(…, saltRounds)` / `bcrypt.compare(…)`.

## JWT

- `JwtService.sign()` / `JwtService.verify()`
- Access token (1 h), Refresh token (1 semana)

## Base de datos

- `PrismaService.user.findUnique/create/update`

## Redis

- Almacenamiento de refresh tokens (`refresh_<userId>`)
- Blacklist de access tokens (`bl_<token>`)

## Email

- Envío de token de verificación con `EmailService.sendVerificationEmail`

## Flujo

1. **Register** → Validación, hash, create, mail token
2. **Login** → Comprueba, genera tokens, guarda refresh
3. **Refresh** → Verifica refresh, firma nuevo access
4. **Logout** → Blacklist access, elimina refresh
5. **Verify Email** → Verifica token, marca `isVerified`

## Relacionado

[[nestjs-hub]]  
[[nest-testing]]

## Fuente

[[logs/2025-06-16]]
