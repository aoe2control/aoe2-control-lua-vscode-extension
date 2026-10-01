# AoE2 CONTROL Lua

Completion, hover help and snippets for writing modules for
[CONTROL](https://aoe2control.github.io/), the Lua scripting engine for Age of Empires II:
Definitive Edition.

## What it does

- Adds the CONTROL Lua API to the [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua):
  every function, type and enum with its parameters, return values and a short description.
- Adds snippets for the module callbacks and common patterns. Their prefixes are the callback
  names (`Load`, `Update`, ...) and short names such as `control-module`, `game-options` and
  `ipc-drain`.

## Setup

1. Install this extension. VS Code installs the Lua Language Server with it.
2. Open your CONTROL modules folder, or any folder that contains a module entry file
   (`*.main.lua` or `*.main.module`).

The extension starts only in such folders. It then adds its API definitions to the folder's
`Lua.workspace.library` setting, which VS Code stores in `.vscode/settings.json`.

## Settings

| Setting | Default | Description |
|---------|---------|-------------|
| `aoe2ControlLua.autoInjectLibrary` | `true` | Adds the CONTROL API definitions to the workspace's `Lua.workspace.library` setting. Turn it off to manage that setting yourself. |

## Versions

The extension's version follows the CONTROL version it describes: 1.1.x matches CONTROL 1.1.
Changes are listed in the [changelog](CHANGELOG.md).

## Links

- [CONTROL documentation](https://aoe2control.github.io/)
- [Lua API reference for AI coding agents](https://aoe2control.github.io/ai-agent-reference/)

## License

MIT. See [LICENSE](LICENSE).
