# aoe2-control-lua

VS Code extension for the **CONTROL** Lua scripting engine used with Age of Empires II: Definitive Edition. CONTROL communicates directly with AoE2:DE to read game state and send commands—no pixel scanning or input simulation.

## Features

- **IntelliSense** — Full API definitions for lifecycle callbacks (`Load`, `Init`, `Update`, `Render`, `End`), game commands, facts, render API, settings, IPC, and types
- **Updated engine surface** — Includes `IPC.HasMessages()`, `IsObjectTypeAvailable(...)`, `GetAllChatMessages()`, `GetLastChatMessage()`, `GetNewChatMessages()`, `GetProjectileById()`, `GetAllProjectiles()`, `GetProjectilesByType()`, `IsMenuOpen()`, `GetObjectsByClasses(...)`, `ResourceType`, `ProjectileType`, `GetTechCost(...)`, `GetObjectCost(...)`, object name helpers, `Object:GetActionTargetPosition()`, `Object:IsExplored()`, current native pathfinding helpers, the renamed `GetObjectTypeAttribute(...)`, and the renamed `Fact` enum
- **Current construction helpers** — Reflects the renamed `BuildStructure(...)` API, the new `BuildStructureAtTown(...)` helpers, and the `UnitObjectType`-based placement/queue signatures
- **Tournament Mode aware guidance** — Snippets and callback docs steer game commands into `Update()` while keeping read-only queries available in `Init()` and `Render()`
- **Spectator Mode note** — Command guidance reflects that controls remain available when CONTROL's `"Spectator Mode"` option is enabled
- **Code snippets** — Quick insert for common CONTROL patterns
- **Lua Language Server integration** — Optional auto-injection of definitions into the workspace library

## Requirements

- [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) (recommended for IntelliSense)

## Extension Settings

| Setting | Description |
|---------|-------------|
| `aoe2ControlLua.autoInjectLibrary` | Automatically add CONTROL API definitions to Lua workspace library for IntelliSense (default: `true`) |

## Release Notes

### Unreleased

- Added IntelliSense for `IPC.HasMessages()`
- Added IntelliSense for `IsObjectTypeAvailable(...)`, `CalculatePath(...)`, and `Object:GetPath()`
- Added IntelliSense for `GetAllChatMessages()`, `GetLastChatMessage()`, `GetNewChatMessages()`, and `IsMenuOpen()`
- Added IntelliSense for `GetObjectsByClasses(...)` on both globals and `Player`
- Added IntelliSense for `ResourceType`, `GetTechCost(...)`, and `GetObjectCost(...)` on both globals and `Player`
- Added a snippet for iterating `ResourceCost` results from the new cost helpers
- Added IntelliSense for `GetProjectileById()`, `GetAllProjectiles()`, `GetProjectilesByType()`, `ProjectileType`, `Object:GetName()`, `Object:GetInternalName()`, and `Object:GetMasterName()`
- Added IntelliSense for `Object:GetActionTargetPosition()`
- Added IntelliSense for `Object:IsExplored()`
- Added IntelliSense for `Object:CalculatePath(...)`
- Added the auto-source `TrainUnit(unitId, amount?)` overload
- Renamed the global object-type attribute helper to `GetObjectTypeAttribute(...)`
- Renamed enum `FactId` to `Fact`
- Renamed `ChatMessage(...)` to `SendChatMessage(...)` to match the engine binding
- Updated `ConstructionPlacement` docs for the renamed `BuildStructure(...)` helpers and `BuildStructureAtTown(...)`
- Updated `FindBestPosition(...)`, building queue helpers, and `IsStructureTypeQueued(...)` to use `UnitObjectType` instead of manual building size or raw ids
- Documented `ResourceTracker:Update()` as the resource refresh entry point for repopulated resource discovery
- Documented `ResourceTracker:Cleanup()` for pruning visibly missing cached resources
- Updated `CalculatePath(...)` docs and snippets to use `Vector3` and return the waypoint list directly
- Updated `MapTile:IsWalkable()` documentation to reflect collision-aware checks
- Documented restricted cross-player data access when "Modules See Everything" is disabled
- Documented that assigning a module suppresses native AI actions for that player
- Updated lifecycle/snippet guidance for Tournament Mode command restrictions
- Documented that command bindings remain available when `"Spectator Mode"` is enabled
- Documented that `End(hasWon)` also fires on manual game exit and reports `false` in that case

### 0.0.1

Initial release with IntelliSense support and code snippets for the CONTROL Lua engine.
