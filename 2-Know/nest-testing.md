---
id: nest-testing
aliases:
  - "\[]"
tags:
  - "\[#nestjs,"
  - #testing,
  - #concepto]
---

# Título: Testing en NestJS

Creación: 2025-06-16
Actualización:

## ¿Qué es?

El testing en NestJS permite validar el comportamiento de las unidades de
código (servicios, controladores, etc.) usando herramientas como
**Jest**, que es el motor de test por defecto en proyectos generados con
Nest CLI.

NestJS proporciona un entorno de testing estructurado mediante el uso de
`Test.createTestingModule`, permitiendo emular dependencias y realizar
pruebas unitarias y de integración.

## Ejemplo

### Test de un servicio

Supongamos que tenemos un servicio `CatsService`:

```ts
@Injectable()
export class CatsService {
  findAll(): string {
    return "Todos los gatos";
  }
}
```

El archivo `cats.service.spec.ts` sería:

```ts
describe("CatsService", () => {
  let service: CatsService;

  beforeEach(async () => {
    const module = await Test.createTestingModule({
      providers: [CatsService],
    }).compile();

    service = module.get<CatsService>(CatsService);
  });

  it("debe devolver todos los gatos", () => {
    expect(service.findAll()).toBe("Todos los gatos");
  });
});
```

### Test de un controlador con dependencia simulada (mock)

```ts
const mockService = {
  findAll: jest.fn().mockReturnValue(["Gato1", "Gato2"]),
};

describe("CatsController", () => {
  let controller: CatsController;

  beforeEach(async () => {
    const module = await Test.createTestingModule({
      controllers: [CatsController],
      providers: [{ provide: CatsService, useValue: mockService }],
    }).compile();

    controller = module.get<CatsController>(CatsController);
  });

  it("debe devolver una lista de gatos", () => {
    expect(controller.findAll()).toEqual(["Gato1", "Gato2"]);
  });
});
```

## Palabras clave

[Jest]
[Test.createTestingModule]
[Mocks]
[Pruebas Unitarias]
[Inyección de Dependencias]

## Relacionado

[nestjs-hub]

## Fuente

[logs/2025-06-16]
Documentación oficial NestJS - sección Testing
