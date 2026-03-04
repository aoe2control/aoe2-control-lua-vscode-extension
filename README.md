# aoe2-control-lua

VS Code extension for the **CONTROL** Lua scripting engine used with Age of Empires II: Definitive Edition. CONTROL communicates directly with AoE2:DE to read game state and send commands—no pixel scanning or input simulation.

## Features

- **IntelliSense** — Full API definitions for lifecycle callbacks (`Load`, `Init`, `Update`, `Render`, `End`), game commands, facts, render API, settings, IPC, and types
- **Code snippets** — Quick insert for common CONTROL patterns
- **Lua Language Server integration** — Optional auto-injection of definitions into the workspace library

## Requirements

- [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) (recommended for IntelliSense)

## Extension Settings

| Setting | Description |
|---------|-------------|
| `aoe2ControlLua.autoInjectLibrary` | Automatically add CONTROL API definitions to Lua workspace library for IntelliSense (default: `true`) |

## Release Notes

### 0.0.1

Initial release with IntelliSense support and code snippets for the CONTROL Lua engine.
