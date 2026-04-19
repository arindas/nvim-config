# Neovim config restructure TODO

Goal: restructure directory layout with `common/` (not `util/`) while keeping config working after each step.

## Plan (incremental, bootable after each step)

- [x] 1. Create new top-level module folders: `lua/core`, `lua/plugins`, `lua/config`, `lua/common`.
- [x] 2. Move core files (`options`, `keymaps`, `autocmds`) from `lua/user` to `lua/core` and update `init.lua` requires.
- [x] 3. Move plugin-specific config modules from `lua/user/*` to `lua/config/*` (start with simple UI/editor modules) and add compatibility shims where needed.
- [x] 4. Extract plugin specs from monolithic `lua/config/lazy.lua` into domain files under `lua/plugins/*.lua` while preserving behavior.
- [x] 5. Update lazy setup to load plugin specs from `lua/plugins`.
- [ ] 6. Migrate LSP tree from `lua/user/lsp` to `lua/config/lsp` and update references.
- [ ] 7. Migrate remaining feature configs (`dap`, `cmp`, `telescope`, etc.) to `lua/config` and remove old `lua/user` references.
- [ ] 8. Add `lua/core/init.lua` entrypoint and simplify root `init.lua`.
- [ ] 9. Remove compatibility shims and delete obsolete `lua/user` files once everything is stable.
- [ ] 10. Final cleanup: format Lua files, update README structure notes.

## Validation after each step

- Open Neovim without startup errors.
- Run `:checkhealth` basics.
- Smoke test: file tree toggle, LSP attach, telescope picker, statusline render.
