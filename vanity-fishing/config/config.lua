Config = {}

Config.progressPerCatch = 0.05 -- The progress per one fish caught

---@class Fish
---@field price integer | { min: integer, max: integer }
---@field chance integer Percentage chance
---@field skillcheck SkillCheckDifficulity }

---@type table<string, Fish>
Config.fish = {
    ['anchovy'] = { price = { min = 250, max = 260 }, chance = 30, skillcheck = { 'easy', 'easy' } },
    ['trout'] = { price = { min = 500, max = 600 }, chance = 30, skillcheck = { 'easy', 'easy' } },
    ['haddock'] = { price = { min = 1500, max = 1600 }, chance = 20, skillcheck = { 'easy', 'easy' } },
    ['salmon'] = { price = { min = 1200, max = 1250 }, chance = 10, skillcheck = { 'easy', 'easy', 'easy' } },
    ['grouper'] = { price = { min = 2700, max = 3000 }, chance = 25, skillcheck = { 'easy', 'easy', 'easy', 'easy' } },
    ['piranha'] = { price = { min = 1350, max = 1450 }, chance = 25, skillcheck = { 'easy', 'easy', 'easy' } },
    ['red_snapper'] = { price = { min = 1400, max = 1450 }, chance = 20, skillcheck = { 'easy', 'easy', 'easy', 'easy' } },
    ['mahi_mahi'] = { price = { min = 1450, max = 1500 }, chance = 19, skillcheck =  { 'easy', 'medium', 'easy' } },
    ['tuna'] = { price = { min = 4890, max = 4891 }, chance = 11, skillcheck = { 'easy', 'medium', 'hard' } },
    ['shark'] = { price = { min = 8100, max = 8120 }, chance = 9, skillcheck = { 'hard', 'medium', 'easy' } },
    ['flathead'] = { price = { min = 2250, max = 2750 }, chance = 11, skillcheck = { 'easy', 'easy', 'easy' } },
    ['gun_case'] = { price = { min = 34000, max = 36000 }, chance = 13, skillcheck = { 'medium', 'hard', 'medium' } },
}

---@class FishingRod
---@field name string
---@field price integer
---@field minLevel integer The minimal level 
---@field breakChance integer Percentage chance

---@type FishingRod[]
Config.fishingRods = {
    { name = 'basic_rod', price = 1000, minLevel = 1, breakChance = 0 },
    { name = 'graphite_rod', price = 2500, minLevel = 2, breakChance = 0 },
    { name = 'titanium_rod', price = 5000, minLevel = 3, breakChance = 0 },
}

---@class FishingBait
---@field name string
---@field price integer
---@field minLevel integer The minimal level
---@field waitDivisor number The total wait time gets divided by this value

---@type FishingBait[]
Config.baits = {
    { name = 'worms', price = 5, minLevel = 1, waitDivisor = 1.0 },
    { name = 'artificial_bait', price = 50, minLevel = 2, waitDivisor = 3.0 },
}

---@class FishingZone
---@field locations vector3[] One of these gets picked at random
---@field radius number
---@field minLevel integer
---@field waitTime { min: integer, max: integer }
---@field includeOutside boolean Whether you can also catch fish from Config.outside
---@field blip BlipData?
---@field message { enter: string, exit: string }?
---@field fishList string[]

---@type FishingZone[]
Config.fishingZones = {
    {
        blip = {
            name = 'Coral Reef',
            sprite = 317,
            color = 24,
            scale = 0.6
        },
        locations = {
            vector3(-1774.0654, -1796.2740, 0.0),
            vector3(2482.8589, -2575.6780, 0.0)
        },
        radius = 250.0,
        minLevel = 1,
        waitTime = { min = 5, max = 10 },
        includeOutside = true,
        message = { enter = 'You have entered a coral reef.', exit = 'You have left the coral reef.' },
        fishList = { 'mahi_mahi', 'red_snapper', 'gun_case' }
    },
    {
        blip = {
            name = 'Deep Waters',
            sprite = 317,
            color = 29,
            scale = 0.6
        },
        locations = {
            vector3(-4941.7964, -2411.9146, 0.0),
        },
        radius = 1000.0,
        minLevel = 3,
        waitTime = { min = 20, max = 40 },
        includeOutside = false,
        message = { enter = 'You have entered deep waters.', exit = 'You have left deep waters.' },
        fishList = { 'grouper', 'gun_case', 'tuna', 'shark' }
    },
    {
        blip = {
            name = 'Swamp',
            sprite = 317,
            color = 56,
            scale = 0.6
        },
        locations = {
            vector3(-2188.1182, 2596.9348, 0.0),
        },
        radius = 200.0,
        minLevel = 2,
        waitTime = { min = 10, max = 20 },
        includeOutside = true,
        message = { enter = 'You have entered a swamp.', exit = 'You have left the swamp.' },
        fishList = { 'piranha' }
    },
    {
        blip = {
            name = 'Fishing Spot',
            sprite = 317,
            color = 56,
            scale = 0.6
        },
        locations = {
            vector3(3855.99, 4459.98, 1.85),
        },
        radius = 200.0,
        minLevel = 2,
        waitTime = { min = 10, max = 20 },
        includeOutside = true,
        message = { enter = 'You have entered a fishing spot.', exit = 'You have left the fishing spot.' },
        fishList = { 'grouper', 'gun_case', 'trout', 'tuna', 'shark' }
    },
}

-- Outside of all zones
Config.outside = {
    waitTime = { min = 10, max = 25 },

    ---@type string[]
    fishList = {
        'trout', 'anchovy', 'haddock', 'salmon'
    }
}

Config.ped = {
    model = `s_m_m_cntrybar_01`,
    buyAccount = 'money',
    sellAccount = 'money',
    blip = {
        name = 'Fish Market',
        sprite = 356,
        color = 74,
        scale = 0.75
    },

    ---@type vector4[]
    locations = {
        vector4(-2081.3831, 2614.3223, 3.0840, 112.7910),
        vector4(-1492.3639, -939.2579, 10.2140, 144.0305),
        vector4(3867.62, 4462.19, 2.72, 33)
    }
}

Config.renting = {
    model = `s_m_m_dockwork_01`, -- The ped model
    account = 'money',
    boats = {
        { model = `speeder`, price = 500, image = 'https://i.postimg.cc/mDSqWj4P/164px-Speeder.webp' },
        { model = `dinghy`, price = 750, image = 'https://i.postimg.cc/ZKzjZgj0/164px-Dinghy2.webp'  },
        { model = `tug`, price = 1250, image = 'https://i.postimg.cc/jq7vpKHG/164px-Tug.webp' },
        { model = `smallboat`, price = 1250, image = 'https://i.postimg.cc/6pkxK1ps/Small-Boat.png' }
    },
    blip = {
        name = 'Boat Rental',
        sprite = 410,
        color = 74,
        scale = 0.75
    },
    returnDivider = 5, -- Players can return it and get some cash back
    returnRadius = 30.0, -- The save radius

    ---@type { coords: vector4, spawn: vector4 }[]
    locations = {
        { coords = vector4(-1434.4818, -1512.2745, 2.1486, 25.8666), spawn = vector4(-1494.4496, -1537.6943, 2.3942, 115.6015) }
    }
}