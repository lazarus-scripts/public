if not MobName then
  game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Error",
	Text = "Please Configure Mob Name",
	duration = 5
  })
end

local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		task.wait(0.21)
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Lazarus Exploits",
	Text = "Loaded | https://discord.gg/cDWEbnxFGS",
	duration = 5
  })
if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
  local char = game.Players.LocalPlayer.Character
  local hrp = char.HumanoidRootPart

  local healPos = workspace.Map['000000+ | Spawn']['Healing Pond'].HealPart.CFrame
  
  local mobsFolder = game.Workspace:FindFirstChild("Mobs")
  local grassMobs = {}
  
  local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
  
  for _, mob in ipairs(mobsFolder:GetChildren()) do
    if mob:IsA("Model") and string.find(mob.Name, MobName) then
      table.insert(grassMobs, mob)
    end
  end
  
  for _, child in pairs(char:GetDescendants()) do
	if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
		child.CanCollide = false
	end
  end
  
  tool.Handle.Size = Vector3.new(20,20,20)

  noclip()
  
  for _, mob in ipairs(grassMobs) do
    hrp.CFrame = mob.Torso.CFrame + Vector3.new(-2, 0, 0)
    while mob.Enemy.Health ~= 0 do
      hrp.CFrame = mob.Torso.CFrame + Vector3.new(-4, 0, 0)
      task.wait(0.02)
    end
    hrp.CFrame = healPos
  end
  
  clip()
  task.wait()
  hrp.CFrame = healPos
else
  game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Error",
	Text = "Please equip your weapon of choice before running the script",
	duration = 5
  })
end
