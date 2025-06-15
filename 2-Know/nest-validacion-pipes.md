---
id: nest-validacion-pipes
aliases:
  - "\[]"
tags:
  - "\[concepto,"
  - nestjs]
---

# NestJS – Validación Avanzada y Pipes

Creación: 2025-06-14
Actualización:
Tags: #concepto #nestjs #validación

## ¿Qué es la validación en NestJS?

La validación garantiza que los datos entrantes cumplan con los requisitos
previstos antes de procesarlos. NestJS ofrece **Pipes** para transformar y
validar datos de forma declarativa y reutilizable.

## Pipes en NestJS

Un **Pipe** es una clase con dos métodos clave:

- `transform(value, metadata)`: modifica o valida `value`.
- `exceptionFactory(errors)`: (opcional) lanza excepción si falla.

NestJS incluye dos Pipes integrados:

1. **ValidationPipe** – valida con `class-validator` y lanza
   `BadRequestException`.
2. **ParseIntPipe**, **ParseBoolPipe**, etc. – convierten tipos
   primitivos o lanzan error.

### Configurar ValidationPipe global

```ts
// main.ts
import { ValidationPipe } from "@nestjs/common";

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
      stopAtFirstError: true,
    }),
  );
  await app.listen(3000);
}
bootstrap();
```

- whitelist: elimina propiedades no definidas en DTO.
- forbidNonWhitelisted: rechaza con error en lugar de eliminar.
- transform: convierte tipos según DTO (e.g., id: string → id: number).
- stopAtFirstError: detiene validación en el primer fallo.

#### Ejemplo practico

```ts
// create-cat.dto.ts
import { IsString, IsInt, Min, Max, IsOptional } from "class-validator";

export class CreateCatDto {
  @IsString()
  name: string;

  @IsInt()
  @Min(0)
  @Max(30)
  age: number;

  @IsOptional()
  @IsString()
  breed?: string;
}
```

Controlador usando ValidationPipe global:

```ts
@Post()
create(@Body() createCatDto: CreateCatDto) {
  return this.catsService.create(createCatDto);
}
```

Si envías { "name": 123, "age": -1, "color": "negro" }, el pipe:

- Rechaza color no definido.
- Lanza error en name y age.

### Pipes personalizados

Crea pipes propios para reglas específicas:

```ts
import { PipeTransform, Injectable, BadRequestException } from "@nestjs/common";

@Injectable()
export class ParsePositiveIntPipe implements PipeTransform<string> {
  transform(value: string) {
    const val = parseInt(value, 10);
    if (isNaN(val) || val <= 0) {
      throw new BadRequestException(
        `Value must be a positive integer: ${value}`,
      );
    }
    return val;
  }
}
```

Usa en rutas:

```ts
@Get(':id')
findOne(@Param('id', ParsePositiveIntPipe) id: number) {
  return this.catsService.findOne(id);
}

```

### Buenas prácticas de validación

- Centraliza configuración con pipes globales.
- Usa DTOs claros y reutilizables.
- Evita lógica de validación en controladores o servicios.
- Documenta errores esperados (e.g., en OpenAPI).
- Limita la profundidad de objetos para prevenir Denial-of-Service.

### Palabras clave

- [ValidationPipe]
- [class-validator]
- [Pipes Personalizados]
- [DTO]

### Relacionado

- [NestJS – Fundamentos]
- [Interceptors]
- [Throttler]

### Fuente

- [[logs/2025-06-14]
- Documentación oficial NestJS
