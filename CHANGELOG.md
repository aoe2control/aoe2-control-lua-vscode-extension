# Changelog

The extension's version follows the CONTROL version its definitions describe: 1.1.x matches
CONTROL 1.1.

## 1.1.0 (unreleased)

- The definitions match the CONTROL 1.1.0 Lua API. New: random-map control (`RandomMapSource`,
  `GetAvailableRandomMapSources()`, the `GameOptions` seed and source methods), the Agent Bridge,
  `CheckPlacement()` and `CanPlaceObject()`, the large-game object calls (`GetObjectStates()`,
  `GetObjectChanges()`, object counts), `GetClockMs()` and `GetModuleTelemetry()`,
  `Object:GetSprite()`, `Object:GetTypeName()`, foundations, `SetFormation()`, the vector methods
  and `IPC.GetStats()`. See the [CONTROL 1.1.0 release notes](https://github.com/aoe2control/AoE2Control/releases).
- `Object:GetInternalName()` is now `Object:GetGraphicFileName()`, and `Object:GetMasterName()` is
  removed, as in CONTROL 1.1.0.
- Corrected `Color()` ranges, `PlayerAttribute.AGE`, `OptionsGameMode.UNAVAILABLE`, the `Key`
  names and `Technology.BLOODLINES`, and marked the values that are `nil` with Multithreading on.
- Removed `ResourceTracker()`, `VillagerOccupation()` and `ConstructionPlacement()`, which fail in
  the engine (use `.new(...)`), and `Player:GetObjectsByClasses()`, which exists only as the global
  `GetObjectsByClasses()`.
- `SendBackToWork()`, `SendAllBackToWork()`, `SetUnitStanceGuard()` and `SetUnitStanceFollow()` are
  described as working commands again, as in CONTROL 1.1.0.
- Removed the `BuildingPosition` enum, as in CONTROL 1.1.0.
- The extension now starts only in folders that contain CONTROL entry files (`*.main.lua` or
  `*.main.module`), instead of in every folder with Lua files.
- Installing the extension now also installs the Lua Language Server.
- Renamed the extension to "AoE2 CONTROL Lua".

## 0.9.0

- Added `IPC.HasMessages()` to the CONTROL API definitions and snippets
- Added `IPC.WaitForMessage(...)` to the CONTROL API definitions
- Added `IsObjectTypeAvailable(...)`, `CalculatePath(...)`, and `Object:GetPath()` to the CONTROL API definitions
- Added `GetAllChatMessages()`, `GetLastChatMessage()`, `GetNewChatMessages()`, and `IsMenuOpen()` to the CONTROL API definitions
- Added replay helpers `IsGamePaused()`, `SetGamePaused(...)`, `SetReplaySpeed(...)`, `GetCurrentReplayFileName()`, and enum `ReplaySpeed` to the CONTROL API definitions
- Added `DispatchStartGame()`, `DispatchRestartGame()`, `DispatchResignGame()`, `DispatchQuitGame()`, `DispatchLoadGame(...)`, `GetAvailableSaveFiles()`, `GetCurrentGameOptions()`, `SetEngineUIVisibility(...)`, and `UnloadEngine()` to the CONTROL API definitions
- Added `AssignAndLoadModule(...)` to the CONTROL API definitions
- Added `GameOptions` and enums `OptionsAIDifficulty`, `OptionsCivilizationSet`, `OptionsGameMode`, `OptionsMapSize`, `OptionsAge`, `OptionsRevealMap`, `OptionsVictory`, `OptionsResources`, `OptionsLocation`, and `OptionsCivilization` to the CONTROL API definitions
- Added `GameOptions:SetRandomMapPoolLocations(...)` and `OptionsLocation.CUSTOM_MAP_POOL` to the CONTROL API definitions
- Added `GameOptions:SetAssignedPlayerCivilization(...)` to the CONTROL API definitions
- Added `MapTile:IsBuildable`, `VillagerOccupation:GetIdleVillagerCount`, `VillagerOccupation:GetIdleVillagers`, `VillagerOccupation:GetPriorityPercentage`, `ConstructionPlacement:SetTownCenterPadding`, and `ConstructionPlacement:GetValidFarmPlacementTile` to the CONTROL API definitions
- Added `VillagerOccupation:SetLivestockVillagerLimit(...)`, `SetForageVillagerLimit(...)`, `SetFarmMaxTownCenterDistance(...)`, `SetFarmMaxMillDistance(...)`, and `SetProfessionBuildingRange(...)` to the CONTROL API definitions
- Added `GetObjectsByClasses(...)` as both a global helper and a `Player` method in the CONTROL API definitions
- Added `ResourceType`, `GetTechCost(...)`, and `GetObjectCost(...)` to the CONTROL API definitions
- Expanded the `ResourceType` enum to match the engine's current values
- Added `GetTechCost(...)` and `GetObjectCost(...)` as `Player` methods in the CONTROL API definitions
- Added a snippet for iterating `ResourceCost` results
- Added snippets for `GetCurrentGameOptions()`, `DispatchStartGame()`, and `DispatchLoadGame(...)`
- Added `GetProjectileById()`, `GetAllProjectiles()`, `GetProjectilesByType()`, `ProjectileType`, `Object:GetName()`, `Object:GetInternalName()`, and `Object:GetMasterName()` to the CONTROL API definitions
- Added `Object:GetActionTargetPosition()` to the CONTROL API definitions and snippets
- Added `Object:IsExplored()` to the CONTROL API definitions
- Added `Object:CalculatePath(...)` to the CONTROL API definitions and snippets
- Added the auto-source `TrainUnit(unitId, amount?)` overload to the CONTROL API definitions and snippets
- Updated `CalculatePath(...)` to use `Vector3` and return waypoint lists directly
- Added `ObjectType` to the CONTROL API definitions
- Renamed `GetObjectAttribute(...)` to `GetObjectTypeAttribute(...)`
- Renamed enum `FactId` to `Fact`
- Renamed `ChatMessage(...)` to `SendChatMessage(...)` to match the engine binding
- Renamed `MapTile:GetPos()` to `MapTile:GetPosition()`
- Updated `ResearchTechnology(...)` to auto-resolve a valid source
- Corrected curated `UnitObjectType` building names to match the engine enum
- Updated `ConstructionPlacement` for the renamed `BuildStructure(...)` helpers and new `BuildStructureAtTown(...)` overloads
- Updated `ConstructionPlacement` for the new overloads that omit `bypassTownCenterPadding`
- Updated `FindBestPosition(...)`, `QueueBuildingRequest(...)`, `QueueBuildingRequestAtTown(...)`, and `IsStructureTypeQueued(...)` to use `UnitObjectType`-based signatures
- Documented `ResourceTracker:Update()` as the refresh call for repopulated resource tracking
- Clarified that `ResourceTracker:GetDeadLivestock(...)` still returns tracked dead livestock even though most object queries filter to alive objects
- Documented the new villager farming-limit and building-range tuning helpers on `VillagerOccupation`
- Updated Tournament Mode guidance to note restrictions on selected engine, render, and `GameOptions` helpers
- Documented that `Object:GetId()` remains available for explored resources and animals even when other object methods are restricted
- Updated `MapTile:IsWalkable()` docs to reflect collision-aware checks
- Clarified that vector coordinate fields use lowercase names (`x`, `y`, `z`, `w`) and added lowercase vector constructor snippets
- Documented restricted access to other-player data when "Modules See Everything" is disabled
- Documented that assigning a module suppresses native AI actions for that player
- Updated lifecycle and callback guidance for Tournament Mode command restrictions
- Documented that command bindings remain available when `"Spectator Mode"` is enabled
- Documented that `End(hasWon)` also fires when a replay ends, and still reports `false` on manual exit
