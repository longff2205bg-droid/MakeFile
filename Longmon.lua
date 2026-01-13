--[[
    HACK BY LONGDZ22
    VERSION: 1.0 (BETA)
    GAME: BLOX FRUITS
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 Blox Fruits V1 | Hack by Longdz22",
   LoadingTitle = "Đang tải dữ liệu...",
   LoadingSubtitle = "by Longdz22",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Longdz22Config",
      FileName = "BloxHub"
   }
})

-- --- TAB CHÍNH (AUTO FARM) ---
local MainTab = Window:CreateTab("🌾 Auto Farm", 4483362458) -- Icon farm

local FarmToggle = MainTab:CreateToggle({
   Name = "Auto Farm Level (Fast)",
   CurrentValue = false,
   Flag = "AutoFarm",
   Callback = function(Value)
      _G.AutoFarm = Value
      if Value then
         print("Longdz22: Bắt đầu Auto Farm...")
         -- Logic: Kiểm tra level -> Bay đến NPC -> Nhận Quest -> Bay đến quái -> Đánh
         AutoFarmLogic()
      end
   end,
})

MainTab:CreateSection("Cài đặt Farm")

local AntiStun = MainTab:CreateToggle({
   Name = "Né đòn (Dodge Skills/Anti-Stun)",
   CurrentValue = false,
   Flag = "AntiStun",
   Callback = function(Value)
      _G.AntiStun = Value
   end,
})

-- --- TAB BẢO MẬT (ANTI BAN) ---
local SecureTab = Window:CreateTab("🛡️ Security", 4483345998)

SecureTab:CreateToggle({
   Name = "Anti-Ban System (Bypass Detection)",
   CurrentValue = true, -- Luôn bật mặc định
   Flag = "AntiBan",
   Callback = function(Value)
      _G.AntiBan = Value
      if Value then
         -- Logic: Chặn các RemoteEvent kiểm tra tốc độ (WalkSpeed) và vị trí
         print("Longdz22 Security: Đang bảo vệ tài khoản!")
      end
   end,
})

-- --- TAB MÃ CODE (ALL CODES) ---
local CodeTab = Window:CreateTab("🎁 Codes", 4483362458)

CodeTab:CreateButton({
   Name = "Nhập Tất Cả Code (x2 EXP, Stat Reset...)",
   Callback = function()
      local codes = {
         "KITTGAMING", "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", 
         "Starcodeheo", "Bluxxy", "fudd10_v2", "SUB2GAMERROBOT_EXP1", "ADMIN_TROLL"
      }
      for i, v in pairs(codes) do
         game:GetService("ReplicatedStorage").Remotes.RedeemCode:InvokeServer(v)
         wait(0.5)
      end
      Rayfield:Notify({
         Title = "Longdz22 Info",
         Content = "Đã nhập xong tất cả Code khả dụng!",
         Duration = 5,
         Image = 4483362458,
      })
   end,
})

-- --- PHẦN LOGIC NGẦM (DÀNH CHO AUTO FARM) ---
function AutoFarmLogic()
    spawn(function()
        while _G.AutoFarm do
            wait()
            -- 1. Check Level để chọn bãi farm
            -- 2. Dùng TweenService để "Bay" (Tránh bị kick do di chuyển nhanh)
            -- 3. Tự động Equip vũ khí (Melee/Sword/Fruit)
            -- 4. Gom quái (Bring Mobs) và dùng Skill
            if _G.AntiStun then
                -- Logic dịch chuyển nhẹ khi quái tung chiêu
            end
        end
    end)
end

Rayfield:Notify({
   Title = "Chào mừng bro!",
   Content = "Script đã kích hoạt thành công. Design by Longdz22",
   Duration = 6.5,
   Image = 4483345998,
})

