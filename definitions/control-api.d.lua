---@meta
---CONTROL Lua Engine API definitions for Age of Empires II: Definitive Edition.
---Use with Lua Language Server (sumneko.lua) for IntelliSense.
---Reference: https://airef.github.io for UnitObjectType, UnitClass, Technology IDs.

-- =============================================================================
-- LIFECYCLE CALLBACKS (optional; implement only what you need)
-- =============================================================================

---When a module is assigned to a player, native AI actions for that player are suppressed.

---Called when module is selected or AI is enabled. Use for Settings.Add* only. Do NOT call game API.
---@param assignedPlayerId integer Player assigned to this module instance.
function Load(assignedPlayerId) end

---Called when game is ready, world changed, module reloaded, or AI enabled. One-time setup.
---Prefer read-only initialization here; Tournament Mode can block game commands outside Update().
function Init() end

---Called at configurable interval (default 1.0s) while game runs. Main game logic.
---Use this callback for game commands, especially when Tournament Mode is enabled.
function Update() end

---Called every frame while game runs. Use for drawing overlays and read-only facts.
---Avoid game commands here; Tournament Mode can block them outside Update().
function Render() end

---Called once when game ends, a replay ends, or the match is exited manually.
---On manual exit, `hasWon` is `false`.
---@param hasWon boolean Whether the assigned player won.
function End(hasWon) end

---Called when module is unloaded, AI is disabled, or engine is ejected. Use for IPC cleanup.
function Unload() end

-- =============================================================================
-- TYPES
-- =============================================================================

---@class Vector2
---@field x number X coordinate. Use lowercase field names for vector components.
---@field y number Y coordinate. Use lowercase field names for vector components.
---@field new fun(x: number, y: number): Vector2
Vector2 = {}

---@param x number
---@param y number
---@return Vector2
function Vector2.new(x, y) end

---@deprecated Use `Vector2.new(...)`.
---@param x number
---@param y number
---@return Vector2
function Vector2(x, y) end

---@class Vector3
---@field x number X coordinate. Use lowercase field names for vector components.
---@field y number Y coordinate. Use lowercase field names for vector components.
---@field z number Z coordinate. Use lowercase field names for vector components.
---@field new fun(x: number, y: number, z: number): Vector3
Vector3 = {}

---@param x number
---@param y number
---@param z number
---@return Vector3
function Vector3.new(x, y, z) end

---@deprecated Use `Vector3.new(...)`.
---@param x number
---@param y number
---@param z number
---@return Vector3
function Vector3(x, y, z) end

---@class Vector4
---@field x number X coordinate. Use lowercase field names for vector components.
---@field y number Y coordinate. Use lowercase field names for vector components.
---@field z number Z coordinate. Use lowercase field names for vector components.
---@field w number W coordinate. Use lowercase field names for vector components.
---@field new fun(x: number, y: number, z: number, w: number): Vector4
Vector4 = {}

---@param x number
---@param y number
---@param z number
---@param w number
---@return Vector4
function Vector4.new(x, y, z, w) end

---@deprecated Use `Vector4.new(...)`.
---@param x number
---@param y number
---@param z number
---@param w number
---@return Vector4
function Vector4(x, y, z, w) end

---@class Color
---@field new fun(r: number, g: number, b: number, a?: number): Color
---@field Parse fun(hexStr: string): Color
---@field HSV fun(h: number, s: number, v: number): Color
Color = {}

---Create color. Values 0-255.
---@param r number Red (0-255)
---@param g number Green (0-255)
---@param b number Blue (0-255)
---@param a? number Alpha (0-255, optional)
---@return Color
function Color.new(r, g, b, a) end

---Parse color from hex string.
---@param hexStr string
---@return Color
function Color.Parse(hexStr) end

---Create color from HSV.
---@param h number Hue
---@param s number Saturation
---@param v number Value
---@return Color
function Color.HSV(h, s, v) end

---@class ResourceCost
---@field [1] ResourceType
---@field [2] integer
---@field resourceId ResourceType
---@field amount integer

---@class MapTile
---Map tile from GetMapTile or GetAllMapTiles.
MapTile = {}

---@return Vector2
function MapTile:GetPos() end

---@return Terrain
function MapTile:GetTerrain() end

---@return integer
function MapTile:GetElevation() end

---@return TileVisibility
function MapTile:GetTileVisibility() end

---Returns whether the tile is walkable after terrain and collision checks.
---@return boolean
function MapTile:IsWalkable() end

---@return boolean
function MapTile:IsNavigatable() end

---@return integer
function MapTile:GetObjectCount() end

---@return Object[]
function MapTile:GetObjects() end

---@class Object
---Unit, building, or projectile from object and projectile query helpers.
Object = {}

---@return integer
function Object:GetId() end

---@return string
function Object:GetName() end

---@return string
function Object:GetInternalName() end

---@return string
function Object:GetMasterName() end

---@return ObjectType
function Object:GetObjectType() end

---@return Player|nil
function Object:GetOwningPlayer() end

---@return Object|nil
function Object:GetGarrisonObject() end

---@return Vector3
function Object:GetTargetPosition() end

---@return Vector3|nil
function Object:GetActionTargetPosition() end

---@return Object|nil
function Object:GetTargetObject() end

---@return Vector3
function Object:GetDirection() end

---@return Vector3
function Object:GetPosition() end

---@return MapTile|nil
function Object:GetCurrentMapTile() end

---@return number
function Object:GetHitpoints() end

---@return number
function Object:GetMaxHitpoints() end

---@return boolean
function Object:IsAlive() end

---@return UnitObjectType
function Object:GetUnitObjectType() end

---@return UnitClass
function Object:GetClass() end

---@param attribute ObjectAttribute
---@param damageType? integer
---@return number
function Object:GetAttribute(attribute, damageType) end

---@param objectData ObjectData
---@return integer
function Object:GetObjectData(objectData) end

---Get this object's current native path as world positions.
---@return Vector3[]
function Object:GetPath() end

---Calculate a path from this object's current position to a target world position.
---@param targetPos Vector3
---@return Vector3[]
function Object:CalculatePath(targetPos) end

---@return boolean
function Object:IsIdle() end

---@return boolean
function Object:IsMoving() end

---@return boolean
function Object:IsScouting() end

---@return boolean
function Object:IsVisible() end

---@return boolean
function Object:IsExplored() end

---@class Player
---Player from GetAssignedPlayer, GetPlayerById.
---Access to other players' facts, attributes, tech, and object queries may be limited
---when "Modules See Everything" is disabled.
Player = {}

---@return integer
function Player:GetId() end

---@return PlayerType
function Player:GetPlayerType() end

---@return Object[]
function Player:GetPlayerObjects() end

---@return Vector2
function Player:GetCameraPosition() end

---@return Object|nil
function Player:GetMouseHoveredObject() end

---@return Object|nil
function Player:GetSelectedObject() end

---@return integer
function Player:GetSelectedObjectCount() end

---@return string
function Player:GetPlayerName() end

---@return integer
function Player:GetCivilizationId() end

---@return string
function Player:GetCivilizationName() end

---@return Color
function Player:GetColor() end

---@param attribute PlayerAttribute
---@return number
function Player:GetAttribute(attribute) end

---@param unitId UnitObjectType
---@return integer
function Player:GetUnitTypeCount(unitId) end

---@param factId Fact
---@param parameter? integer
---@return number
function Player:GetFact(factId, parameter) end

---@param unitId UnitObjectType
---@param isBuilding? boolean
---@return boolean
function Player:CanAfford(unitId, isBuilding) end

---Get the current research cost for this player.
---@param technology Technology
---@return ResourceCost[]
function Player:GetTechCost(technology) end

---Get the current object cost for this player.
---@param unitObjectType UnitObjectType
---@param costMultiplier? number
---@return ResourceCost[]
function Player:GetObjectCost(unitObjectType, costMultiplier) end

---@param unitObjectType UnitObjectType
---@return boolean
function Player:IsObjectTypeAvailable(unitObjectType) end

---@param technology Technology
---@return ResearchState
function Player:GetResearchState(technology) end

---@param technology Technology
---@return boolean
function Player:CanAffordResearch(technology) end

---@param technology Technology
---@return boolean
function Player:CanResearch(technology) end

---@param technology Technology
---@return boolean
function Player:IsTechnologyResearched(technology) end

---@param unitTypes UnitObjectType[]
---@return Object[]
function Player:GetObjectsByTypes(unitTypes) end

---@param unitTypes UnitObjectType[]
---@return Object[]
function Player:GetObjectsByMostCommonType(unitTypes) end

---@param unitClass UnitClass
---@return Object[]
function Player:GetObjectsByClass(unitClass) end

---@param unitClasses UnitClass[]
---@return Object[]
function Player:GetObjectsByClasses(unitClasses) end

---@param unitClass UnitClass
---@return Object[]
function Player:GetObjectsByClassDeadInclusive(unitClass) end

---@return Object[]
function Player:GetTownCenters() end

---@return boolean
function Player:HasWon() end

---@param player Player
---@return boolean
function Player:IsAlliedWith(player) end

---@param player Player
---@return boolean
function Player:IsEnemyTo(player) end

-- =============================================================================
-- COMMANDS (Game API — Actions)
-- Usually callable from Init(), Update(), or Render().
-- Tournament Mode can block these outside Update().
-- Command bindings remain available when CONTROL's "Spectator Mode" option is enabled.
-- =============================================================================

---Write message to log window.
---@param message string
function Log(message) end

---Set game speed multiplier (e.g. 1.5, 30).
---@param multiplier number
function SetGameSpeedMultiplier(multiplier) end

---Returns whether an in-game menu is currently open.
---@return boolean
function IsMenuOpen() end

---Move camera to position.
---@param position Vector2
function SetCameraPosition(position) end

---Send message to local chat.
---@param message string
function SendChatMessage(message) end

---Train units while automatically selecting a valid source for the assigned player.
---@overload fun(unitId: UnitObjectType, amount?: integer): boolean
---Train units at specified building types. amount defaults to 1.
---@param trainSources UnitObjectType[] Buildings that can train (e.g. {UnitObjectType.TOWN_CENTER_FEUDAL_AGE})
---@param unitId UnitObjectType Unit type to train
---@param amount? integer Amount to train (default 1)
---@return boolean
function TrainUnit(trainSources, unitId, amount) end

---Order units to attack/target object.
---@param units Object[]
---@param target Object
---@return boolean
function UnitsTargetObject(units, target) end

---Order builders to construct structure.
---@param builders Object[]
---@param structureId UnitObjectType
---@param position Vector3
---@return boolean
function UnitsBuildStructure(builders, structureId, position) end

---Move units to position.
---@param units Object[]
---@param position Vector3
---@return boolean
function UnitsMove(units, position) end

---Enable auto-scouting.
---@return boolean
function EnableScouting() end

---Research technology at specified buildings.
---@param researchSources UnitObjectType[]|Object[] Buildings that can research
---@param technology Technology
---@return boolean
function ResearchTechnology(researchSources, technology) end

---Delete a unit.
---@param unit Object
function DeleteUnit(unit) end

---Destroy a building.
---@param building Object
function DestroyBuilding(building) end

---Set gather point for buildings.
---@param buildings Object[]
---@param targetPosition Vector3
function SetGatherPoint(buildings, targetPosition) end

---Ring town bell.
---@param building Object
---@param isCallingIn boolean
function RingTownBell(building, isCallingIn) end

---Send garrisoned units back to work.
---@param building Object
function SendBackToWork(building) end

---Send all garrisoned units back to work.
---@param building Object
function SendAllBackToWork(building) end

---Set units to auto-scout stance.
---@param units Object[]
function SetUnitStanceAutoScout(units) end

---Set units to patrol stance.
---@param units Object[]
---@param targetPosition Vector3
function SetUnitStancePatrol(units, targetPosition) end

---Set units to guard object.
---@param units Object[]
---@param targetObject Object
function SetUnitStanceGuard(units, targetObject) end

---Set units to follow object.
---@param units Object[]
---@param targetObject Object
function SetUnitStanceFollow(units, targetObject) end

---Set units to attack-move stance.
---@param units Object[]
---@param targetPosition Vector3
function SetUnitStanceAttackMove(units, targetPosition) end

---Garrison units in building.
---@param units Object[]
---@param targetObject Object
function SetUnitStanceGarrison(units, targetObject) end

---Ungarrison unit.
---@param sourceObjects Object[]
---@param unit Object
function SetUnitStanceUngarrison(sourceObjects, unit) end

---Set units to seek shelter.
---@param units Object[]
function SetUnitStanceSeekShelter(units) end

---Set combat stance for units.
---@param units Object[]
---@param stance UnitCombatStance
function SetUnitCombatStance(units, stance) end

-- =============================================================================
-- FACTS (Game API — Read State) — Safe from Init(), Update(), or Render().
-- Tournament Mode restrictions apply to commands, not these read-only queries.
-- =============================================================================

---Get fact value (population, resources, etc.). parameter often 0.
---@param factId Fact
---@param parameter? integer
---@return number
function GetFact(factId, parameter) end

---Count of unit type for the assigned player.
---@param unitId UnitObjectType
---@return integer
function GetUnitTypeCount(unitId) end

---Player attribute (PlayerAttribute enum).
---@param attribute PlayerAttribute
---@return number
function GetAttribute(attribute) end

---Can the assigned player afford a unit or building.
---@param unitId UnitObjectType
---@param isBuilding? boolean
---@return boolean
function CanAfford(unitId, isBuilding) end

---Get the current research cost for the assigned player.
---@param technology Technology
---@return ResourceCost[]
function GetTechCost(technology) end

---Get the current object cost for the assigned player.
---@param unitObjectType UnitObjectType
---@param costMultiplier? number
---@return ResourceCost[]
function GetObjectCost(unitObjectType, costMultiplier) end

---Whether the assigned player can currently access the requested object type.
---@param unitObjectType UnitObjectType
---@return boolean
function IsObjectTypeAvailable(unitObjectType) end

---Can research technology.
---@param technology Technology
---@return boolean
function CanResearch(technology) end

---Is technology researched.
---@param technology Technology
---@return boolean
function IsTechnologyResearched(technology) end

---@param unitType UnitObjectType
---@return Object[]
function GetObjectsByType(unitType) end

---@param unitTypes UnitObjectType[]
---@return Object[]
function GetObjectsByTypes(unitTypes) end

---@param unitClass UnitClass
---@return Object[]
function GetObjectsByClass(unitClass) end

---@param classes UnitClass[]
---@return Object[]
function GetObjectsByClasses(classes) end

---Current game time in seconds.
---@return number
function GetGameTime() end

---Get all currently retained chat messages from the in-game chat buffer.
---@return string[]
function GetAllChatMessages() end

---Get the most recent chat message, if one exists.
---@return string|nil
function GetLastChatMessage() end

---Get chat messages that appeared since the previous call for this module instance.
---The first call returns the current retained chat buffer.
---@return string[]
function GetNewChatMessages() end

---Whether replay playback is currently paused.
---@return boolean
function IsGamePaused() end

---Pause or unpause replay playback.
---@param paused boolean
function SetGamePaused(paused) end

---Set replay playback speed.
---@param speed ReplaySpeed
function SetReplaySpeed(speed) end

---Get the current replay file name.
---@return string
function GetCurrentReplayFileName() end

---Calculate a native path between two world positions.
---@param from Vector3
---@param to Vector3
---@param collisionRadius? number
---@return Vector3[]
function CalculatePath(from, to, collisionRadius) end

---@return Player
function GetAssignedPlayer() end

---Available during Load() and in-game callbacks.
---@return integer
function GetAssignedPlayerId() end

---May return a Player handle for any slot, but data access can be restricted for
---non-assigned players when "Modules See Everything" is disabled.
---@param id integer
---@return Player
function GetPlayerById(id) end

---@return integer
function GetPlayerCount() end

---Rebuilds the engine-owned tile snapshot buffer and returns `(ptr, size)`.
---@return integer ptr
---@return integer size
function GetMapTilesPtr() end

---@return integer
function GetMapWidth() end

---@return integer
function GetMapHeight() end

---@param x integer|Vector2
---@param y? integer
---@return MapTile|nil
function GetMapTile(x, y) end

---@return MapTile[]
function GetAllMapTiles() end

---Rebuilds the engine-owned object snapshot buffer and returns `(ptr, size)`.
---Dead-inclusive.
---@return integer ptr
---@return integer size
function GetObjectsPtr() end

---@param pos1 Vector2
---@param pos2 Vector2
---@return Object[]
function GetObjectsInArea(pos1, pos2) end

---@param objectTypeId UnitObjectType|integer
---@param objectData ObjectData
---@return integer
function GetObjectTypeData(objectTypeId, objectData) end

---@param objectTypeId UnitObjectType|integer
---@param attribute ObjectAttribute
---@param damageType integer
---@return number
function GetObjectTypeAttribute(objectTypeId, attribute, damageType) end

---@param player Player
---@return boolean
function IsEnemyPlayer(player) end

---@param id integer
---@return Object|nil
function GetObjectById(id) end

---@param id integer
---@return Object|nil
function GetProjectileById(id) end

---@return Object[]
function GetAllProjectiles() end

---@param projectileType ProjectileType
---@return Object[]
function GetProjectilesByType(projectileType) end

---@return VictoryCondition
function GetVictoryCondition() end

---Winning player if game ended.
---@return Player|nil
function GetVictoryPlayer() end

-- =============================================================================
-- RENDER API — Use in Render(). Screen, World, Minimap coordinate spaces.
-- =============================================================================

---@return Vector2
function GetScreenSize() end

---@param position Vector2
---@return boolean
function IsOnScreen(position) end

---@param text string
---@param position Vector2
---@param size number
---@param color Color
---@param center boolean
---@param border? boolean
function RenderText(text, position, size, color, center, border) end

---@param from Vector2
---@param to Vector2
---@param color Color
---@param thickness number
function RenderLine(from, to, color, thickness) end

---@param position Vector2
---@param radius number
---@param color Color
---@param thickness number
---@param segments? integer
function RenderCircle(position, radius, color, thickness, segments) end

---@param position Vector2
---@param radius number
---@param color Color
---@param segments? integer
function RenderCircleFilled(position, radius, color, segments) end

---@param from Vector2
---@param to Vector2
---@param color Color
---@param rounding number
---@param roundingCornersFlags integer
---@param thickness number
function RenderRect(from, to, color, rounding, roundingCornersFlags, thickness) end

---@param from Vector2
---@param to Vector2
---@param color Color
---@param rounding number
---@param roundingCornersFlags integer
function RenderRectFilled(from, to, color, rounding, roundingCornersFlags) end

---@param worldPos Vector3
---@return boolean
function IsWorldPosOnScreen(worldPos) end

---@param worldPos Vector3
---@return Vector2
function WorldToScreen(worldPos) end

---@param worldPos Vector3
---@return Vector2
function WorldToMinimap(worldPos) end

---@return number
function GetZoom() end

---@return Vector2
function GetCameraPosition() end

---@param from Vector3
---@param to Vector3
---@param color Color
---@param thickness? number
function RenderWorldLine(from, to, color, thickness) end

---@param worldPos Vector3
---@param width number
---@param height number
---@param color Color
---@param thickness? number
function RenderWorldRect(worldPos, width, height, color, thickness) end

---@param worldPos Vector3
---@param width number
---@param height number
---@param color Color
function RenderWorldRectFilled(worldPos, width, height, color) end

---@param worldPos Vector3
---@param radius number
---@param color Color
---@param thickness? number
---@param segments? integer
function RenderWorldCircle(worldPos, radius, color, thickness, segments) end

---@param worldPos Vector3
---@param radius number
---@param color Color
---@param segments? integer
function RenderWorldCircleFilled(worldPos, radius, color, segments) end

---@param text string
---@param worldPos Vector3
---@param size number
---@param color Color
---@param center? boolean
---@param border? boolean
function RenderWorldText(text, worldPos, size, color, center, border) end

---@param object Object
---@param color Color
---@param thickness? number
function RenderObjectBounds(object, color, thickness) end

---@param object Object
---@param color Color
function RenderObjectBoundsFilled(object, color) end

---@param worldPos Vector3
---@param radius number
---@param color Color
function RenderMinimapDot(worldPos, radius, color) end

---@param worldPosFrom Vector3
---@param worldPosTo Vector3
---@param thickness number
---@param color Color
function RenderMinimapLine(worldPosFrom, worldPosTo, thickness, color) end

---@param worldPos Vector3
---@param width number
---@param height number
---@param color Color
---@param thickness number
function RenderMinimapRect(worldPos, width, height, color, thickness) end

---@param worldPos Vector3
---@param width number
---@param height number
---@param color Color
function RenderMinimapRectFilled(worldPos, width, height, color) end

-- =============================================================================
-- SETTINGS API — Add* only from Load(); Get* from anywhere
-- =============================================================================

---@class Settings
Settings = {}

---Call only from Load().
---@param key string
---@param default boolean
function Settings.AddBool(key, default) end

---Call only from Load().
---@param key string
---@param default integer
---@param min integer
---@param max integer
function Settings.AddInt(key, default, min, max) end

---Call only from Load().
---@param key string
---@param default number
---@param min number
---@param max number
function Settings.AddFloat(key, default, min, max) end

---Call only from Load().
---@param key string
---@param default string
---@param options string[]
function Settings.AddDropdown(key, default, options) end

---Call only from Load(). Use Key.Add, Key.F, Key.SPACE, etc.
---@param key string
---@param defaultVkCode integer
function Settings.AddKeybind(key, defaultVkCode) end

---Call only from Load().
---@param key string
---@param defaultColor Color
function Settings.AddColor(key, defaultColor) end

---Call only from Load().
---@param key string
---@param tooltip string
function Settings.AddTooltip(key, tooltip) end

---@param key string
---@param default? boolean
---@return boolean
function Settings.GetBool(key, default) end

---@param key string
---@param default? integer
---@return integer
function Settings.GetInt(key, default) end

---@param key string
---@param default? number
---@return number
function Settings.GetFloat(key, default) end

---@param key string
---@param default? string
---@return string
function Settings.GetString(key, default) end

---@param key string
---@param defaultVkCode? integer
---@return integer
function Settings.GetKeybind(key, defaultVkCode) end

---@param key string
---@param defaultColor Color
---@return Color
function Settings.GetColor(key, defaultColor) end

---Check if key is pressed. Use with Settings.GetKeybind for hotkeys.
---@param vkCode integer
---@return boolean
function IsKeyPressed(vkCode) end

-- =============================================================================
-- IPC API — For external processes (e.g. Python ML agents) via named pipes
-- =============================================================================

---@class IPC
IPC = {}

---@param pipeName string
---@return boolean
function IPC.StartServer(pipeName) end

function IPC.StopServer() end

---@param message string|table
---@return boolean
function IPC.Send(message) end

---Return true if queued IPC messages are available without draining them.
---@return boolean
function IPC.HasMessages() end

---@return string[]
function IPC.GetMessages() end

---@param str string
---@return table
function ParseJSON(str) end

---@param obj table
---@return string
function ToJSON(obj) end

-- =============================================================================
-- ENUMS — Use as EnumName.VALUE
-- =============================================================================

---@enum PlayerType
PlayerType = {
    NON_PLAYER = 0,
    HUMAN = 1,
    GAIA = 2,
    BOT = 3
}

---@enum VictoryCondition
VictoryCondition = {
    STANDARD = 0,
    CONQUEST = 1,
    TIME_LIMIT = 2,
    SCORE = 3,
    CUSTOM = 4
}

---@enum ReplaySpeed
ReplaySpeed = {
    SLOW = 0,
    NORMAL = 1,
    FAST = 2,
    FASTEST = 3
}

---@enum ResearchState
ResearchState = {
    NOT_AVAILABLE = -1,
    LOCKED = 0,
    RESEARCHABLE = 1,
    RESEARCHING = 2,
    RESEARCHED = 3
}

---@enum ResourceType
ResourceType = {
    FOOD = 0,
    WOOD = 1,
    STONE = 2,
    GOLD = 3,
    POPULATION = 4
}

---@enum PlayerAttribute
PlayerAttribute = {
    FOOD = 0,
    WOOD = 1,
    STONE = 2,
    GOLD = 3,
    POP_SPACE_LEFT = 4,
    POP_CURRENT = 11,
    AGE = 21
}

---@enum Age
Age = {
    DARK_AGE = 0,
    FEUDAL_AGE = 1,
    CASTLE_AGE = 2,
    IMPERIAL_AGE = 3
}

---@enum ObjectType
ObjectType = {
    RESOURCE_OR_EYE_CANDY = 10,
    ANIMATED_MAP_OBJECT = 20,
    DEAD_OR_FISH = 30,
    PROJECTILE = 60,
    NPC = 70,
    BUILDING = 80
}

---@enum ProjectileType
ProjectileType = {
    VOL = 54,
    SLINGER = 187,
    VOL_FIRE = 328,
    ARC = 363,
    CROSSBOWMAN = 364,
    CRS = 365,
    HCS = 366,
    SCORPION = 367,
    BOMBARD_CANNON = 368,
    MANGONEL_SECONDARY = 369,
    TREBUCHET = 371,
    GAL = 372,
    WAR_GALLEY = 373,
    CANNON_GALLEON = 374,
    COM_FIRE = 375,
    CRS_FIRE = 376,
    HCS_FIRE = 377,
    SCORPION_FIRE = 378,
    GUNPOWDER_PRIMARY = 380,
    ARC_FIRE = 466,
    MANGONEL_SECONDARY_FIRE = 468,
    TREBUCHET_FIRE = 469,
    GALLEY_FIRE = 470,
    WAR_GALLEY_FIRE = 471,
    HAR_FIRE = 475,
    HHA_FIRE = 476,
    HAR = 477,
    HHA = 478,
    WTN = 503,
    ARROW_GUARD_TOWER = 504,
    KEP = 505,
    BTW = 506,
    ACA = 507,
    DROMON = 508,
    VIL = 509,
    CKN = 510,
    LONGBOWMAN = 511,
    LBT = 512,
    MSU = 513,
    MPC = 514,
    TAX = 515,
    WTN_FIRE = 516,
    GTW_FIRE = 517,
    KEP_FIRE = 518,
    ACA_FIRE = 519,
    DROMON_FIRE = 520,
    VIL_FIRE = 521,
    CKN_FIRE = 522,
    LBM_FIRE = 523,
    LBT_FIRE = 524,
    MPC_FIRE = 525,
    MSU_FIRE = 526,
    BTW_FIRE = 537,
    SLINGER_FIRE = 538,
    SGY = 540,
    SGY_FIRE = 541,
    ONAGER = 551,
    ONAGER_FIRE = 552,
    HEAVY_SCORPION = 627,
    HEAVY_SCORPION_FIRE = 628,
    MANGONEL_PRIMARY = 656,
    GP1 = 657,
    MANGONEL_PRIMARY_FIRE = 658,
    FIRE_SHIP = 676,
    MLK = 736,
    CST = 746,
    CST_FIRE = 747,
    CGX = 767,
    KREPOST = 786,
    KREPOST_FIRE = 787,
    KNIFE = 1055,
    CVB = 1057,
    CVB_FIRE = 1058,
    LBOL = 1111,
    LBOL_FIRE = 1112,
    HEAVY_SCORPION_1113 = 1113,
    HEAVY_SCORPION_FIRE_1114 = 1114,
    HUSSITE_WAGON_SECONDARY = 1119,
    BALLISTA_ELEPHANT = 1167,
    BALLISTA_ELEPHANT_FIRE = 1168,
    ARAMBAI = 1169,
    ARAMBAI_FIRE = 1170,
    CHURCH = 1548,
    LASER = 1595,
    HUSSITE_WAGON = 1733,
    CHAKRAM = 1756,
    THRSD = 1779,
    THRSD_FIRE = 1780,
    ELEAR = 1781,
    ELEAR_FIRE = 1782,
    ELITE_CHAKRAM = 1783,
    ORGAN_GUN = 1789,
    DROMON_GREEK_FIRE = 1798,
    CITADELS = 1830,
    SVT = 1867,
    SVT_FIRE = 1868,
    LCHUAN_ROCKET = 1879,
    ROCKET_CART = 1906,
    GRENADIER = 1913,
    FIRE_LANCER = 1925,
    MOUNTED_TREBUCHET = 1926,
    MOUNTED_TREBUCHET_FIRE = 1927,
    CROSSBOWMAN_SECONDARY = 1930,
    ZHOU_YU = 1931,
    TRACTION = 1932,
    TRACTION_FIRE = 1933,
    TRACTION_SECONDARY = 1934,
    TRACTION_SECONDARY_FIRE = 1935,
    LCHUAN_CHARGE = 1936,
    LCHUAN_FIRE_CHARGE = 1937,
    LCHUAN = 1938,
    LCHUAN_FIRE = 1939,
    WAR_CHARIOT_BARRAGE = 1957,
    WAR_CHARIOT_FOCUS_FIRE = 1964,
    FIRE_ARCHER = 1971,
    FIRE_ARCHER_RED_CLIFFS = 1972,
    XIANBEI = 1982,
    XIANBEI_SECONDARY = 1983,
    LUBU = 2056,
    GSTRIKE = 2057,
    SUNQUAN = 2062,
    LEVIATHAN = 2226,
    GASTRAPHETES = 2307,
    POLYCRITUS = 2342,
    HELEPOLIS = 2445,
    BOLAS = 2572,
    ELITE_BOLAS = 2573,
    BOLAS_CHARGE = 2574,
    ELITE_BOLAS_CHARGE = 2575,
    BLACKWOOD_ARCHER = 2608,
    ELITE_BLACKWOOD_ARCHER = 2609,
    FIRE_SHIP_CHARGE = 2629,
    DOCK = 2631,
    DOCK_FIRE = 2632,
    HOOK = 2636
}

---@enum Terrain
Terrain = {
    UNKNOWN = -1,
    GRASS = 0,
    WATER = 1,
    WATER_BEACH = 2,
    DIRT_3 = 3,
    SHALLOWS = 4,
    LEAVES = 5,
    DIRT = 6,
    FARM = 7,
    FARM_DEAD = 8,
    GRASS_3 = 9,
    FOREST = 10,
    DIRT_2 = 11,
    GRASS_2 = 12,
    FOREST_PALM = 13,
    DESERT = 14,
    WATER_OLD = 15,
    GRASS_OLD = 16,
    FOREST_JUNGLE = 17,
    FOREST_BAMBOO = 18,
    FOREST_PINE = 19,
    FOREST_OAK = 20,
    FOREST_SNOW = 21,
    WATER_DEEP = 22,
    WATER_MEDIUM = 23,
    ROAD = 24,
    ROAD_BROKEN = 25,
    ICE = 26,
    FOUNDATION = 27,
    WATER_BRIDGE = 28,
    FARM_1 = 29,
    FARM_2 = 30,
    FARM_3 = 31,
    SNOW = 32,
    DIRT_SNOW = 33,
    GRASS_SNOW = 34,
    ICE_2 = 35,
    FOUNDATION_SNOW = 36,
    ICE_BEACH = 37,
    ROAD_SNOW = 38,
    ROAD_FUNGUS = 39,
    KOH = 40,
    SAVANNAH_DIRT = 41,
    DIRT_4 = 42,
    DESERT_CRACKED = 45,
    DESERT_QUICKSAND = 46,
    BLACK = 47,
    FOREST_DRAGON_TREE = 48,
    FOREST_BAOBAB = 49,
    FOREST_ACACIA = 50,
    BEACH_VEGETATION_WHITE = 51,
    BEACH_VEGETATION = 52,
    BEACH_WHITE = 53,
    SHALLOWS_MANGROVE = 54,
    FOREST_MANGROVE = 55,
    FOREST_RAINFOREST = 56,
    WATER_DEEP_OCEAN = 57,
    WATER_AZURE = 58,
    SHALLOWS_AZURE = 59,
    GRASS_JUNGLE = 60,
    FARM_RICE = 63,
    FARM_RICE_DEAD = 64,
    FARM_RICE_1 = 65,
    FARM_RICE_2 = 66,
    FARM_RICE_3 = 67,
    CORRUPTION = 69,
    GRAVEL = 70,
    UNDERBRUSH_LEAVES = 71,
    UNDERBRUSH_SNOW = 72,
    SNOW_LIGHT = 73,
    SNOW_STRONG = 74,
    ROAD_FUNGUS_DE = 75,
    DIRT_MUD = 76,
    UNDERBRUSH_JUNGLE = 77,
    ROAD_GRAVEL = 78,
    BEACH_NOT_NAVIGABLE = 79,
    BEACH_WET_SAND_NOT_NAVIGABLE = 80,
    BEACH_WET_GRAVEL_NOT_NAVIGABLE = 81,
    BEACH_WET_ROCK_NOT_NAVIGABLE = 82,
    GRASS_RAINFOREST = 83,
    FOREST_MEDITERRANEAN = 88,
    FOREST_BUSH = 89,
    FOREST_REEDS_SHALLOWS = 90,
    FOREST_REEDS_BEACH = 91,
    FOREST_REEDS = 92,
    WATER_GREEN = 95,
    WATER_BROWN = 96,
    GRASS_DRY = 100,
    SWAMP_BOGLAND = 101,
    GRAVEL_DESERT = 102,
    FOREST_AUTUMN = 104,
    FOREST_AUTUMN_SNOW = 105,
    FOREST_DEAD = 106,
    BEACH_WET = 107,
    BEACH_WET_GRAVEL = 108,
    BEACH_WET_ROCK = 109,
    FOREST_BIRCH = 110,
    SWAMP_SHALLOWS = 111,
    FOREST_PALM_GRASS = 112,
    FOREST_LUSH_BAMBOO = 113,
    WATER_YELLOW = 114,
    SHALLOWS_YELLOW = 115,
    WATER_YELLOW_DEEP = 116,
    PASTURE = 117,
    PASTURE_DEAD = 118,
    PASTURE_1 = 119,
    PASTURE_2 = 120,
    PASTURE_3 = 121,
    GRASS_FLOWERS_1 = 122,
    GRASS_FLOWERS_2 = 123,
    SNOW_SOFT = 124,
    SNOW_SOFT_LIGHT = 125,
    SNOW_SOFT_STRONG = 126,
    ICE_SOFT = 127,
    BLACK_WALKABLE = 129
}

---@enum TileVisibility
TileVisibility = {
    UNEXPLORED = 0,
    VISIBLE = 15,
    EXPLORED = 128
}

---@enum ObjectAttribute
ObjectAttribute = {
    HITPOINTS = 0,
    LINE_OF_SIGHT = 1,
    OBJECT_MAX = 2,
    RADIUS_X = 3,
    RADIUS_Y = 4,
    SPEED = 5,
    TURN_SPEED = 6,
    ARMOR = 8,
    WEAPON = 9,
    SPEED_OF_ATTACK = 10,
    HIT_CHANCE = 11,
    WEAPON_RANGE = 12,
    WORK_RATE = 13,
    CARRY_CAPACITY = 14,
    BASE_ARMOR = 15,
    MISSILE_ID = 16,
    BUILDING_FACET = 17,
    DEFENSIVE_TERRAIN = 18,
    TARGETING_TYPE = 19,
    MINIMUM_WEAPON_RANGE = 20,
    ATTRIBUTE_AMOUNT_HELD = 21,
    AREA_EFFECT = 22,
    SEARCH_RADIUS = 23,
    HIDDEN_DAMAGE_RESIST = 24,
    ICON_ID = 25,
    FIRE_MISSILE_AT_FRAME = 41,
    AREA_EFFECT_LEVEL = 44,
    BLAST_DEFENSE_LEVEL = 45,
    SHOWN_ATTACK = 46,
    SHOWN_RANGE = 47,
    SHOWN_MELEE_ARMOR = 48,
    NAME_ID = 50,
    DESCRIPTION_ID = 51,
    TERRAIN_RESTRICTION = 53,
    DEATH_SPAWN_OBJECT = 57,
    HOTKEY_ID = 58,
    RESOURCE_COST = 100,
    CREATION_TIME = 101,
    GARRISON_ARROWS = 102,
    FOOD_COST = 103,
    WOOD_COST = 104,
    GOLD_COST = 105,
    STONE_COST = 106,
    MAX_DUP_MISSILES = 107,
    GARRISON_HEAL_RATE = 108,
    REGENERATION_RATE = 109
}

---@enum UnitCombatStance
UnitCombatStance = {
    AGGRESSIVE = 0,
    DEFENSIVE = 1,
    NO_ATTACK = 2,
    STAND_GROUND = 3
}

---@enum Fact
Fact = {
    GAME_TIME = 0,
    POPULATION_CAP = 1,
    POPULATION_HEADROOM = 2,
    HOUSING_HEADROOM = 3,
    IDLE_FARM_COUNT = 4,
    FOOD_AMOUNT = 5,
    WOOD_AMOUNT = 6,
    STONE_AMOUNT = 7,
    GOLD_AMOUNT = 8,
    ESCROW_AMOUNT = 9,
    COMMODITY_BUYING_PRICE = 10,
    COMMODITY_SELLING_PRICE = 11,
    DROPSITE_MIN_DISTANCE = 12,
    SOLDIER_COUNT = 13,
    ATTACK_SOLDIER_COUNT = 14,
    DEFEND_SOLDIER_COUNT = 15,
    WARBOAT_COUNT = 16,
    ATTACK_WARBOAT_COUNT = 17,
    DEFEND_WARBOAT_COUNT = 18,
    CURRENT_AGE = 19,
    CURRENT_SCORE = 20,
    CIVILIZATION = 21,
    PLAYER_NUMBER = 22,
    PLAYER_IN_GAME = 23,
    UNIT_COUNT = 24,
    UNIT_TYPE_COUNT = 25,
    UNIT_TYPE_COUNT_TOTAL = 26,
    BUILDING_COUNT = 27,
    BUILDING_TYPE_COUNT = 28,
    BUILDING_TYPE_COUNT_TOTAL = 29,
    POPULATION = 30,
    MILITARY_POPULATION = 31,
    CIVILIAN_POPULATION = 32,
    RANDOM_NUMBER = 33,
    RESOURCE_AMOUNT = 34,
    PLAYER_DISTANCE = 35,
    ALLIED_GOAL = 36,
    ALLIED_SN = 37,
    RESOURCE_PERCENT = 38,
    ENEMY_BUILDINGS_IN_TOWN = 39,
    ENEMY_UNITS_IN_TOWN = 40,
    ENEMY_VILLAGERS_IN_TOWN = 41,
    PLAYERS_IN_GAME = 42,
    DEFENDER_COUNT = 43,
    BUILDING_TYPE_IN_TOWN = 44,
    UNIT_TYPE_IN_TOWN = 45,
    VILLAGER_TYPE_IN_TOWN = 46,
    GAIA_TYPE_COUNT = 47,
    GAIA_TYPE_COUNT_TOTAL = 48,
    CC_GAIA_TYPE_COUNT = 49,
    CURRENT_AGE_TIME = 50,
    TIMER_STATUS = 51,
    PLAYERS_TRIBUTE = 52,
    PLAYERS_TRIBUTE_MEMORY = 53,
    TREATY_TIME = 54,
    BATTLE_ROYALE_TIME = 55,
    IDLE_PASTURE_COUNT = 56
}

---@enum ObjectData
ObjectData = {
    INDEX = -1,
    ID = 0,
    TYPE = 1,
    CLASS = 2,
    CATEGORY = 3,
    CMDID = 4,
    ACTION = 5,
    ORDER = 6,
    TARGET = 7,
    POINT_X = 8,
    POINT_Y = 9,
    HITPOINTS = 10,
    MAXHP = 11,
    RANGE = 12,
    SPEED = 13,
    DROPSITE = 14,
    RESOURCE = 15,
    CARRY = 16,
    GARRISONED = 17,
    GARRISON_COUNT = 18,
    STATUS = 19,
    PLAYER = 20,
    ATTACK_STANCE = 21,
    ACTION_TIME = 22,
    TARGET_ID = 23,
    FORMATION_ID = 24,
    PATROLLING = 25,
    STRIKE_ARMOR = 26,
    PIERCE_ARMOR = 27,
    BASE_ATTACK = 28,
    LOCKED = 29,
    GARRISON_ID = 30,
    TRAIN_COUNT = 31,
    TASKS_COUNT = 32,
    ATTACKER_COUNT = 33,
    ATTACKER_ID = 34,
    UNDER_ATTACK = 35,
    ATTACK_TIMER = 36,
    POINT_Z = 37,
    PRECISE_X = 38,
    PRECISE_Y = 39,
    PRECISE_Z = 40,
    RESEARCHING = 41,
    TILE_POSITION = 42,
    TILE_INVERSE = 43,
    DISTANCE = 44,
    PRECISE_DISTANCE = 45,
    FULL_DISTANCE = 46,
    MAP_ZONE_ID = 47,
    ON_MAINLAND = 48,
    IDLING = 49,
    MOVE_X = 50,
    MOVE_Y = 51,
    PRECISE_MOVE_X = 52,
    PRECISE_MOVE_Y = 53,
    RELOAD_TIME = 54,
    NEXT_ATTACK = 55,
    TRAIN_SITE = 56,
    TRAIN_TIME = 57,
    BLAST_RADIUS = 58,
    BLAST_LEVEL = 59,
    PROGRESS_TYPE = 60,
    PROGRESS_VALUE = 61,
    MIN_RANGE = 62,
    TARGET_TIME = 63,
    HERESY = 64,
    FAITH = 65,
    REDEMPTION = 66,
    ATONEMENT = 67,
    THEOCRACY = 68,
    SPIES = 69,
    BALLISTICS = 70,
    GATHER_TYPE = 71,
    LANGUAGE_ID = 72,
    GROUP_FLAG = 73,
    HERO_FLAGS = 74,
    HERO = 75,
    AUTO_HEAL = 76,
    NO_CONVERT = 77,
    FRAME_DELAY = 78,
    ATTACK_COUNT = 79,
    TO_PRECISE = 80,
    BASE_TYPE = 81,
    UPGRADE_TYPE = 82,
    OWNERSHIP = 83,
    CAPTURE_FLAG = 84,
    CHARGE_ATTACK_TYPE = 85,
    CHARGE_ATTACK_MAX = 86,
    CHARGE_ATTACK_AMOUNT = 87,
    CHARGE_ATTACK_REGENERATION_RATE = 88,
    CHARGE_ATTACK_EVENT_TYPE = 89,
    ATTACK_DELAY = 90
}

---@enum UnitClass
UnitClass = {
    ALL_UNITS = -1,
    ARCHERY = 900,
    MONUMENT = 901,
    TRADE_COG = 902,
    BUILDING = 903,
    VILLAGER = 904,
    OCEAN_FISH = 905,
    INFANTRY = 906,
    FORAGE = 907,
    STONE_MINE = 908,
    PREY_ANIMAL = 909,
    PREDATOR_ANIMAL = 910,
    MISCELLANEOUS = 911,
    CAVALRY = 912,
    SIEGE_WEAPON = 913,
    TERRAIN = 914,
    TREE = 915,
    TREE_STUMP = 916,
    HEALER = 917,
    MONASTERY = 918,
    TRADE_CART = 919,
    TRANSPORT_SHIP = 920,
    FISHING_SHIP = 921,
    WARSHIP = 922,
    CAVALRY_CANNON = 923,
    WAR_ELEPHANT = 924,
    HERO = 925,
    ELEPHANT_ARCHER = 926,
    WALL = 927,
    PHALANX = 928,
    DOMESTIC_ANIMAL = 929,
    FLAG = 930,
    DEEPSEA_FISH = 931,
    GOLD_MINE = 932,
    SHORE_FISH = 933,
    CLIFF = 934,
    PETARD = 935,
    CAVALRY_ARCHER = 936,
    DOPPELGANGER = 937,
    BIRD = 938,
    GATE = 939,
    SALVAGE_PILE = 940,
    RESOURCE_PILE = 941,
    RELIC = 942,
    MONK_WITH_RELIC = 943,
    ARCHERY_CANNON = 944,
    TWO_HANDED_SWORDSMAN = 945,
    PIKEMAN = 946,
    SCOUT_CAVALRY = 947,
    ORE_MINE = 948,
    FARM = 949,
    SPEARMAN = 950,
    PACKED_TREBUCHET = 951,
    TOWER = 952,
    BOARDING_SHIP = 953,
    UNPACKED_TREBUCHET = 954,
    SCORPION = 955,
    RAIDER = 956,
    CAVALRY_RAIDER = 957,
    LIVESTOCK = 958,
    KING = 959,
    MISC_BUILDING = 960,
    CONTROLLED_ANIMAL = 961,
    GOLD_FISH = 963,
    LAND_MINE = 964
}

---@enum UnitObjectType
---Common unit/building IDs. See https://airef.github.io/tables/objects.html for full list.
UnitObjectType = {
    -- Villagers
    VILLAGER_MALE = 83,
    VILLAGER_FEMALE = 293,
    -- Town Centers
    TOWN_CENTER_DARK_AGE = 109,
    TOWN_CENTER_FEUDAL_AGE = 71,
    TOWN_CENTER_CASTLE_AGE = 141,
    TOWN_CENTER_IMPERIAL_AGE = 142,
    TOWN_CENTER_FOUNDATION = 621,
    -- Military
    MILITIA = 74,
    MAN_AT_ARMS = 75,
    LONG_SWORDSMAN = 77,
    TWO_HANDED_SWORDSMAN = 473,
    CHAMPION = 567,
    SPEARMAN = 93,
    PIKEMAN = 358,
    HALBERDIER = 359,
    ARCHER = 4,
    CROSSBOWMAN = 24,
    ARBALEST = 492,
    SKIRMISHER = 7,
    ELITE_SKIRMISHER = 6,
    CAVALRY_ARCHER = 39,
    HEAVY_CAVALRY_ARCHER = 474,
    SCOUT_CAVALRY = 448,
    LIGHT_CAVALRY = 546,
    KNIGHT = 38,
    CAVALRY = 283,
    PALADIN = 569,
    -- Buildings
    HOUSE_DARK_AGE = 70,
    HOUSE_FEUDAL_AGE = 463,
    MILL_DARK_AGE = 68,
    MILL_FEUDAL_AGE = 129,
    MINING_CAMP_DARK_AGE = 584,
    LUMBER_CAMP_DARK_AGE = 562,
    FARM = 50,
    BARRACKS = 12,
    ARCHERY_RANGE = 87,
    STABLE = 101,
    SIEGE_WORKSHOP = 49,
    BLACKSMITH_FEUDAL_AGE = 103,
    MARKET_FEUDAL_AGE = 84,
    DOCK_DARK_AGE = 45,
    MONASTERY_CASTLE_AGE_BASE = 104,
    UNIVERSITY_CASTLE_AGE = 209,
    CASTLE = 82,
    WONDER = 276,
    -- Resources
    GOLD_MINE = 66,
    STONE_MINE = 102,
    FOREST_TREE = 411,
    RELIC = 285,
    -- Animals
    SHEEP = 594,
    DEER = 65,
    WILD_BOAR = 48,
    WOLF = 126
}

---@enum Technology
---Common tech IDs. See https://airef.github.io/tables/techs.html for full list.
Technology = {
    -- Barracks
    MAN_AT_ARMS = 222,
    LONG_SWORDSMAN = 207,
    PIKEMAN = 197,
    TWO_HANDED_SWORDSMAN = 217,
    CHAMPION = 264,
    HALBERDIER = 429,
    SUPPLIES = 716,
    SQUIRES = 215,
    ARSON = 602,
    -- Archery Range
    CROSSBOWMAN = 100,
    ARBALEST = 237,
    ELITE_SKIRMISHER = 98,
    IMPERIAL_SKIRMISHER = 655,
    THUMB_RING = 437,
    -- Blacksmith
    FORGING = 67,
    IRON_CASTING = 68,
    BLAST_FURNACE = 75,
    SCALE_MAIL_ARMOR = 74,
    CHAIN_MAIL_ARMOR = 76,
    PLATE_MAIL_ARMOR = 77,
    FLETCHING = 199,
    BODKIN_ARROW = 200,
    BRACER = 201,
    -- Stable
    BLOODLINES = 19,
    HUSBANDRY = 39,
    -- Economy
    LOOM = 22,
    WHEELBARROW = 213,
    HAND_CART = 249,
    GOLD_MINING = 55,
    STONE_MINING = 278,
    GOLD_SHAFT_MINING = 182,
    STONE_SHAFT_MINING = 279,
    -- Age upgrades
    FEUDAL_AGE = 101,
    CASTLE_AGE = 102,
    IMPERIAL_AGE = 103
}

---@enum Key
---Virtual key codes for keybinds. Use with Settings.AddKeybind and Settings.GetKeybind.
Key = {
    Add = 0x6B,        -- Numpad +
    Subtract = 0x6D,    -- Numpad -
    Multiply = 0x6A,    -- Numpad *
    Divide = 0x6F,     -- Numpad /
    Space = 0x20,
    Escape = 0x1B,
    Return = 0x0D,
    Back = 0x08,
    Tab = 0x09,
    F1 = 0x70,
    F2 = 0x71,
    F3 = 0x72,
    F4 = 0x73,
    F5 = 0x74,
    F6 = 0x75,
    F7 = 0x76,
    F8 = 0x77,
    F9 = 0x78,
    F10 = 0x79,
    F11 = 0x7A,
    F12 = 0x7B,
    Num0 = 0x30,
    Num1 = 0x31,
    Num2 = 0x32,
    Num3 = 0x33,
    Num4 = 0x34,
    Num5 = 0x35,
    Num6 = 0x36,
    Num7 = 0x37,
    Num8 = 0x38,
    Num9 = 0x39,
    A = 0x41,
    B = 0x42,
    C = 0x43,
    D = 0x44,
    E = 0x45,
    F = 0x46,
    G = 0x47,
    H = 0x48,
    I = 0x49,
    J = 0x4A,
    K = 0x4B,
    L = 0x4C,
    M = 0x4D,
    N = 0x4E,
    O = 0x4F,
    P = 0x50,
    Q = 0x51,
    R = 0x52,
    S = 0x53,
    T = 0x54,
    U = 0x55,
    V = 0x56,
    W = 0x57,
    X = 0x58,
    Y = 0x59,
    Z = 0x5A
}

-- =============================================================================
-- STRATEGIC COMPONENTS
-- =============================================================================

---@class ResourceTracker
---Tracks trees, gold, stone, farms, etc.
---@return ResourceTracker
function ResourceTracker() end

---Refresh tracked resource sets so repopulated resources can be discovered again.
function ResourceTracker:Update() end

---Remove cached resources that are visibly gone from the world.
function ResourceTracker:Cleanup() end

---@param position Vector3
---@param radius number
---@return Object[]
function ResourceTracker:GetConvertibleLivestock(position, radius) end

---@return Object[]
function ResourceTracker:GetOwnedLivestock() end

---@param position Vector3
---@param radius number
---@return Object[]
function ResourceTracker:GetDeadLivestock(position, radius) end

---@return Object[]
function ResourceTracker:GetTrees() end

---@return Object[]
function ResourceTracker:GetGold() end

---@return Object[]
function ResourceTracker:GetStone() end

---@return Object[]
function ResourceTracker:GetForage() end

---@return Object[]
function ResourceTracker:GetFarms() end

---@class VillagerOccupation
---Manages villager assignments.
---@param resourceTracker ResourceTracker
---@return VillagerOccupation
function VillagerOccupation(resourceTracker) end

function VillagerOccupation:Update() end

---@param profession? VillagerProfession
---@return integer
function VillagerOccupation:GetVillagerCount(profession) end

---@return Object[]
function VillagerOccupation:GetAllVillagers() end

---@param amount integer
---@param position Vector3
---@param urgency UrgencyLevel
---@return Object[]
function VillagerOccupation:RequestVillagers(amount, position, urgency) end

function VillagerOccupation:RebalanceVillagers() end

---@param wood integer
---@param food integer
---@param gold integer
---@param stone integer
function VillagerOccupation:SetPriorities(wood, food, gold, stone) end

function VillagerOccupation:ResetPriorities() end

---@param profession VillagerProfession
---@param percentage number
function VillagerOccupation:SetPriorityPercentage(profession, percentage) end

---@param villagers integer[]|Object[]
function VillagerOccupation:AssignVillagers(villagers) end

---@param villager Object
function VillagerOccupation:AssignVillager(villager) end

---@class ConstructionPlacement
---Building placement.
---@param villagerOccupation VillagerOccupation
---@return ConstructionPlacement
function ConstructionPlacement(villagerOccupation) end

function ConstructionPlacement:Update() end

---Build a structure with a specific builder, deriving placement size from the structure type.
---@overload fun(structureType: UnitObjectType, builderUnitId: integer, targetPos: Vector3, directionPos: Vector3, padding?: integer, bypassTownCenterPadding?: boolean): boolean
---@overload fun(structureType: UnitObjectType, targetPos: Vector3, direction: PlacementDirection, padding?: integer, bypassTownCenterPadding?: boolean): boolean
---@overload fun(structureType: UnitObjectType, targetPos: Vector3, directionPos: Vector3, padding?: integer, bypassTownCenterPadding?: boolean): boolean
---@param structureType UnitObjectType
---@param builderUnitId integer
---@param targetPos Vector3
---@param direction PlacementDirection|Vector3
---@param padding? integer
---@param bypassTownCenterPadding? boolean
---@return boolean
function ConstructionPlacement:BuildStructure(structureType, builderUnitId, targetPos, direction, padding, bypassTownCenterPadding) end

---Build a structure relative to the town center, auto-selecting a builder villager.
---@overload fun(structureType: UnitObjectType, padding?: integer, bypassTownCenterPadding?: boolean): boolean
---@param structureType UnitObjectType
---@param targetPos Vector3
---@param padding? integer
---@param bypassTownCenterPadding? boolean
---@return boolean
function ConstructionPlacement:BuildStructureAtTown(structureType, targetPos, padding, bypassTownCenterPadding) end

---@param structureType UnitObjectType
---@param targetPos Vector3
---@param direction PlacementDirection
---@param padding integer
---@param bypassTownCenterPadding? boolean
---@return Vector3
function ConstructionPlacement:FindBestPosition(structureType, targetPos, direction, padding, bypassTownCenterPadding) end

---@param structureType UnitObjectType
---@param targetPosition Vector3
---@param priority? BuildingRequestPriority
---@param padding? integer
---@param bypassTownCenterPadding? boolean
---@param builderUnitId? integer
---@param requireScouting? boolean
function ConstructionPlacement:QueueBuildingRequest(structureType, targetPosition, priority, padding, bypassTownCenterPadding, builderUnitId, requireScouting) end

---@param structureType UnitObjectType
---@param priority? BuildingRequestPriority
---@param padding? integer
---@param bypassTownCenterPadding? boolean
---@param builderUnitId? integer
---@param requireScouting? boolean
function ConstructionPlacement:QueueBuildingRequestAtTown(structureType, priority, padding, bypassTownCenterPadding, builderUnitId, requireScouting) end

function ConstructionPlacement:ProcessBuildingRequests() end

---@param structureType UnitObjectType
---@return boolean
function ConstructionPlacement:IsStructureTypeQueued(structureType) end

---@param unitId integer
---@return boolean
function ConstructionPlacement:IsUnitAssignedToBuilding(unitId) end

---@enum UrgencyLevel
UrgencyLevel = {
    LOW = 0,
    MEDIUM = 1,
    HIGH = 2
}

---@enum BuildingPosition
BuildingPosition = {
    TOWN_CENTER = 0,
    AGGRESSIVE = 1
}

---@enum VillagerProfession
VillagerProfession = {
    WOOD = 0,
    FOOD = 1,
    STONE = 2,
    GOLD = 3
}

---@enum PlacementDirection
PlacementDirection = {
    Center = 0,
    North = 1,
    NorthEast = 2,
    East = 3,
    SouthEast = 4,
    South = 5,
    SouthWest = 6,
    West = 7,
    NorthWest = 8
}

---@enum BuildingRequestPriority
BuildingRequestPriority = {
    LOW = 0,
    MEDIUM = 1,
    HIGH = 2,
    CRITICAL = 3
}
