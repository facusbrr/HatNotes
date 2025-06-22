return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "HatNotes",
        path = "~/HatNotes/",
      },
    },

    -- Subdirectorio predeterminado para nuevas notas generales
    notes_subdir = "0-Inbox",

    -- Subdirectorio para notas de conocimiento
    knowledge_subdir = "1-Knowledge",

    -- Subdirectorio para hubs temáticos
    hubs_subdir = "2-Hubs",

    -- Subdirectorio para tareas
    tasks_subdir = "4-Tasks",

    use_advanced_uri = true,

    picker = {
      name = "snacks.pick",
    },

    -- Configuración de notas diarias
    daily_notes = {
      folder = "3-Logs",
      date_format = "%Y-%m-%d",
      alias_format = "%A, %B %d",
      template = "daily.md",  -- Nota: considerar renombrar a daily-tmpl.md para consistencia
    },

    templates = {
      subdir = "7-Tmpl",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      tags = "",

      -- Plantillas específicas para cada tipo de nota
      new_note = "inbox-tmpl.md",
      daily = "daily.md",     -- Nota: considerar renombrar a daily-tmpl.md para consistencia
      
      -- Nuevas plantillas añadidas
      knowledge = "know-tmpl.md",
      hub = "hub-tmpl.md",
      log = "log-tmpl.md",
      task = "task-tmpl.md",
    },

    -- Comandos personalizados para crear diferentes tipos de notas
    commands = {
      -- Comando para crear una nueva nota de conocimiento
      ["ObsidianNewKnowledge"] = {
        action = function()
          return require("obsidian").commands.new_note({ template = "know-tmpl.md", folder = "1-Knowledge" })
        end,
        opts = {},
      },
      
      -- Comando para crear un nuevo hub temático
      ["ObsidianNewHub"] = {
        action = function()
          return require("obsidian").commands.new_note({ template = "hub-tmpl.md", folder = "2-Hubs" })
        end,
        opts = {},
      },
      
      -- Comando para crear un nuevo registro (log)
      ["ObsidianNewLog"] = {
        action = function()
          return require("obsidian").commands.new_note({ template = "log-tmpl.md", folder = "3-Logs" })
        end,
        opts = {},
      },
      
      -- Comando para crear una nueva tarea
      ["ObsidianNewTask"] = {
        action = function()
          return require("obsidian").commands.new_note({ template = "task-tmpl.md", folder = "4-Tasks" })
        end,
        opts = {},
      },
      
      -- Comando para abrir la nota diaria
      ["ObsidianToday"] = {
        action = function()
          return require("obsidian").commands.daily()
        end,
        opts = {},
      },
    },

    mappings = {
      -- Mapeos existentes
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      
      -- Nuevos mapeos para facilitar el flujo de trabajo
      
      -- Atajo para abrir la nota diaria
      ["<leader>od"] = {
        action = function()
          return require("obsidian").commands.daily()
        end,
        opts = { buffer = false },
      },
      
      -- Atajo para crear una nueva nota en inbox
      ["<leader>on"] = {
        action = function()
          return require("obsidian").commands.new_note()
        end,
        opts = { buffer = false },
      },
      
      -- Atajo para buscar en todas las notas
      ["<leader>of"] = {
        action = function()
          return require("obsidian").commands.search()
        end,
        opts = { buffer = false },
      },
      
      -- Atajo para crear un enlace a otra nota
      ["<leader>ol"] = {
        action = function()
          return require("obsidian").commands.add_link()
        end,
        opts = { buffer = true },
      },
      
      -- Atajo para seguir un enlace bajo el cursor
      ["<leader>oo"] = {
        action = function()
          return require("obsidian").commands.follow_link()
        end,
        opts = { buffer = true },
      },
    },
  },
}

