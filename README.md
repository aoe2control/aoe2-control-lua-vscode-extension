# aoe2-control-lua

VS Code extension for the **CONTROL** Lua scripting engine used with Age of Empires II: Definitive Edition. CONTROL communicates directly with AoE2:DE to read game state and send commands—no pixel scanning or input simulation.

## Features

- **IntelliSense** — Full API definitions for lifecycle callbacks (`Load`, `Init`, `Update`, `Render`, `End`), game commands, facts, render API, settings, IPC, and types
- **Updated engine surface** — Includes `IPC.HasMessages()`, `IsObjectTypeAvailable(...)`, `GetAllChatMessages()`, `GetLastChatMessage()`, `GetNewChatMessages()`, `GetProjectileById()`, `GetAllProjectiles()`, `GetProjectilesByType()`, `IsMenuOpen()`, replay helpers (`IsGamePaused()`, `SetGamePaused(...)`, `SetReplaySpeed(...)`, `GetCurrentReplayFileName()`), menu/game control helpers (`DispatchStartGame()`, `DispatchRestartGame()`, `DispatchResignGame()`, `DispatchQuitGame()`, `DispatchLoadGame(...)`, `GetAvailableSaveFiles()`), engine control helpers (`SetEngineUIVisibility(...)`, `UnloadEngine()`, `AssignAndLoadModule(...)`), `GetCurrentGameOptions()`, `GameOptions`, `GameOptions:SetRandomMapPoolLocations(...)`, `GameOptions:SetAssignedPlayerCivilization(...)`, `OptionsLocation.CUSTOM_MAP_POOL`, `MapTile:GetPosition()`, `MapTile:IsBuildable()`, `VillagerOccupation:GetIdleVillagerCount()`, `VillagerOccupation:GetIdleVillagers()`, `VillagerOccupation:GetPriorityPercentage()`, `VillagerOccupation:SetLivestockVillagerLimit(...)`, `VillagerOccupation:SetForageVillagerLimit(...)`, `VillagerOccupation:SetFarmMaxTownCenterDistance(...)`, `VillagerOccupation:SetFarmMaxMillDistance(...)`, `VillagerOccupation:SetProfessionBuildingRange(...)`, `ConstructionPlacement:SetTownCenterPadding(...)`, `ConstructionPlacement:GetValidFarmPlacementTile()`, the related `Options*` enums, `GetObjectsByClasses(...)`, expanded `ResourceType`, `ProjectileType`, `ReplaySpeed`, `GetTechCost(...)`, `GetObjectCost(...)`, object name helpers, `Object:GetActionTargetPosition()`, `Object:IsExplored()`, current native pathfinding helpers, the renamed `GetObjectTypeAttribute(...)`, and the renamed `Fact` enum
- **Current construction helpers** — Reflects the renamed `BuildStructure(...)` API, the new `BuildStructureAtTown(...)` helpers, the added no-`bypassTownCenterPadding` overloads, `SetTownCenterPadding(...)`, `GetValidFarmPlacementTile()`, and the `UnitObjectType`-based placement/queue signatures
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
- Added IntelliSense for replay helpers `IsGamePaused()`, `SetGamePaused(...)`, `SetReplaySpeed(...)`, `GetCurrentReplayFileName()`, and enum `ReplaySpeed`
- Added IntelliSense for `DispatchStartGame()`, `DispatchRestartGame()`, `DispatchResignGame()`, `DispatchQuitGame()`, `DispatchLoadGame(...)`, `GetAvailableSaveFiles()`, `GetCurrentGameOptions()`, `SetEngineUIVisibility(...)`, and `UnloadEngine()`
- Added IntelliSense for `AssignAndLoadModule(...)` for dynamic in-module reassignment and reloads
- Added IntelliSense for `GameOptions` and enums `OptionsAIDifficulty`, `OptionsCivilizationSet`, `OptionsGameMode`, `OptionsMapSize`, `OptionsAge`, `OptionsRevealMap`, `OptionsVictory`, `OptionsResources`, `OptionsLocation`, and `OptionsCivilization`
- Added IntelliSense for `GameOptions:SetRandomMapPoolLocations(...)` and `OptionsLocation.CUSTOM_MAP_POOL`
- Added IntelliSense for `GameOptions:SetAssignedPlayerCivilization(...)`
- Added IntelliSense for `MapTile:GetPosition()`, `MapTile:IsBuildable()`, `VillagerOccupation:GetIdleVillagerCount()`, `VillagerOccupation:GetIdleVillagers()`, `VillagerOccupation:GetPriorityPercentage()`, `ConstructionPlacement:SetTownCenterPadding(...)`, and `ConstructionPlacement:GetValidFarmPlacementTile()`
- Added IntelliSense for `VillagerOccupation:SetLivestockVillagerLimit(...)`, `SetForageVillagerLimit(...)`, `SetFarmMaxTownCenterDistance(...)`, `SetFarmMaxMillDistance(...)`, and `SetProfessionBuildingRange(...)`
- Added IntelliSense for `GetObjectsByClasses(...)` on both globals and `Player`
- Added IntelliSense for `ResourceType`, `GetTechCost(...)`, and `GetObjectCost(...)` on both globals and `Player`
- Expanded the `ResourceType` enum to match the engine's current values
- Added a snippet for iterating `ResourceCost` results from the new cost helpers
- Added snippets for `GetCurrentGameOptions()`, `DispatchStartGame()`, and `DispatchLoadGame(...)`
- Added IntelliSense for `GetProjectileById()`, `GetAllProjectiles()`, `GetProjectilesByType()`, `ProjectileType`, `Object:GetName()`, `Object:GetInternalName()`, and `Object:GetMasterName()`
- Added IntelliSense for `Object:GetActionTargetPosition()`
- Added IntelliSense for `Object:IsExplored()`
- Added IntelliSense for `Object:CalculatePath(...)`
- Added the auto-source `TrainUnit(unitId, amount?)` overload
- Renamed the global object-type attribute helper to `GetObjectTypeAttribute(...)`
- Renamed enum `FactId` to `Fact`
- Renamed `ChatMessage(...)` to `SendChatMessage(...)` to match the engine binding
- Renamed `MapTile:GetPos()` to `MapTile:GetPosition()`
- Updated `ResearchTechnology(...)` to auto-resolve a valid source
- Updated `ConstructionPlacement` docs for the renamed `BuildStructure(...)` helpers and `BuildStructureAtTown(...)`
- Updated `ConstructionPlacement` docs for the new overloads that omit `bypassTownCenterPadding`
- Updated `FindBestPosition(...)`, building queue helpers, and `IsStructureTypeQueued(...)` to use `UnitObjectType` instead of manual building size or raw ids
- Documented `ResourceTracker:Update()` as the resource refresh entry point for repopulated resource discovery
- Documented `ResourceTracker:Cleanup()` for pruning visibly missing cached resources
- Clarified that `ResourceTracker:GetDeadLivestock(...)` still returns tracked dead livestock even though most object queries filter to alive objects
- Documented the new villager farming-limit and building-range tuning helpers on `VillagerOccupation`
- Updated `CalculatePath(...)` docs and snippets to use `Vector3` and return the waypoint list directly
- Updated `MapTile:IsWalkable()` documentation to reflect collision-aware checks
- Documented restricted cross-player data access when "Modules See Everything" is disabled
- Documented that assigning a module suppresses native AI actions for that player
- Updated lifecycle/snippet guidance for Tournament Mode command restrictions, including selected engine, render, and GameOptions helpers
- Documented that command bindings remain available when `"Spectator Mode"` is enabled
- Documented that `Object:GetId()` remains available for explored resources and animals even when other object methods are restricted
- Documented that `End(hasWon)` also fires when a replay ends, and still reports `false` on manual game exit

### 0.0.1

Initial release with IntelliSense support and code snippets for the CONTROL Lua engine.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
