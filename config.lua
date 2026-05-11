Config = {}

-- =========================================================================
--  General
-- =========================================================================

-- "circles" = dual-circle status block (hunger/thirst + health/armor)
-- "row"     = horizontal row of individual elements
Config.Layout = 'circles'

-- Update intervals in ms. Keep these conservative for low CPU usage.
Config.Tick = {
    status = 250, -- health / armor / hunger / thirst poll
    ammo   = 150, -- weapon + ammo poll
    voice  = 200, -- pma-voice mode poll
    job    = 2000,
}

-- =========================================================================
--  Framework detection (ESX / QBCore / standalone)
--
--  Set to 'auto' to detect automatically. Force a value if you want to
--  bypass detection (e.g. you run multiple cores).
-- =========================================================================
Config.Framework = 'auto' -- 'auto' | 'esx' | 'qb' | 'standalone'

-- =========================================================================
--  Status (hunger / thirst)
--
--  Source 'framework' tries to read from ESX (esx_status events) or
--  QBCore (PlayerData.metadata.hunger / thirst). 'internal' uses the
--  built-in decay loop below.
-- =========================================================================
Config.Status = {
    source = 'auto', -- 'auto' | 'framework' | 'internal'

    -- Internal decay (used when source == 'internal' or no framework found).
    -- Time in MINUTES it takes for hunger/thirst to drop from 100 -> 0.
    decayMinutesHunger = 50,
    decayMinutesThirst = 45,

    -- Reset values applied on respawn / revive (per spec).
    respawnHunger = 100.0,
    respawnThirst = 100.0,
}

-- =========================================================================
--  Voice (pma-voice)
--
--  STRICT, FIXED mapping per spec. Do not change unless you know what
--  you are doing.
-- =========================================================================
Config.Voice = {
    enabled  = true,

    -- Whether to draw a ground marker around the player on mode change.
    marker = {
        enabled       = true,
        showSeconds   = 2.5,   -- visible time after mode switch
        height        = 1.0,
        alpha         = 110,   -- 0-255
        pulseWhileTalking = true,
    },

    -- Fixed distances. DO NOT modify.
    distances = {
        whisper  = 1.5,
        normal   = 7.5,
        shouting = 15.0,
    },

    -- Colors are mirrored in CSS, but the marker also uses these.
    colors = {
        whisper  = { 200, 200, 200 }, -- gray
        normal   = {  70, 200, 110 }, -- green
        shouting = { 230,  70,  70 }, -- red
    },
}

-- =========================================================================
--  Ammo
-- =========================================================================
Config.Ammo = {
    enabled       = true,
    hideWhenEmpty = true, -- hide entirely when no weapon (per spec)
}

-- =========================================================================
--  Player ID
-- =========================================================================
Config.PlayerId = {
    enabled       = true,
    -- 'always' = always visible
    -- 'keyhold' = only while keybind is held
    visibility    = 'always',
    -- Default keybind name for "keyhold". Players can rebind via FiveM
    -- settings > Key Bindings > FiveM > lcp_hud_v4.
    keybindKey    = 'U',
    keybindLabel  = 'Show Player ID',
}

-- =========================================================================
--  Job
-- =========================================================================
Config.Job = {
    enabled    = true,
    showGrade  = true,
    -- Optional icon mapping by job name. Falls back to a generic icon.
    icons = {
        police   = 'shield',
        ambulance = 'plus',
        mechanic = 'wrench',
        taxi     = 'car',
        unemployed = 'user',
    },
}

-- =========================================================================
--  HUD Editor
-- =========================================================================
Config.Editor = {
    command       = 'hudeditor',
    resetCommand  = 'hudreset',
    snapToGrid    = true,
    gridSize      = 8, -- px
}

-- =========================================================================
--  Default element positions / scale.
--
--  x, y are viewport percentages (0..100) interpreted as the element's
--  TOP-LEFT corner. So "x=2, y=85" means "2% from the left edge,
--  85% down from the top edge".
--
--  Used on first launch only; once the player has saved any layout via
--  the editor it lives in KVP under "lcp_hud_v4:layout:v1".
-- =========================================================================
Config.Defaults = {
    -- Dual status rings ~244px wide. Bottom-left, well above the minimap.
    status   = { x = 1.5,  y = 78.0, scale = 1.0, visible = true },

    -- Voice + job + ammo sit roughly along the bottom bar.
    job      = { x = 1.5,  y = 92.0, scale = 1.0, visible = true },
    voice    = { x = 42.0, y = 92.0, scale = 1.0, visible = true },
    ammo     = { x = 86.0, y = 92.0, scale = 1.0, visible = true },

    -- Player ID tucked in the top-left.
    playerid = { x = 1.5,  y = 1.5,  scale = 1.0, visible = true },
}
