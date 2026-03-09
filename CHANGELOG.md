# Change Log

All notable changes to the "aoe2-control-lua" extension will be documented in this file.

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

## [Unreleased]

- Added `IPC.HasMessages()` to the CONTROL API definitions and snippets
- Added `IsObjectAvailable(...)`, `CalculatePath(...)`, and `GetPath()` to the CONTROL API definitions
- Renamed `GetObjectAttribute(...)` to `GetObjectTypeAttribute(...)`
- Renamed enum `FactId` to `Fact`
- Updated `MapTile:IsWalkable()` docs to reflect collision-aware checks
- Documented restricted access to other-player data when "Modules See Everything" is disabled
- Documented that assigning a module suppresses native AI actions for that player
- Updated lifecycle and callback guidance for Tournament Mode command restrictions
