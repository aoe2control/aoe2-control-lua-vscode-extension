# Change Log

All notable changes to the "aoe2-control-lua" extension will be documented in this file.

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

## [Unreleased]

- Added `IPC.HasMessages()` to the CONTROL API definitions and snippets
- Added `IsObjectTypeAvailable(...)`, `CalculatePath(...)`, and `GetPath()` to the CONTROL API definitions
- Added `GetAllChatMessages()`, `GetLastChatMessage()`, `GetNewChatMessages()`, and `IsMenuOpen()` to the CONTROL API definitions
- Added `ResourceType`, `GetTechCost(...)`, and `GetObjectCost(...)` to the CONTROL API definitions
- Added `GetTechCost(...)` and `GetObjectCost(...)` as `Player` methods in the CONTROL API definitions
- Added a snippet for iterating `ResourceCost` results
- Renamed `GetObjectAttribute(...)` to `GetObjectTypeAttribute(...)`
- Renamed enum `FactId` to `Fact`
- Renamed `ChatMessage(...)` to `SendChatMessage(...)` to match the engine binding
- Updated `MapTile:IsWalkable()` docs to reflect collision-aware checks
- Documented restricted access to other-player data when "Modules See Everything" is disabled
- Documented that assigning a module suppresses native AI actions for that player
- Updated lifecycle and callback guidance for Tournament Mode command restrictions
- Documented that command bindings remain available when `"Spectator Mode"` is enabled
- Documented that `End(hasWon)` also fires on manual exit and reports `false` then
