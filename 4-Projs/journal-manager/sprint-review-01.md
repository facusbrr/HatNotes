---
id: sprint-review-01
aliases: []
tags: []
---

# Resumen Sprint Review – Journal Manager

**Fecha:** Hoy, 11:30

## 1. Logros del Sprint

### Historias de Usuario Completadas

- **JM-24 Registro de Usuario:**

  - DTOs,
  - hashing de contraseña,
  - persistencia en PostgreSQL con
    Prisma y endpoint funcional en
    NestJS.

- **JM-25 Inicio de Sesión:**

  - Validación de credenciales,
  - verificación de cuenta activa,
  - generación de accessToken y
    refreshToken,
  - y retorno de LoginResponseDTO.

- **JM-26 Recuperación de Contraseña:**
  - Diseño de modelo de tokens,
  - endpoints para solicitud y
    validación de token,
  - y actualización de contraseña.

### Tareas Adicionales

- **Envío de correos con Resend:**

  - EmailService desacoplado,
  - plantillas de verificación y
    restablecimiento,
  - integración en el flujo de
    registro y “forgot password”.

- **Manejo de JWT con Redis:**

  - Blacklist de accessToken en
    logout,
  - almacenamiento seguro de
    refreshToken
  - y guards de Passport/Passport-JWT.

- **Infraestructura con Docker:**

  - Contenedores para PostgreSQL,
    Redis y la API NestJS.
  - Eliminación de dependencia en
    instalaciones locales.
  - Preparación para despliegue en
    producción mediante
    `docker-compose.yml`.

- **Gestión de Código:**
  - Repositorio en GitHub (estructura
    monorepo para backend).
  - Commits siguiendo Conventional
    Commits.
  - Ramas de feature
    (auth-redis-integration,
    email-verification-flow, etc.)
  - y Pull Requests revisados.

## 2. Investigación sobre IA & Detección de Plagio

- **Estado:** Spike JM-37 “Investigación de sistemas de detección de
  plagio” en To Do.
- **Pendiente:** Análisis comparativo de herramientas
- **Solicito:** Actualización breve sobre criterios y resultados del
  análisis para definir el siguiente paso de integración o POC.

## 3. Wireframe de la Página Principal

- **Estado:** Spike JM-39 “Diseño de la interfaz web general” y
  Sub-task JM-40 “Wireframe de la página principal” pendientes.
- **Necesidad:** Requiero información o mockups iniciales
  (paleta, layout, componentes clave) para avanzar en el frontend.

## 4. Pendiente para Proximo sprint si es necesario

- Asignación de Roles --> Puede ser necesario
- Edición de Perfil --> Poco necesario
- Eliminación de Cuenta --> Poco necesario

## Próximos Pasos

- Concluir el Spike de detección de plagio y validar la herramienta
  seleccionada.
- Recibir o generar los wireframes de la home/dashboard.
- Avanzar con la implementación de gestión de publicaciones
  académicas (JM-3).
- Planificar pruebas E2E e integración continua para asegurar calidad.

---

# SPRINT REVIEW - 01

Vamos a evaluar las historias de usuarios que se lograron completar y también comunicarnos
que lograron hacer, así establecemos el proximo sprint.

## Se logro estas HU del Sprint

### JM-24 Registro de Usuario

- DTOs,
- hashing de contraseña,
- persistencia en PostgreSQL con
  Prisma y endpoint funcional en
- NestJS.

### JM-25 Inicio de Sesión

- Validación de credenciales,
- verificación de cuenta activa,
- generación de accessToken y
- refreshToken,
- retorno de LoginResponseDTO.

### JM-26 Recuperación de Contraseña

- Diseño de modelo de tokens,
- endpoints para solicitud y
- validación de token,
- actualización de contraseña.

## Otras tareas que fueron surgiendo a medida que se hicieron estas HU

### Envío de correos con Resend

- EmailService desacoplado,
- plantillas de verificación y
- restablecimiento,
- integración en el flujo de
- registro y “forgot password”.

### Manejo de JWT con Redis

- Blacklist de accessToken en
- logout,
- almacenamiento seguro de
- refreshToken

### Infraestructura con Docker

- Contenedores para PostgreSQL,
- Redis y la API NestJS.
- Eliminación de dependencia en
- instalaciones locales.
- Preparación para despliegue en
- producción mediantedocker-compose.yml.

### Gestión de Código

- Repositorio en GitHub (estructura
  monorepo para backend).
- Commits siguiendo Conventional
- Commits.
- Ramas de feature

## IA

Me gustaria saber si se llego a un acuerdo con que Inteligencia Artificial van a
usar y si lograron establecer algun resultado del por que lo eligen.

## Front

También me gustaría saber algún avance del Wireframe para poder avanzar
y además también ya saber paletas de colores, layout y demás

## Pendiente para Proximo sprint

Aca tomo en cuenta lo que me quedo de este sprint

Asignación de Roles --> Necesario
Edición de Perfil --> Poco necesario
Eliminación de Cuenta --> Poco necesario

Y me falta determinar lo de IA/Plagio y el Wireframe
