---
id: nest-fundamentos
aliases:
  - "\[]"
tags:
  - "\[concepto,"
  - nestjs]
---

# NestJS – Fundamentos

Creación: 2025-06-14
Actualización: 2025-06-15

## ¿Qué es?

NestJS es un framework progresivo de Node.js basado en Express (o Fastify)
que aplica patrones de diseño modular e inversión de control inspirados en
Angular. Facilita la construcción de aplicaciones escalables y mantenibles
usando TypeScript y un sistema de **Modules**, **Controllers** y **Providers**.

## Ejemplo

**API de “Gatos” básica**:

1. DTO `CreateCatDto` define la forma de los datos.
2. `CatsController` expone rutas HTTP:
   - `GET /cats`
   - `POST /cats`
   - `GET /cats/:id`
3. `CatsService` guarda un array y lanza `NotFoundException` si no existe.
4. Registro de `CatsModule` en `AppModule` y arranque con `npm run start:dev`.

## Palabras clave

- [NestJS – Fundamentos]
- [Modules]
- [Controllers]
- [Providers]
- [DTO]

## Relacionado

- [TypeScript]
- [Fastify]
- [Inyección de Dependencias]

## Fuente

- [logs/2025-06-14]
- Libro / Clase / Artículo / Video
