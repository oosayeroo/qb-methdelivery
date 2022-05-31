Config = {}

Config.JobPed = {  --to start the job
    {coords = vector4(168.77, -1710.48, 29.29, 307.33)},
}
Config.DeliveryWait = 10000
Config.DeliveryPayment = math.random(500, 700)  --configure to your servers economy
Config.DeliveryReward = {  --items you get randomly when completing a run
    [1] = {
        ["item"] = "cokebaggy",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [2] = {
        ["item"] = "joint",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [3] = {
        ["item"] = "meth",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
}
---Pick up points here
Config.PickUpPoint1 = vector3(-297.74, 379.84, 112.1)
Config.PickUpPoint2 = vector3(119.37, 564.19, 183.96)
Config.PickUpPoint3 = vector3(808.72, -163.69, 75.88)
Config.PickUpPoint4 = vector3(1060.41, -378.3, 68.23)
Config.PickUpPoint5 = vector3(850.27, -532.63, 57.93)
Config.PickUpPoint6 = vector3(281.96, -1694.96, 29.65)
Config.PickUpPoint7 = vector3(39.02, -1911.58, 21.95)
Config.PickUpPoint8 = vector3(256.43, -2023.4, 19.27)
Config.PickUpPoint9 = vector3(512.51, -1790.77, 28.92)
Config.PickUpPoint10 = vector3(1193.52, -1622.37, 45.22)