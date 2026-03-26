# Change Log

All notable changes to the "aoe2-control-lua" extension will be documented in this file.

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

## [Unreleased]

- Added `IPC.HasMessages()` to the CONTROL API definitions and snippets
- Added `IsObjectTypeAvailable(...)`, `CalculatePath(...)`, and `Object:GetPath()` to the CONTROL API definitions
- Added `GetAllChatMessages()`, `GetLastChatMessage()`, `GetNewChatMessages()`, and `IsMenuOpen()` to the CONTROL API definitions
- Added replay helpers `IsGamePaused()`, `SetGamePaused(...)`, `SetReplaySpeed(...)`, `GetCurrentReplayFileName()`, and enum `ReplaySpeed` to the CONTROL API definitions
- Added `DispatchStartGame()`, `DispatchRestartGame()`, `DispatchResignGame()`, `DispatchQuitGame()`, `DispatchLoadGame(...)`, `GetAvailableSaveFiles()`, `GetCurrentGameOptions()`, `SetEngineUIVisibility(...)`, and `UnloadEngine()` to the CONTROL API definitions
- Added `GameOptions` and enums `OptionsAIDifficulty`, `OptionsCivilizationSet`, `OptionsGameMode`, `OptionsMapSize`, `OptionsAge`, `OptionsRevealMap`, `OptionsVictory`, `OptionsResources`, `OptionsLocation`, and `OptionsCivilization` to the CONTROL API definitions
- Added `GetObjectsByClasses(...)` as both a global helper and a `Player` method in the CONTROL API definitions
- Added `ResourceType`, `GetTechCost(...)`, and `GetObjectCost(...)` to the CONTROL API definitions
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
- Updated `ConstructionPlacement` for the renamed `BuildStructure(...)` helpers and new `BuildStructureAtTown(...)` overloads
- Updated `FindBestPosition(...)`, `QueueBuildingRequest(...)`, `QueueBuildingRequestAtTown(...)`, and `IsStructureTypeQueued(...)` to use `UnitObjectType`-based signatures
- Documented `ResourceTracker:Update()` as the refresh call for repopulated resource tracking
- Documented `ResourceTracker:Cleanup()` for removing visibly missing cached resources
- Updated `MapTile:IsWalkable()` docs to reflect collision-aware checks
- Clarified that vector coordinate fields use lowercase names (`x`, `y`, `z`, `w`) and added lowercase vector constructor snippets
- Documented restricted access to other-player data when "Modules See Everything" is disabled
- Documented that assigning a module suppresses native AI actions for that player
- Updated lifecycle and callback guidance for Tournament Mode command restrictions
- Documented that command bindings remain available when `"Spectator Mode"` is enabled
- Documented that `End(hasWon)` also fires when a replay ends, and still reports `false` on manual exit
