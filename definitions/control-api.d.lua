---@meta
---CONTROL Lua Engine API definitions for Age of Empires II: Definitive Edition.
---Use with Lua Language Server (sumneko.lua) for IntelliSense.
---Reference: https://airef.github.io for UnitObjectType, UnitClass, Technology IDs.

-- =============================================================================
-- LIFECYCLE CALLBACKS (optional; implement only what you need)
-- =============================================================================

---Called when module is selected or AI is enabled. Use for Settings.Add* only. Do NOT call game API.
---@param assignedPlayerId integer Player assigned to this module instance.
function Load(assignedPlayerId) end

---Called when game is ready, world changed, module reloaded, or AI enabled. One-time setup.
function Init() end

---Called at configurable interval (default 1.0s) while game runs. Main game logic.
function Update() end

---Called every frame while game runs. Use for drawing overlays.
function Render() end

---Called once when game ends.
---@param hasWon boolean Whether the assigned player won.
function End(hasWon) end

---Called when module is unloaded, AI is disabled, or engine is ejected. Use for IPC cleanup.
function Unload() end

-- =============================================================================
-- TYPES
-- =============================================================================

---@class Vector2
---@field x number
---@field y number
Vector2 = {}

---@param x number
---@param y number
---@return Vector2
function Vector2(x, y) end

---@class Vector3
---@field x number
---@field y number
---@field z number
Vector3 = {}

---@param x number
---@param y number
---@param z number
---@return Vector3
function Vector3(x, y, z) end

---@class Vector4
---@field x number
---@field y number
---@field z number
---@field w number
Vector4 = {}

---@param x number
---@param y number
---@param z number
---@param w number
---@return Vector4
function Vector4(x, y, z, w) end

---@class Color
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

---@class Object
---Unit or building from GetObjectsByType, GetObjectsByClass, GetObjectById.
Object = {}

---@return integer
function Object:GetId() end

---@return ObjectType
function Object:GetObjectType() end

---@return Player|nil
function Object:GetOwningPlayer() end

---@return Object|nil
function Object:GetGarrisonObject() end

---@return Vector3
function Object:GetTargetPosition() end

---@return Object|nil
function Object:GetTargetObject() end

---@return Vector3
function Object:GetDirection() end

---@return Vector3
function Object:GetPosition() end

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

---@param attribute UnitAttribute
---@param damageType? integer
---@return number
function Object:GetAttribute(attribute, damageType) end

---@param objectData ObjectData
---@return integer
function Object:GetObjectData(objectData) end

---@return boolean
function Object:IsIdle() end

---@return boolean
function Object:IsMoving() end

---@return boolean
function Object:IsScouting() end

---@return boolean
function Object:IsVisible() end

---@class Player
---Player from GetAssignedPlayer, GetPlayerById.
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

---@param factId FactId
---@param parameter? integer
---@return number
function Player:GetFact(factId, parameter) end

---@param unitId UnitObjectType
---@param isBuilding? boolean
---@return boolean
function Player:CanAfford(unitId, isBuilding) end

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
-- COMMANDS (Game API — Actions) — Call from Init, Update, or Render
-- =============================================================================

---Write message to log window.
---@param message string
function Log(message) end

---Set game speed multiplier (e.g. 1.5, 30).
---@param multiplier number
function SetGameSpeedMultiplier(multiplier) end

---Move camera to position.
---@param position Vector2
function SetCameraPosition(position) end

---Send message to local chat.
---@param message string
function ChatMessage(message) end

---Train units at specified buildings. trainSources = table of UnitObjectType (buildings), amount defaults to 1.
---@param trainSources UnitObjectType[]|Object[] Buildings that can train (e.g. {UnitObjectType.TOWN_CENTER_FEUDAL_AGE})
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
-- FACTS (Game API — Read State) — Call from Init, Update, or Render
-- =============================================================================

---Get fact value (population, resources, etc.). parameter often 0.
---@param factId FactId
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

---Current game time in seconds.
---@return number
function GetGameTime() end

---@return Player
function GetAssignedPlayer() end

---Available during Load() and in-game callbacks.
---@return integer
function GetAssignedPlayerId() end

---@param id integer
---@return Player
function GetPlayerById(id) end

---@return integer
function GetPlayerCount() end

---@param player Player
---@return boolean
function IsEnemyPlayer(player) end

---@param id integer
---@return Object|nil
function GetObjectById(id) end

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

---@enum ResearchState
ResearchState = {
    NOT_AVAILABLE = -1,
    LOCKED = 0,
    RESEARCHABLE = 1,
    RESEARCHING = 2,
    RESEARCHED = 3
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

---@enum UnitCombatStance
UnitCombatStance = {
    AGGRESSIVE = 0,
    DEFENSIVE = 1,
    NO_ATTACK = 2,
    STAND_GROUND = 3
}

---@enum FactId
FactId = {
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

function ResourceTracker:Update() end

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

---@param structureId UnitObjectType
---@param builderUnitId integer
---@param buildingSize integer
---@param targetPos Vector3
---@param direction PlacementDirection|Vector3
---@param padding? integer
---@param bypassTownCenterPadding? boolean
---@return boolean
function ConstructionPlacement:TryBuildStructure(structureId, builderUnitId, buildingSize, targetPos, direction, padding, bypassTownCenterPadding) end

---@param buildingSize integer
---@param targetPos Vector3
---@param direction PlacementDirection
---@param padding integer
---@param bypassTownCenterPadding? boolean
---@return Vector3
function ConstructionPlacement:FindBestPosition(buildingSize, targetPos, direction, padding, bypassTownCenterPadding) end

---@param structureId UnitObjectType
---@param buildingSize integer
---@param targetPosition Vector3
---@param priority? BuildingRequestPriority
---@param padding? integer
---@param bypassTownCenterPadding? boolean
---@param builderUnitId? integer
---@param requireScouting? boolean
function ConstructionPlacement:QueueBuildingRequest(structureId, buildingSize, targetPosition, priority, padding, bypassTownCenterPadding, builderUnitId, requireScouting) end

---@param structureId UnitObjectType
---@param buildingSize integer
---@param priority? BuildingRequestPriority
---@param padding? integer
---@param bypassTownCenterPadding? boolean
---@param builderUnitId? integer
---@param requireScouting? boolean
function ConstructionPlacement:QueueBuildingRequestAtTown(structureId, buildingSize, priority, padding, bypassTownCenterPadding, builderUnitId, requireScouting) end

function ConstructionPlacement:ProcessBuildingRequests() end

---@param structureId UnitObjectType
---@return boolean
function ConstructionPlacement:IsStructureTypeQueued(structureId) end

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
