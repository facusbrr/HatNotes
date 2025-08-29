# Hat Notes — Segundo Cerebro con Obsidian

Este vault está diseñado como un "segundo cerebro" para capturar, organizar y conectar el conocimiento que adquiero como estudiante de desarrollo de software. Se basa en principios de Zettelkasten, PARA y Second Brain, optimizado para uso con Obsidian y Neovim.
      system_prompt = [[
Este asistente es un clon del usuario, un desarrollador backend experimentado especializado en NodeJS, NestJS y Python con diversos frameworks. Tiene amplia experiencia como Product Owner gestionando proyectos en Jira.

Características clave:
- Profundo conocimiento de arquitecturas backend, patrones de diseño y mejores prácticas
- Experiencia en APIs RESTful, GraphQL y microservicios
- Familiaridad con bases de datos SQL y NoSQL
- Habilidades sólidas en metodologías ágiles, historias de usuario y roadmaps de producto
- Enfoque pragmático para resolver problemas técnicos y de negocio
- Experiencia balanceando requisitos técnicos y necesidades de producto

Al sugerir soluciones, este asistente prioriza enfoques escalables, mantenibles y bien documentados que satisfagan tanto requisitos técnicos como de negocio.
          ]],

---

## 📁 Estructura del Vault

```
HatNotes/              ← Carpeta raíz del Vault
│
├── 0-Inbox/           ← Notas rápidas o sin clasificar aún
├── 1-Tasks/           ← Tareas diarias, acciones o recordatorios
├── 2-Know/            ← Notas atómicas de conocimiento (zettels)
├── 3-Logs/            ← Bitácora diaria: clases, pensamientos, lecturas
├── 4-Projects/        ← Proyectos activos o pasados
├── 5-Hubs/            ← Centros de temas clave (mapas mentales)
├── 6-Ref/             ← (Opcional) Bibliografía, libros, PDFs, papers
├── 7-Tmpl/            ← Plantillas reutilizables para cada tipo de nota
└── README.md          ← Este archivo
```

---

## ¿Cómo usar este sistema?

- 📥 **Inbox (`0-Inbox/`)**: Captura todo lo que se te ocurra: frases, links, ideas.
- ✅ **Tasks (`1-Tasks/`)**: Lista de tareas para revisar a diario o semanalmente.
- 🧠 **Know (`2-Know/`)**: Notas atómicas, cada una con un concepto explicado y enlazado.
- 📓 **Logs (`3-Logs/`)**: Bitácora cronológica, útil como diario o clase anotada.
- 🚀 **Projects (`4-Projects/`)**: Planificación detallada de proyectos personales o académicos.
- 🧭 **Hubs (`5-Hubs/`)**: Vista panorámica sobre temas amplios como [[hub/ingenieria-software]].
- 📚 **Ref (`6-Ref/`)** _(opcional)_: Libros, papers, PDFs, páginas webs citadas.
- 🧰 **Templates (`7-Tmpl/`)**: Carpeta que contiene todas las plantillas base.

---

## 🔑 Principios del sistema

- **Atomicidad**: Cada nota en `2-Know/` debe explicar un solo concepto o idea.
- **Conexión**: Usa enlaces bidireccionales para unir ideas relacionadas.
- **Entrada Única**: Todo comienza por `0-Inbox/` o `3-Logs/` y se refina desde allí.
- **Acción y Reflexión**: Toma decisiones, tareas y notas desde lo que aprendes.

---

## 📄 Plantillas disponibles (`7-Tmpl/`)

- `inbox.md` → Captura rápida
- `task.md` → Tarea detallada
- `know.md` → Conocimiento atómico
- `log.md` → Bitácora diaria (tipo daily note)
- `project.md` → Seguimiento de proyecto
- `hub.md` → Centro de temas enlazados

Cada plantilla está diseñada para ayudarte a no perder el foco y organizar la información de manera sostenible.

---

## ⚙️ Integración con Neovim

Este sistema es compatible con el plugin `obsidian.nvim` para una experiencia fluida en Neovim:

- Crea y abre notas desde Neovim
- Plantillas automáticas para `3-Logs/`
- Keybindings personalizados para abrir la nota diaria (`<leader>od`)

**Nota**: En tu configuración de `obsidian.nvim`, asegúrate de tener:

```lua
daily_notes = {
  folder = "3-Logs",
  template = "7-Tmpl/daily.md",
},
```

---

## 🚀 Flujo de trabajo sugerido

1. **Captura rápida en `0-Inbox/`** cada vez que aprendes, ves o piensas algo.
2. **Revisa tus tareas en `1-Tasks/`** y crea nuevas desde lo aprendido.
3. **Transforma ideas en `2-Know/`**: convierte notas vagas en conocimiento atómico.
4. **Usa `3-Logs/` para diario de estudio o resumen de clases.**
5. **Crea un `4-Projects/` para seguir entregas, objetivos y tareas relacionadas.**
6. **Agrupa conceptos en `5-Hubs/`** por temática para tener contexto global.
7. **Agrega fuentes externas en `6-Ref/` cuando sea necesario.**

---

Este sistema fue diseñado para crecer contigo.  
Puedes adaptarlo libremente a tu flujo de aprendizaje y trabajo profesional.
