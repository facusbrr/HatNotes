---
id: nest-routing-controllers
aliases:
  - "\[]"
tags:
  - "\[concepto,"
  - nestjs,
  - routing]
---

# NestJS – Ruteo y Controladores Avanzados

Creación: 2025-06-15
Actualización:
Tags: #concepto #nestjs #routing

## ¿Qué es el ruteo avanzado?

El ruteo en NestJS define cómo las URL y los métodos HTTP
se asignan a acciones en los controladores. Las características
avanzadas incluyen prefijos de ruta, parámetros, validación
y versionado.

## Configurar prefijos de ruta

En un módulo:

```ts
@Module({
  controllers: [CatsController],
})
export class CatsModule {}
```

En el controlador:

```ts
@Controller("cats")
export class CatsController {}
```

Este prefijo se concatena con rutas internas.

## Decoradores de parámetros

- `@Param()` extrae variables de ruta.
- `@Query()` obtiene parámetros de consulta.
- `@Body()` accede al cuerpo de la petición.
- `@Headers()`, `@Session()`, `@Req()`, `@Res()` entre otros.

```ts
@Get(':id')
findOne(
  @Param('id', ParseIntPipe) id: number,
  @Query('includePosts') include: boolean,
) {
  return this.catsService.findOne(id, include);
}

@Post()
create(
  @Body() createCatDto: CreateCatDto,
) {
  return this.catsService.create(createCatDto);
}
```

## Rutas anidadas y módulos hijos

```ts
@Controller("users")
export class UsersController {
  @Get(":id/posts")
  findUserPosts(@Param("id") id: string) {}
}
```

Para modularizar:

```ts
@Module({
  controllers: [UsersController],
  imports: [PostsModule],
})
export class UsersModule {}
```

## Versionado de API

```ts
@Controller({ path: "cats", version: "1" })
export class CatsV1Controller {}

@Controller({ path: "cats", version: "2" })
export class CatsV2Controller {}
```

Activa versión en `main.ts` con
`app.enableVersioning({ type: VersioningType.URI })`.

## Buenas prácticas

- Sigue convenciones REST: plural, verbos HTTP.
- Usa Pipes y Validations en parámetros.
- Documenta con Swagger (decoradores `@Api*`).
- Separa controladores por versión o dominio.
- Mantén los controladores delgados; delega a servicios.

## Palabras clave

- [[@Controller]]
- [[@Get]] [[@Post]]
- [[@Param]] [[@Query]]
- [[Versioning]]

## Relacionado

- [[nest-estructura]]
- [[nest-fundamentos]]
- [[nest-validacion-pipes]]

## Fuente

- [[logs/2025-06-15]]
- Documentación oficial NestJS Routing
