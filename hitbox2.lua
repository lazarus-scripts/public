local UserInputService = game:GetService("UserInputService")

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Lazarus Exploits",
	Text = "Loaded | https://discord.gg/cDWEbnxFGS",
	duration = 5
  })

local plr = game.Players.LocalPlayer
local isHb = false

local function Hb()
    for _, v in ipairs(game.Players:GetChildren()) do
        if v ~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local size = isHb and 1 or hbSize
            print(v.Name .. " has the hitbox set to " .. size)
            v.Character.HumanoidRootPart.Transparency = 1
            v.Character.HumanoidRootPart.Size = Vector3.new(size, size, size)
        end
    end
    isHb = not isHb
end

local function onKeyPress(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Equals then
        Hb()
    end
end

UserInputService.InputBegan:Connect(onKeyPress)

