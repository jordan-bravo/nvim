# Jordan Bravo's Neovim config

## TODO

- [x] Configure lazy.nvim
- [x] Configure Neotree
- [x] Configure Telescope
- Configure language tools:
  - [x] Python
    - [x] Completions
    - [x] Type checking
    - [x] Formatting
    - [x] Linting
  - [x] Lua
    - [x] Completions
    - [x] Type checking
    - [x] Formatting
    - [x] Linting (luacheck shows error accessing vim global variable)
  - [ ] Nix
    - [x] Completions
    - [ ] Type checking
    - [ ] Formatting
    - [ ] Linting
  - [x] TypeScript
    - [x] Completions
    - [x] Type checking
    - [x] Formatting
    - [ ] Linting
  - [ ] Rust
    - [ ] Completions
    - [ ] Type checking
    - [ ] Formatting
    - [ ] Linting
  - [x] Go
    - [x] Completions
    - [x] Type checking
    - [x] Formatting
    - [x] Linting
  - [ ] Shell
    - [ ] Completions
    - [ ] Type checking
    - [ ] Formatting
    - [ ] Linting

## Research

Article explaining how to search with Telescope in specific directories: https://miguelcrespo.co/using-telescope-to-find-text-inside-paths

- In Nix files, enable formatting with command (space, m, p).
- Need session management. First research, what are "workspaces" in the context of (neo)vim?
  - Look into [auto-session](https://github.com/rmagatti/auto-session) with telescope integration via [session-lens](https://github.com/rmagatti/session-lens)
  - nvim-telescope/telescope-project.nvim
  - ahmedkhalf/project.nvim
- Look into the plugin [neodev](https://github.com/folke/neodev.nvim), which helps editing nvim specific lua files
