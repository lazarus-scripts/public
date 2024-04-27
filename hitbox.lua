local plr = game.Players.LocalPlayer 
plr.Chatted:Connect(function(msg) 
  local args = string.split(msg:lower()," ")
  if args[1] == "/e" then
    if args[2] == "hb" then
      for _, v in ipairs(game.Players:GetChildren()) do
        if v.Name ~= plr.Name then
          local size = tonumber(args[3])
          print(v.Name .. "has the hitbox set to " .. size)
          v.Character.HumanoidRootPart.Transparency = 1
          v.Character.HumanoidRootPart.Size = Vector3.new(size,size,size)
        end
      end
    end
  end
end)
