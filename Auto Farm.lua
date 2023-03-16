local _, library = pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Osmium/main/OsmiumLibrary.lua")))

local window = library:CreateWindow("Drive World Auto Farm")
local tab = window:CreateTab("Farm")
local tabCredits = window:CreateTab("Credits")

local togglefarm = false
local pausedelay = 60
local farmvalue = true

task.spawn(function()
	repeat task.wait() until not mouse.Target:FindFirstChild("AttachmentHighlight")
	-- Code
end)

function delayactivate()
    pcall(function()
            task.spawn(function()
        task.wait(pausedelay)
        togglefarm = false 
        task.wait(4)
        if farmvalue == true then 
            togglefarm = true
        end
        if togglefarm == true then
            delayactivate()
        end
    end)
    end)
end

local toggle = tab:CreateToggle("Farm", false, function (value)
    if value == true then 
        delayactivate() 
    end
    togglefarm = value
    farmvalue = value
end)

local textbox = tab:CreateTextbox("Collect Money Delay (In seconds)", function(value)
    pausedelay = tonumber(value)
end, "Write number here")

--

local button = tab:CreateButton("AFK", function()
    pcall(function()
        local Players = game:GetService("Players")
local connections = getconnections or get_signal_cons
if connections then
    for i,v in pairs(connections(Players.LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
else
    Players.LocalPlayer.Idled:Connect(function()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

    end)
end)

--

local button = tab:CreateButton("Rejoin", function()
    pcall(function()
        local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
 
local Rejoin = coroutine.create(function()
    local Success, ErrorMessage = pcall(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
 
    if ErrorMessage and not Success then
        warn(ErrorMessage)
    end
end)
 
coroutine.resume(Rejoin)
    end)
end)

--

local button = tabCredits:CreateButton("Noname Hub", function()
    pcall(function()
        setclipboard("https://discord.gg/CRmfvVz4eB")
    end)
end)


while true do 
    pcall(function()
            if togglefarm == true then 
        game:GetService("Workspace").Gravity = 500

        for i, v in pairs(game:GetService("Workspace").Cars:GetChildren()) do
            if tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name then 
                v.Main.CFrame = CFrame.new(0, 700, 0)
                wait(1)
            end
        end
    else 
        game:GetService("Workspace").Gravity = 100
        wait()
    end
    end)
end
