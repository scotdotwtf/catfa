--[[

    // PRO-CHAT, by spec
    
    version: 0.2b *small  rewrite*
    
    - Description: A simple script that adds a extra button
    to your chat coregui and makes your messages cooler.
    
    credits to @Fusion1227 for the color algorithm, hats for the method and sang for the spam.
    
]]

getgenv().theme = {
    ["bg1"] = Color3.fromRGB(17, 17, 17),
    ["bg2"] = Color3.fromRGB(25, 27, 29),
    ["toggle"] = Color3.fromRGB(35, 35, 35),

    ["text"] = Color3.fromRGB(255, 255, 255)
}

--// for players using autexc
if not game:IsLoaded() then game.Loaded:Wait() end

if not game:GetService("CoreGui"):FindFirstChild("ExperienceChat") then
    return print("PRO-CHAT not loaded because ExperienceChat was not found.")
end

--// awesome intro i made
local function intro(text)
    local cc = Instance.new("ColorCorrectionEffect")
    local intro = Instance.new("Sound")
    
    local introroot = Instance.new("ScreenGui")
    local introtext = Instance.new("TextLabel")
    
    cc.Parent = game:GetService("Lighting")
    cc.TintColor = Color3.fromRGB(255, 255, 255)
    cc.Name = "cc"
    
    intro.Parent = game:GetService("Workspace")
    intro.SoundId = "rbxassetid://466671287"
    intro.Volume = 8
    intro.Name = "Intro"
    
    introroot.Parent = game:GetService("CoreGui")
    introroot.Name = "IntroRoot"
    
    introtext.Parent = introroot
    introtext.Name = "IntroText"
    introtext.BackgroundTransparency = 1.000
    introtext.Position = UDim2.new(0.5, -237,0.5, -62)
    introtext.Size = UDim2.new(0, 475, 0, 125)
    introtext.Font = Enum.Font.RobotoMono
    introtext.TextColor3 = Color3.fromRGB(93, 104, 255)
    introtext.TextWrapped = true
    introtext.RichText = true
    introtext.Text = text
    
    introtext.TextStrokeTransparency = 1
    introtext.TextTransparency = 1


    wait(1)

    spawn(function()
        intro:Play()
        game:GetService("TweenService"):Create(game:GetService("Workspace").Camera, TweenInfo.new(4.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {FieldOfView=game:GetService("Workspace").Camera.FieldOfView + 30}):Play()
        game:GetService("TweenService"):Create(game:GetService("Lighting").cc, TweenInfo.new(4.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Saturation=game:GetService("Lighting").cc.Saturation - 3}):Play()
        game:GetService("TweenService"):Create(game:GetService("Lighting").cc, TweenInfo.new(4.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TintColor=Color3.fromRGB(47, 68, 255)}):Play()
        game:GetService("TweenService"):Create(introtext, TweenInfo.new(4.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextTransparency=0}):Play()
        game:GetService("TweenService"):Create(introtext, TweenInfo.new(4.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextStrokeTransparency=0}):Play()
        wait(4.3)
        game:GetService("TweenService"):Create(game:GetService("Workspace").Camera, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {FieldOfView=game:GetService("Workspace").Camera.FieldOfView - 30}):Play()
        game:GetService("TweenService"):Create(game:GetService("Lighting"):WaitForChild("cc"), TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Saturation=game:GetService("Lighting").cc.Saturation + 3}):Play()
        game:GetService("TweenService"):Create(game:GetService("Lighting"):WaitForChild("cc"), TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TintColor=Color3.fromRGB(255, 255, 255)}):Play()
        game:GetService("TweenService"):Create(introtext, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextTransparency=1}):Play()
        game:GetService("TweenService"):Create(introtext, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextStrokeTransparency=1}):Play()
        wait(0.5)
        cc:Destroy()
        intro:Destroy()
        introroot:Destroy()
    end)
end

if not game:GetService("CoreGui"):FindFirstChild("prochat") then
    intro('<font size="64">prochat</font>\n<font size="16">your defualt config is located at:\nworkspace/prochat/defualt_proconfig.lua</font>')
else
    intro('<font size="46">youre already loaded</font>\n<font size="16">please click the (x)\nin prochat to kill prochat</font>')
    return print("please press (x) to quit prochat")
end


local classicuser = game:GetService("Players").LocalPlayer.Name
local classicdisplay = game:GetService("Players").LocalPlayer.DisplayName

--// make special chat changer gui thing
local prochat = Instance.new("ScreenGui")
local bg = Instance.new("Frame")
local round = Instance.new("UICorner")
local list = Instance.new("UIListLayout")
local NamePick = Instance.new("Frame")
local round_2 = Instance.new("UICorner")
local NameBox = Instance.new("TextBox")
local pad = Instance.new("UIPadding")
local Devide = Instance.new("Frame")
local RichNamePick = Instance.new("Frame")
local round_3 = Instance.new("UICorner")
local RTDisplayNameBox = Instance.new("TextBox")
local SpoofNameBox = Instance.new("TextBox")
local SpoofNameToggle = Instance.new("Frame")
local round_4 = Instance.new("UICorner")
local EnableSpoofNameColor = Instance.new("TextButton")
local round_5 = Instance.new("UICorner")
local list_2 = Instance.new("UIListLayout")
local SpoofLabel = Instance.new("TextLabel")
local pad_2 = Instance.new("UIPadding")
local Devide_2 = Instance.new("Frame")
local CustomChatLabel = Instance.new("TextLabel")
local pad_3 = Instance.new("UIPadding")
local RichChatFunctions = Instance.new("Frame")
local round_6 = Instance.new("UICorner")
local CustomRichChatBox = Instance.new("TextBox")
local Devide_3 = Instance.new("Frame")
local ChatAll = Instance.new("Frame")
local round_ignore = Instance.new("UICorner")
local ChatAllBox = Instance.new("TextBox")
local constraint = Instance.new("UITextSizeConstraint")
local BottomButtonConfig = Instance.new("Frame")
local round_7 = Instance.new("UICorner")
local list_3 = Instance.new("UIListLayout")
local OpenConfig = Instance.new("ImageButton")
local round_8 = Instance.new("UICorner")
local CopyFavoriteColor = Instance.new("ImageButton")
local round_9 = Instance.new("UICorner")
local DestroyProchat = Instance.new("ImageButton")
local addon_round = Instance.new("UICorner")
local CopiedNotif = Instance.new("TextLabel")

prochat.Name = "prochat"
prochat.Parent = game:GetService("CoreGui")

bg.Name = "bg"
bg.Parent = prochat
bg.BackgroundColor3 = theme.bg1
bg.BackgroundTransparency = 0.250
bg.Position = UDim2.new(0, 415, 0, 335)
bg.Size = UDim2.new(0, 224, 0, 349)
bg.ZIndex = 0

bg.Visible = false

round.CornerRadius = UDim.new(0, 10)
round.Name = "round"
round.Parent = bg

list.Name = "list"
list.Parent = bg
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0, 10)

NamePick.Name = "NamePick"
NamePick.Parent = bg
NamePick.BackgroundColor3 = theme.bg2
NamePick.BackgroundTransparency = 0.500
NamePick.BorderColor3 = Color3.fromRGB(27, 42, 53)
NamePick.Size = UDim2.new(1, -16, 0, 36)

round_2.Name = "round"
round_2.Parent = NamePick

NameBox.Name = "NameBox"
NameBox.Parent = NamePick
NameBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameBox.BackgroundTransparency = 1.000
NameBox.Size = UDim2.new(1, 0, 1, 0)
NameBox.ZIndex = 2
NameBox.Font = Enum.Font.Gotham
NameBox.PlaceholderText = "DisplayName"
NameBox.ShowNativeInput = false
NameBox.Text = ""
NameBox.TextColor3 = theme.text
NameBox.TextSize = 14.000

pad.Name = "pad"
pad.Parent = bg
pad.PaddingTop = UDim.new(0, 10)

Devide.Name = "Devide"
Devide.Parent = bg
Devide.BackgroundColor3 = theme.bg1
Devide.BackgroundTransparency = 0.350
Devide.BorderSizePixel = 0
Devide.Size = UDim2.new(1, -30, 0, 1)

RichNamePick.Name = "RichNamePick"
RichNamePick.Parent = bg
RichNamePick.BackgroundColor3 = theme.bg2
RichNamePick.BackgroundTransparency = 0.500
RichNamePick.BorderColor3 = Color3.fromRGB(27, 42, 53)
RichNamePick.Size = UDim2.new(1, -16, 0, 36)

round_3.Name = "round"
round_3.Parent = RichNamePick

RTDisplayNameBox.Name = "NameBox"
RTDisplayNameBox.Parent = RichNamePick
RTDisplayNameBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RTDisplayNameBox.BackgroundTransparency = 1.000
RTDisplayNameBox.Size = UDim2.new(1, 0, 1, 0)
RTDisplayNameBox.ZIndex = 2
RTDisplayNameBox.ClearTextOnFocus = false
RTDisplayNameBox.Font = Enum.Font.Gotham
RTDisplayNameBox.PlaceholderText = "Custom RT Functions"
RTDisplayNameBox.ShowNativeInput = false
RTDisplayNameBox.Text = 'face="Gotham" size="14" color="#8f4dff"'
RTDisplayNameBox.TextColor3 = theme.text
RTDisplayNameBox.TextSize = 14.000
RTDisplayNameBox.TextWrapped = true

SpoofNameBox.Name = "SpoofNameBox"
SpoofNameBox.Parent = RichNamePick
SpoofNameBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpoofNameBox.BackgroundTransparency = 1.000
SpoofNameBox.Size = UDim2.new(1, 0, 1, 0)
SpoofNameBox.ZIndex = 2
SpoofNameBox.ClearTextOnFocus = false
SpoofNameBox.Font = Enum.Font.Gotham
SpoofNameBox.PlaceholderText = "Custom RT Functions"
SpoofNameBox.ShowNativeInput = false
SpoofNameBox.Text = 'font="Gotham" size="14"'
SpoofNameBox.TextColor3 = theme.text
SpoofNameBox.TextSize = 14.000
SpoofNameBox.TextWrapped = true
SpoofNameBox.Visible = false

SpoofNameToggle.Name = "SpoofNameToggle"
SpoofNameToggle.Parent = bg
SpoofNameToggle.BackgroundColor3 = theme.bg2
SpoofNameToggle.BackgroundTransparency = 0.500
SpoofNameToggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
SpoofNameToggle.Size = UDim2.new(1, -16, 0, 36)

round_4.Name = "round"
round_4.Parent = SpoofNameToggle

EnableSpoofNameColor.Name = "NotTransparent"
EnableSpoofNameColor.Parent = SpoofNameToggle
EnableSpoofNameColor.BackgroundColor3 = theme.toggle
EnableSpoofNameColor.BackgroundTransparency = 0.5
EnableSpoofNameColor.Size = UDim2.new(0, 26, 0, 26)
EnableSpoofNameColor.ZIndex = 2
EnableSpoofNameColor.Font = Enum.Font.Gotham
EnableSpoofNameColor.Text = ""
EnableSpoofNameColor.TextColor3 = theme.text
EnableSpoofNameColor.TextSize = 14.000

round_5.Name = "round"
round_5.Parent = EnableSpoofNameColor

list_2.Name = "list"
list_2.Parent = SpoofNameToggle
list_2.FillDirection = Enum.FillDirection.Horizontal
list_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
list_2.SortOrder = Enum.SortOrder.LayoutOrder
list_2.VerticalAlignment = Enum.VerticalAlignment.Center
list_2.Padding = UDim.new(0, 5)

SpoofLabel.Name = "SpoofLabel"
SpoofLabel.Parent = SpoofNameToggle
SpoofLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpoofLabel.BackgroundTransparency = 1.000
SpoofLabel.Size = UDim2.new(1, -40, 1, 0)
SpoofLabel.ZIndex = 2
SpoofLabel.Font = Enum.Font.Gotham
SpoofLabel.Text = "Spoof name color"
SpoofLabel.TextColor3 = theme.text
SpoofLabel.TextSize = 14.000
SpoofLabel.TextXAlignment = Enum.TextXAlignment.Left

pad_2.Name = "pad"
pad_2.Parent = SpoofLabel
pad_2.PaddingLeft = UDim.new(0, 5)

Devide_2.Name = "Devide"
Devide_2.Parent = bg
Devide_2.BackgroundColor3 = theme.bg1
Devide_2.BackgroundTransparency = 0.350
Devide_2.BorderSizePixel = 0
Devide_2.Size = UDim2.new(1, -30, 0, 1)

CustomChatLabel.Name = "CustomChatLabel"
CustomChatLabel.Parent = bg
CustomChatLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CustomChatLabel.BackgroundTransparency = 1.000
CustomChatLabel.Size = UDim2.new(1, -40, 0, 26)
CustomChatLabel.Font = Enum.Font.Gotham
CustomChatLabel.Text = "Custom chat RT vars"
CustomChatLabel.TextColor3 = theme.text
CustomChatLabel.TextSize = 14.000
CustomChatLabel.TextXAlignment = Enum.TextXAlignment.Left

pad_3.Name = "pad"
pad_3.Parent = CustomChatLabel
pad_3.PaddingLeft = UDim.new(0, 5)

RichChatFunctions.Name = "RichChatFunctions"
RichChatFunctions.Parent = bg
RichChatFunctions.BackgroundColor3 = theme.bg2
RichChatFunctions.BackgroundTransparency = 0.500
RichChatFunctions.BorderColor3 = Color3.fromRGB(27, 42, 53)
RichChatFunctions.Size = UDim2.new(1, -16, 0, 36)

round_6.Name = "round"
round_6.Parent = RichChatFunctions

CustomRichChatBox.Name = "CustomRichChatBox"
CustomRichChatBox.Parent = RichChatFunctions
CustomRichChatBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CustomRichChatBox.BackgroundTransparency = 1.000
CustomRichChatBox.Size = UDim2.new(1, 0, 1, 0)
CustomRichChatBox.ZIndex = 2
CustomRichChatBox.ClearTextOnFocus = false
CustomRichChatBox.Font = Enum.Font.Gotham
CustomRichChatBox.PlaceholderText = "Custom RT Functions"
CustomRichChatBox.ShowNativeInput = false
CustomRichChatBox.Text = 'face="Gotham" size="14" color="#ffffff"'
CustomRichChatBox.TextColor3 = theme.text
CustomRichChatBox.TextSize = 14.000
CustomRichChatBox.TextWrapped = true

Devide_3.Name = "Devide"
Devide_3.Parent = bg
Devide_3.BackgroundColor3 = theme.bg1
Devide_3.BackgroundTransparency = 0.350
Devide_3.BorderSizePixel = 0
Devide_3.Size = UDim2.new(1, -30, 0, 1)

ChatAll.Name = "ChatAll"
ChatAll.Parent = bg
ChatAll.BackgroundColor3 = theme.bg2
ChatAll.BackgroundTransparency = 0.500
ChatAll.BorderColor3 = Color3.fromRGB(27, 42, 53)
ChatAll.Size = UDim2.new(1, -16, 0, 36)

round_ignore.Name = "round_ignore"
round_ignore.Parent = ChatAll

ChatAllBox.Name = "ChatAllBox"
ChatAllBox.Parent = ChatAll
ChatAllBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatAllBox.BackgroundTransparency = 1.000
ChatAllBox.Size = UDim2.new(1, 0, 1, 0)
ChatAllBox.ZIndex = 2
ChatAllBox.Font = Enum.Font.Gotham
ChatAllBox.PlaceholderText = "Chat all text (press enter)"
ChatAllBox.ShowNativeInput = false
ChatAllBox.Text = ""
ChatAllBox.TextColor3 = theme.text
ChatAllBox.TextScaled = true
ChatAllBox.TextSize = 12.000
ChatAllBox.TextWrapped = true

constraint.Name = "constraint"
constraint.Parent = ChatAllBox
constraint.MaxTextSize = 12

BottomButtonConfig.Name = "Transparent"
BottomButtonConfig.Parent = bg
BottomButtonConfig.BackgroundColor3 = theme.bg2
BottomButtonConfig.BackgroundTransparency = 1.000
BottomButtonConfig.BorderColor3 = Color3.fromRGB(27, 42, 53)
BottomButtonConfig.Size = UDim2.new(1, -16, 0, 36)

round_7.Name = "round"
round_7.Parent = BottomButtonConfig

list_3.Name = "list"
list_3.Parent = BottomButtonConfig
list_3.FillDirection = Enum.FillDirection.Horizontal
list_3.SortOrder = Enum.SortOrder.LayoutOrder
list_3.VerticalAlignment = Enum.VerticalAlignment.Center
list_3.Padding = UDim.new(0, 5)

OpenConfig.Name = "OpenConfig"
OpenConfig.Parent = BottomButtonConfig
OpenConfig.BackgroundColor3 = theme.toggle
OpenConfig.BackgroundTransparency = 0.500
OpenConfig.Size = UDim2.new(0, 30, 0, 30)
OpenConfig.ZIndex = 2
OpenConfig.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
OpenConfig.ImageRectOffset = Vector2.new(76, 454)
OpenConfig.ImageRectSize = Vector2.new(36, 36)

round_8.Name = "round"
round_8.Parent = OpenConfig

CopyFavoriteColor.Name = "CopyFavoriteColor"
CopyFavoriteColor.Parent = BottomButtonConfig
CopyFavoriteColor.BackgroundColor3 = theme.toggle
CopyFavoriteColor.BackgroundTransparency = 0.500
CopyFavoriteColor.Size = UDim2.new(0, 30, 0, 30)
CopyFavoriteColor.ZIndex = 2
CopyFavoriteColor.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
CopyFavoriteColor.ImageRectOffset = Vector2.new(114, 303)
CopyFavoriteColor.ImageRectSize = Vector2.new(36, 36)

round_9.Name = "round"
round_9.Parent = CopyFavoriteColor

DestroyProchat.Name = "DestroyProchat"
DestroyProchat.Parent = BottomButtonConfig
DestroyProchat.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DestroyProchat.BackgroundTransparency = 0.500
DestroyProchat.Size = UDim2.new(0, 30, 0, 30)
DestroyProchat.ZIndex = 2
DestroyProchat.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
DestroyProchat.ImageRectOffset = Vector2.new(228, 340)
DestroyProchat.ImageRectSize = Vector2.new(36, 36)

addon_round.Name = "addon_round"
addon_round.Parent = DestroyProchat

CopiedNotif.Name = "CopiedNotif"
CopiedNotif.Parent = BottomButtonConfig
CopiedNotif.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopiedNotif.BackgroundTransparency = 1.000
CopiedNotif.ClipsDescendants = true
CopiedNotif.Size = UDim2.new(0, 0, 0, 26)
CopiedNotif.Font = Enum.Font.Gotham
CopiedNotif.Text = "Copied!"
CopiedNotif.TextColor3 = theme.text
CopiedNotif.TextSize = 14.000
CopiedNotif.TextXAlignment = Enum.TextXAlignment.Left

CopiedNotif.Visible = false

--// config window
local ConfigWindow = Instance.new("Frame")
local bg2 = Instance.new("Frame")
local list_4 = Instance.new("UIListLayout")
local NamePick_2 = Instance.new("Frame")
local round_10 = Instance.new("UICorner")
local ConfigName = Instance.new("TextBox")
local pad_4 = Instance.new("UIPadding")
local round_11 = Instance.new("UICorner")
local ConfigButtons = Instance.new("Frame")
local round_12 = Instance.new("UICorner")
local SaveConfig = Instance.new("TextButton")
local round_13 = Instance.new("UICorner")
local list_5 = Instance.new("UIListLayout")
local LoadConfig = Instance.new("TextButton")
local round_14 = Instance.new("UICorner")
local DeleteConfig = Instance.new("TextButton")
local round_15 = Instance.new("UICorner")
local FavoriteColorSetter = Instance.new("Frame")
local round_16 = Instance.new("UICorner")
local list_6 = Instance.new("UIListLayout")
local SetFavoriteColor = Instance.new("TextBox")
local round_17 = Instance.new("UICorner")
local FavoriteColorLabel = Instance.new("TextLabel")
local pad_5 = Instance.new("UIPadding")
local Devide_4 = Instance.new("Frame")
local ManualOverride = Instance.new("Frame")
local round_19 = Instance.new("UICorner")
local EnableManualOverride = Instance.new("TextButton")
local round_20 = Instance.new("UICorner")
local list_7 = Instance.new("UIListLayout")
local ManualLabel = Instance.new("TextLabel")
local pad_6 = Instance.new("UIPadding")
local ManualDisplayPick = Instance.new("Frame")
local round_21 = Instance.new("UICorner")
local ManualDisplayStart = Instance.new("TextBox")
local constraint_2 = Instance.new("UITextSizeConstraint")
local ManualDisplayEnd = Instance.new("TextBox")
local constraint_3 = Instance.new("UITextSizeConstraint")
local ManualChatPick = Instance.new("Frame")
local round_22 = Instance.new("UICorner")
local ManualChatEnd = Instance.new("TextBox")
local constraint_4 = Instance.new("UITextSizeConstraint")
local ManualChatStart = Instance.new("TextBox")
local constraint_5 = Instance.new("UITextSizeConstraint")

ConfigWindow.Name = "Transparent"
ConfigWindow.Parent = bg
ConfigWindow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigWindow.BackgroundTransparency = 1.000
ConfigWindow.Size = UDim2.new(1, 0, 0, 10)

ConfigWindow.Visible = false

bg2.Name = "bg2"
bg2.Parent = ConfigWindow
bg2.BackgroundColor3 = theme.bg2
bg2.BackgroundTransparency = 0.250
bg2.Position = UDim2.new(0, 0, 1, 0)
bg2.Size = UDim2.new(1, 0, 0, 296)
bg2.ZIndex = -1

list_4.Name = "list"
list_4.Parent = bg2
list_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
list_4.SortOrder = Enum.SortOrder.LayoutOrder
list_4.Padding = UDim.new(0, 10)

NamePick_2.Name = "NamePick"
NamePick_2.Parent = bg2
NamePick_2.BackgroundColor3 = theme.bg2
NamePick_2.BackgroundTransparency = 0.500
NamePick_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
NamePick_2.Size = UDim2.new(1, -16, 0, 36)

round_10.Name = "round"
round_10.Parent = NamePick_2

ConfigName.Name = "NameBox"
ConfigName.Parent = NamePick_2
ConfigName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigName.BackgroundTransparency = 1.000
ConfigName.Size = UDim2.new(1, 0, 1, 0)
ConfigName.ZIndex = 2
ConfigName.Font = Enum.Font.Gotham
ConfigName.PlaceholderText = "ConfigName"
ConfigName.ShowNativeInput = false
ConfigName.Text = ""
ConfigName.TextColor3 = theme.text
ConfigName.TextSize = 14.000

pad_4.Name = "pad"
pad_4.Parent = bg2
pad_4.PaddingTop = UDim.new(0, 10)

round_11.CornerRadius = UDim.new(0, 10)
round_11.Name = "round"
round_11.Parent = bg2

ConfigButtons.Name = "ConfigButtons"
ConfigButtons.Parent = bg2
ConfigButtons.BackgroundColor3 = theme.bg2
ConfigButtons.BackgroundTransparency = 1.000
ConfigButtons.BorderColor3 = Color3.fromRGB(27, 42, 53)
ConfigButtons.Size = UDim2.new(1, -16, 0, 36)

round_12.Name = "round"
round_12.Parent = ConfigButtons

SaveConfig.Name = "SaveConfig"
SaveConfig.Parent = ConfigButtons
SaveConfig.BackgroundColor3 = theme.bg2
SaveConfig.BackgroundTransparency = 0.500
SaveConfig.Size = UDim2.new(0, 66, 1, 0)
SaveConfig.ZIndex = 2
SaveConfig.Font = Enum.Font.Gotham
SaveConfig.Text = "Save"
SaveConfig.TextColor3 = theme.text
SaveConfig.TextSize = 14.000

round_13.Name = "round"
round_13.Parent = SaveConfig

list_5.Name = "list"
list_5.Parent = ConfigButtons
list_5.FillDirection = Enum.FillDirection.Horizontal
list_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
list_5.SortOrder = Enum.SortOrder.LayoutOrder
list_5.VerticalAlignment = Enum.VerticalAlignment.Center
list_5.Padding = UDim.new(0, 5)

LoadConfig.Name = "LoadConfig"
LoadConfig.Parent = ConfigButtons
LoadConfig.BackgroundColor3 = theme.bg2
LoadConfig.BackgroundTransparency = 0.500
LoadConfig.Size = UDim2.new(0, 66, 1, 0)
LoadConfig.ZIndex = 2
LoadConfig.Font = Enum.Font.Gotham
LoadConfig.Text = "Load"
LoadConfig.TextColor3 = theme.text
LoadConfig.TextSize = 14.000

round_14.Name = "round"
round_14.Parent = LoadConfig

DeleteConfig.Name = "DeleteConfig"
DeleteConfig.Parent = ConfigButtons
DeleteConfig.BackgroundColor3 = theme.bg2
DeleteConfig.BackgroundTransparency = 0.500
DeleteConfig.Size = UDim2.new(0, 66, 1, 0)
DeleteConfig.ZIndex = 2
DeleteConfig.Font = Enum.Font.Gotham
DeleteConfig.Text = "Delete"
DeleteConfig.TextColor3 = theme.text
DeleteConfig.TextSize = 14.000

round_15.Name = "round"
round_15.Parent = DeleteConfig

FavoriteColorSetter.Name = "FavoriteColorSetter"
FavoriteColorSetter.Parent = bg2
FavoriteColorSetter.BackgroundColor3 = theme.bg2
FavoriteColorSetter.BackgroundTransparency = 0.500
FavoriteColorSetter.BorderColor3 = Color3.fromRGB(27, 42, 53)
FavoriteColorSetter.Size = UDim2.new(1, -16, 0, 36)

round_16.Name = "round"
round_16.Parent = FavoriteColorSetter

list_6.Name = "list"
list_6.Parent = FavoriteColorSetter
list_6.FillDirection = Enum.FillDirection.Horizontal
list_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
list_6.SortOrder = Enum.SortOrder.LayoutOrder
list_6.VerticalAlignment = Enum.VerticalAlignment.Center
list_6.Padding = UDim.new(0, 5)

SetFavoriteColor.Name = "NotTransparent"
SetFavoriteColor.Parent = FavoriteColorSetter
SetFavoriteColor.BackgroundColor3 = theme.toggle
SetFavoriteColor.BackgroundTransparency = 0.500
SetFavoriteColor.Position = UDim2.new(0.021634616, 0, 0.138888896, 0)
SetFavoriteColor.Size = UDim2.new(0, 60, 0, 26)
SetFavoriteColor.ZIndex = 2
SetFavoriteColor.Font = Enum.Font.Gotham
SetFavoriteColor.Text = "#fccc2f"
SetFavoriteColor.TextColor3 = Color3.fromRGB(252, 204, 47)
SetFavoriteColor.TextSize = 14.000

round_17.Name = "round"
round_17.Parent = SetFavoriteColor

FavoriteColorLabel.Name = "FavoriteColorLabel"
FavoriteColorLabel.Parent = FavoriteColorSetter
FavoriteColorLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FavoriteColorLabel.BackgroundTransparency = 1.000
FavoriteColorLabel.Position = UDim2.new(0.252403855, 0, 0, 0)
FavoriteColorLabel.Size = UDim2.new(0.836538434, -40, 1, 0)
FavoriteColorLabel.ZIndex = 2
FavoriteColorLabel.Font = Enum.Font.Gotham
FavoriteColorLabel.Text = "Favorite Color"
FavoriteColorLabel.TextColor3 = theme.text
FavoriteColorLabel.TextSize = 14.000
FavoriteColorLabel.TextXAlignment = Enum.TextXAlignment.Left

pad_5.Name = "pad"
pad_5.Parent = FavoriteColorLabel
pad_5.PaddingLeft = UDim.new(0, 5)

--// manual override time *uhg*
Devide_4.Name = "Devide"
Devide_4.Parent = bg2
Devide_4.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Devide_4.BackgroundTransparency = 0.350
Devide_4.BorderSizePixel = 0
Devide_4.Size = UDim2.new(1, -30, 0, 1)

ManualOverride.Name = "ManualOverride"
ManualOverride.Parent = bg2
ManualOverride.BackgroundColor3 = theme.bg2
ManualOverride.BackgroundTransparency = 0.500
ManualOverride.BorderColor3 = Color3.fromRGB(27, 42, 53)
ManualOverride.Size = UDim2.new(1, -16, 0, 36)

round_19.Name = "round"
round_19.Parent = ManualOverride

EnableManualOverride.Name = "NotTransparent"
EnableManualOverride.Parent = ManualOverride
EnableManualOverride.BackgroundColor3 = theme.toggle
EnableManualOverride.BackgroundTransparency = 0.500
EnableManualOverride.Size = UDim2.new(0, 26, 0, 26)
EnableManualOverride.ZIndex = 2
EnableManualOverride.Font = Enum.Font.Ubuntu
EnableManualOverride.Text = ""
EnableManualOverride.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableManualOverride.TextSize = 14.000

round_20.Name = "round"
round_20.Parent = EnableManualOverride

list_7.Name = "list"
list_7.Parent = ManualOverride
list_7.FillDirection = Enum.FillDirection.Horizontal
list_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
list_7.SortOrder = Enum.SortOrder.LayoutOrder
list_7.VerticalAlignment = Enum.VerticalAlignment.Center
list_7.Padding = UDim.new(0, 5)

ManualLabel.Name = "ManualLabel"
ManualLabel.Parent = ManualOverride
ManualLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ManualLabel.BackgroundTransparency = 1.000
ManualLabel.Size = UDim2.new(1, -40, 1, 0)
ManualLabel.ZIndex = 2
ManualLabel.Font = Enum.Font.Gotham
ManualLabel.Text = "Manual override"
ManualLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ManualLabel.TextSize = 14.000
ManualLabel.TextXAlignment = Enum.TextXAlignment.Left

pad_6.Name = "pad"
pad_6.Parent = ManualLabel
pad_6.PaddingLeft = UDim.new(0, 5)

ManualDisplayPick.Name = "ManualDisplayPick"
ManualDisplayPick.Parent = bg2
ManualDisplayPick.BackgroundColor3 = theme.bg2
ManualDisplayPick.BackgroundTransparency = 0.500
ManualDisplayPick.BorderColor3 = Color3.fromRGB(27, 42, 53)
ManualDisplayPick.Size = UDim2.new(1, -16, 0, 36)

round_21.Name = "round"
round_21.Parent = ManualDisplayPick

ManualDisplayStart.Name = "ManualDisplayStart"
ManualDisplayStart.Parent = ManualDisplayPick
ManualDisplayStart.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ManualDisplayStart.BackgroundTransparency = 1.000
ManualDisplayStart.Size = UDim2.new(1, -80, 1, 0)
ManualDisplayStart.ZIndex = 2
ManualDisplayStart.Font = Enum.Font.Gotham
ManualDisplayStart.PlaceholderText = "Display start"
ManualDisplayStart.ShowNativeInput = false
ManualDisplayStart.Text = ""
ManualDisplayStart.TextColor3 = Color3.fromRGB(255, 255, 255)
ManualDisplayStart.TextSize = 10.000
ManualDisplayStart.ClearTextOnFocus = false
ManualDisplayStart.TextScaled = true
ManualDisplayStart.TextWrapped = true

constraint_2.Name = "constraint"
constraint_2.Parent = ManualDisplayStart
constraint_2.MaxTextSize = 12

ManualDisplayEnd.Name = "ManualDisplayEnd"
ManualDisplayEnd.Parent = ManualDisplayPick
ManualDisplayEnd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ManualDisplayEnd.BackgroundTransparency = 1.000
ManualDisplayEnd.Position = UDim2.new(0, 130, 0, 0)
ManualDisplayEnd.Size = UDim2.new(1, -130, 1, 0)
ManualDisplayEnd.ZIndex = 2
ManualDisplayEnd.Font = Enum.Font.Gotham
ManualDisplayEnd.PlaceholderText = "Display end"
ManualDisplayEnd.ShowNativeInput = false
ManualDisplayEnd.Text = ""
ManualDisplayEnd.TextColor3 = Color3.fromRGB(255, 255, 255)
ManualDisplayEnd.TextSize = 10.000
ManualDisplayEnd.ClearTextOnFocus = false
ManualDisplayEnd.TextScaled = true
ManualDisplayEnd.TextWrapped = true

constraint_3.Name = "constraint"
constraint_3.Parent = ManualDisplayEnd
constraint_3.MaxTextSize = 12

ManualChatPick.Name = "ManualChatPick"
ManualChatPick.Parent = bg2
ManualChatPick.BackgroundColor3 = theme.bg2
ManualChatPick.BackgroundTransparency = 0.500
ManualChatPick.BorderColor3 = Color3.fromRGB(27, 42, 53)
ManualChatPick.Size = UDim2.new(1, -16, 0, 36)

round_22.Name = "round"
round_22.Parent = ManualChatPick

ManualChatEnd.Name = "ManualChatEnd"
ManualChatEnd.Parent = ManualChatPick
ManualChatEnd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ManualChatEnd.BackgroundTransparency = 1.000
ManualChatEnd.Position = UDim2.new(0, 130, 0, 0)
ManualChatEnd.Size = UDim2.new(1, -130, 1, 0)
ManualChatEnd.ZIndex = 2
ManualChatEnd.Font = Enum.Font.Gotham
ManualChatEnd.PlaceholderText = "Chat end"
ManualChatEnd.ShowNativeInput = false
ManualChatEnd.Text = ""
ManualChatEnd.TextColor3 = Color3.fromRGB(255, 255, 255)
ManualChatEnd.TextSize = 10.000
ManualChatEnd.ClearTextOnFocus = false
ManualChatEnd.TextScaled = true
ManualChatEnd.TextWrapped = true

constraint_4.Name = "constraint"
constraint_4.Parent = ManualChatEnd
constraint_4.MaxTextSize = 12

ManualChatStart.Name = "ManualChatStart"
ManualChatStart.Parent = ManualChatPick
ManualChatStart.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ManualChatStart.BackgroundTransparency = 1.000
ManualChatStart.Size = UDim2.new(1, -80, 1, 0)
ManualChatStart.ZIndex = 2
ManualChatStart.Font = Enum.Font.Gotham
ManualChatStart.PlaceholderText = "Chat start"
ManualChatStart.ShowNativeInput = false
ManualChatStart.Text = ""
ManualChatStart.TextColor3 = Color3.fromRGB(255, 255, 255)
ManualChatStart.TextSize = 10.000
ManualChatStart.ClearTextOnFocus = false
ManualChatStart.TextScaled = true
ManualChatStart.TextWrapped = true

constraint_5.Name = "constraint"
constraint_5.Parent = ManualChatStart
constraint_5.MaxTextSize = 12

--// username predict function 
local ChatColors = {
	"FB2943",
    BrickColor.new("Bright blue").Color:ToHex(),
  	BrickColor.new("Earth green").Color:ToHex(),
  	BrickColor.new("Bright violet").Color:ToHex(),
  	BrickColor.new("Bright orange").Color:ToHex(),
  	BrickColor.new("Bright yellow").Color:ToHex(),
  	BrickColor.new("Light reddish violet").Color:ToHex(),
  	BrickColor.new("Brick yellow").Color:ToHex(),
}

function getChatColorsIndex(username)
	local usernameLength = #username
	local totalValue = 0
	
	for i = 1, usernameLength do  -- A loop that looks at each letter in the username
		local letter = string.sub(username, i, i) -- Gets an individual letter
		local letterValue = string.byte(letter) -- Gets a number representation of the letter
		local iReversed = usernameLength - i + 1 -- When i = 1, iReversed is just the username length. The more i increases, the more iReversed decreases
		if usernameLength % 2 == 1 then -- Checks if usernameLength is an odd number
			iReversed = iReversed - 1			
		end
		if iReversed % 4 >= 2 then -- Some more gibberish to make the algorithm more complex
			letterValue = -letterValue 			
		end 
		totalValue = totalValue + letterValue -- Same as doing: totalValue = totalValue + letterValue
	end 
	
	local index = (totalValue % #ChatColors) + 1 -- Makes a number from 1 to 8 depending on totalValue, because there are 8 colors
	return index
end

local uieffects = {"UIListLayout", "UICorner", "UITextSizeConstraint"}
local textinstances = {"TextBox", "TextLabel", "TextButton"}

--// shit, i do NOT want to code a whole tween all but here we go...
local function setalltransparency(obj, btransparency, ttransparency, itransparency)
    local function tweenb(obj, transparency)
        game:GetService("TweenService"):Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {BackgroundTransparency=transparency}):Play()
    end
    
    local function tweent(obj, transparency)
        game:GetService("TweenService"):Create(obj, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency=transparency}):Play()
    end
    
    local function tweeni(obj, transparency)
        game:GetService("TweenService"):Create(obj, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {ImageTransparency=transparency}):Play()
    end

    for _, v in pairs(obj:GetDescendants()) do
        if v.ClassName ~= "UIListLayout" and v.ClassName ~= "UICorner" and v.ClassName ~= "UITextSizeConstraint" and v.ClassName ~= "UIPadding" then
            tweenb(v, btransparency)

            if v.ClassName == "TextBox" or v.ClassName == "TextLabel" or v.ClassName == "TextButton" then
                tweent(v, ttransparency)
                tweenb(v, 1)
            elseif v.ClassName == "ImageButton" then
                tweeni(v, itransparency)
            end

            if v.Name == "Transparent" then
                tweenb(v, 1)
            elseif v.Name == "NotTransparent" then
                tweenb(v, btransparency)
            end
         end
    end
end

--// simple defualt config maker
if not isfolder("prochat") then
    makefolder("prochat")
    if not isfile("prochat/defualt_proconfig.lua") then
        writefile("prochat/defualt_proconfig.lua", [[
    local chatconfig = {
        DisplayName = ']]..game:GetService("Players").LocalPlayer.DisplayName..[[',
        CustomRTDisplayFuncs = 'face="Gotham" size="14" color="#8f4dff"',
        CustomSpoofNameFuncs = 'font="Gotham" size="14"',
        SpoofNameColor = '',
        CustomRTChatFuncs = 'face="Gotham" size="14" color="#ffffff"',
        FavoriteColor = '#ffd700',

        manualenabled = '',

        manualdisplaystart = '<font face="Gotham" size="14" color="#8f4dff">',
        manualdisplayend = '</font>',

        manualchatstart = '<font face="Gotham" size="14" color="#ffffff">',
        manualchatend = '</font>'
    }
    
    return chatconfig
        ]])
    end
end

local function loadconfig(configname)
    chatconfig = loadfile("prochat/"..configname.."_proconfig.lua")()
    NameBox.Text = chatconfig.DisplayName
    RTDisplayNameBox.Text = chatconfig.CustomRTDisplayFuncs
    SpoofNameBox.Text = chatconfig.CustomSpoofNameFuncs
    EnableSpoofNameColor.Text = chatconfig.SpoofNameColor
    CustomRichChatBox.Text = chatconfig.CustomRTChatFuncs
    CopyFavoriteColor.ImageColor3 = Color3.fromHex(chatconfig.FavoriteColor)
    SetFavoriteColor.TextColor3 = Color3.fromHex(chatconfig.FavoriteColor)
    EnableManualOverride.Text = chatconfig.manualenabled
    ManualDisplayStart.Text = chatconfig.manualdisplaystart
    ManualDisplayEnd.Text = chatconfig.manualdisplayend
    ManualChatStart.Text = chatconfig.manualchatstart
    ManualChatEnd.Text = chatconfig.manualchatend

    if EnableSpoofNameColor.Text == "" then
        RTDisplayNameBox.Visible = true
        SpoofNameBox.Visible = false
        game:GetService("Players").LocalPlayer.DisplayName = '<font '..RTDisplayNameBox.Text..'>'..NameBox.Text..'</font>'
    elseif EnableSpoofNameColor.Text == "X" then
        RTDisplayNameBox.Visible = false
        SpoofNameBox.Visible = true
        game:GetService("Players").LocalPlayer.DisplayName = '<font color="'..ChatColors[getChatColorsIndex(NameBox.Text)]..'" '..SpoofNameBox.Text..'>'..NameBox.Text..'</font>'
    end
end

loadconfig("defualt")

--// variables/locations
local chatroot = game:GetService("CoreGui").ExperienceChat
local chatbar = chatroot.container.chatInputBar.Background.Container

--// hide/change core elements we will mess with
chatbar.SendButton.Visible = false
chatbar.TextContainer.Size = UDim2.new(1, -60, 0, 0)

--// make new special elements
local specialsend = Instance.new("ImageButton")
local specialedit = Instance.new("ImageButton")

specialsend.Name = "SpecialSend"
specialsend.Size = UDim2.new(0, 30, 0, 30)
specialsend.Position = UDim2.new(1, -30, 0, 2)
specialsend.BackgroundTransparency = 1
specialsend.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
specialsend.ImageRectOffset = Vector2.new(0, 454)
specialsend.ImageRectSize = Vector2.new(36, 36)
specialsend.ImageColor3 = Color3.fromRGB(125, 125, 125)
specialsend.Parent = chatbar

specialedit.Name = "SpecialEdit"
specialedit.Size = UDim2.new(0, 30, 0, 30)
specialedit.Position = UDim2.new(1, -60, 0, 2)
specialedit.BackgroundTransparency = 1
specialedit.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
specialedit.ImageRectOffset = Vector2.new(115, 454)
specialedit.ImageRectSize = Vector2.new(36, 36)
specialedit.ImageColor3 = Color3.fromRGB(125, 125, 125)
specialedit.Parent = chatbar

game:GetService("RunService").Heartbeat:Connect(function()
    specialsend.ImageTransparency = chatroot.container.chatInputBar.Background.BackgroundTransparency
    specialedit.ImageTransparency = chatroot.container.chatInputBar.Background.BackgroundTransparency
end)

local function send()
    wait()
    chatbar.TextContainer.TextBox.Text = ""
    setalltransparency(prochat, 1, 1, 1)
    wait(0.3)
    bg.Visible = false
end

--// send special message using send btn
specialsend.MouseButton1Click:Connect(function()
    if EnableSpoofNameColor.Text == "" then
        if EnableManualOverride.Text == "X" then
            game:GetService("Players").LocalPlayer.DisplayName = ManualDisplayStart.Text..NameBox.Text..ManualDisplayEnd.Text
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(ManualChatStart.Text..chatbar.TextContainer.TextBox.Text..ManualChatEnd.Text)    
        else
            game:GetService("Players").LocalPlayer.DisplayName = '<font '..RTDisplayNameBox.Text..'>'..NameBox.Text..'</font>'
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync('<font '..CustomRichChatBox.Text..'>'..chatbar.TextContainer.TextBox.Text..'</font>')    
        end
        send()
    elseif EnableSpoofNameColor.Text == "X" then
        if game:GetService("Players"):FindFirstChild(NameBox.Text) then
            game:GetService("Players").LocalPlayer.DisplayName = '<font color="#'..ChatColors[getChatColorsIndex(NameBox.Text)]..'" '..SpoofNameBox.Text..'>'..game:GetService("Players"):FindFirstChild(NameBox.Text).DisplayName..'</font>'
        else
            game:GetService("Players").LocalPlayer.DisplayName = '<font color="#'..ChatColors[getChatColorsIndex(NameBox.Text)]..'" '..SpoofNameBox.Text..'>'..NameBox.Text..'</font>'
        end
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync('<font '..CustomRichChatBox.Text..'>'..chatbar.TextContainer.TextBox.Text..'</font>')

        send()
    end
end)

--// toggle gui
setalltransparency(prochat, 1, 1, 1)
setalltransparency(ConfigWindow, 1, 1, 1)

specialedit.MouseButton1Click:Connect(function()
    if bg.Visible == false then
        bg.Visible = true
        setalltransparency(prochat, 0.5, 0, 0)
    else
        setalltransparency(prochat, 1, 1, 1)
        wait(0.3)
        bg.Visible = false
    end
end)

--// change display 
NameBox.FocusLost:connect(function(enterPressed)
    if enterPressed then
        game:GetService("Players").LocalPlayer.DisplayName = '<font '..RTDisplayNameBox.Text..'>'..NameBox.Text..'</font>'
    end
end)

--// toggle spoof name color
EnableSpoofNameColor.MouseButton1Click:Connect(function()
    if EnableSpoofNameColor.Text == "" then
        EnableSpoofNameColor.Text = "X"
        EnableManualOverride.Text = ""
        RTDisplayNameBox.Visible = false
        SpoofNameBox.Visible = true
    elseif EnableSpoofNameColor.Text == "X" then
        EnableSpoofNameColor.Text = ""
        RTDisplayNameBox.Visible = true
        SpoofNameBox.Visible = false
    end
end)

--// toggle manual override
EnableManualOverride.MouseButton1Click:Connect(function()
    if EnableManualOverride.Text == "" then
        EnableManualOverride.Text = "X"
        EnableSpoofNameColor.Text = ""
    elseif EnableManualOverride.Text == "X" then
        EnableManualOverride.Text = ""
    end
end)

--// chat all function
local function sayall(message)
    for _, v in pairs(game.Players:GetPlayers()) do
        local color = "#"..ChatColors[getChatColorsIndex(v.Name)]
        
        game:GetService("Players").LocalPlayer.DisplayName = '<font color="'..color..'">'..v.DisplayName..'</font>'
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
        wait(0.05)
    end
end

ChatAllBox.FocusLost:connect(function(enterPressed)
    if enterPressed then
        if ChatAllBox.Text ~= '' or ChatAllBox.Text ~= ' ' then
            sayall(ChatAllBox.Text)
            ChatAllBox.Text = ""
        end
    end
end)

--// toggle config gui
OpenConfig.MouseButton1Click:Connect(function()
    if ConfigWindow.Visible == false then 
        ConfigWindow.Visible = true
        setalltransparency(prochat, 0.5, 0, 0)
    else
        setalltransparency(ConfigWindow, 1, 1, 1)
        wait(0.3)
        ConfigWindow.Visible = false
    end
end)

--// copy config color
CopyFavoriteColor.MouseButton1Click:Connect(function()
    setclipboard(tostring(CopyFavoriteColor.ImageColor3:ToHex()))
    CopiedNotif.Visible = true
    CopiedNotif:TweenSize(UDim2.new(1, -150, 0, 26),"In","Quint",.5)
    wait(1)
    CopiedNotif:TweenSize(UDim2.new(0, 0, 0, 26),"In","Quint",.5)
    CopiedNotif.Visible = false
end)

DestroyProchat.MouseButton1Click:Connect(function()
    chatbar.SendButton.Visible = true
    chatbar.TextContainer.Size = UDim2.new(1, -30, 0, 0)
    specialsend:Destroy()
    specialedit:Destroy()
    prochat:Destroy()

    game:GetService("Players").LocalPlayer.DisplayName = classicdisplay
end)

--// scripting config gui
SaveConfig.MouseButton1Click:Connect(function()
    writefile("prochat/"..ConfigName.Text.."_proconfig.lua", [[
local chatconfig = {
    DisplayName = ']]..NameBox.Text..[[',
    CustomRTDisplayFuncs = ']]..RTDisplayNameBox.Text..[[',
    CustomSpoofNameFuncs = ']]..SpoofNameBox.Text..[[',
    SpoofNameColor = ']]..EnableSpoofNameColor.Text..[[',
    CustomRTChatFuncs = ']]..CustomRichChatBox.Text..[[',
    FavoriteColor = ']]..SetFavoriteColor.Text..[[',

    manualenabled = ']]..EnableManualOverride.Text..[[',

    manualdisplaystart = ']]..ManualDisplayStart.Text..[[',
    manualdisplayend = ']]..ManualDisplayEnd.Text..[[',

    manualchatstart = ']]..ManualChatStart.Text..[[',
    manualchatend = ']]..ManualChatEnd.Text..[['
}

return chatconfig
    ]])
end)

LoadConfig.MouseButton1Click:Connect(function()
    loadconfig(ConfigName.Text)
end)

DeleteConfig.MouseButton1Click:Connect(function()
    delfile("prochat/"..ConfigName.Text.."_proconfig.lua")
end)

--// favorite color setter
SetFavoriteColor.FocusLost:connect(function(enterPressed)
    if enterPressed then
        SetFavoriteColor.TextColor3 = Color3.fromHex(SetFavoriteColor.Text)
        CopyFavoriteColor.ImageColor3 = Color3.fromHex(SetFavoriteColor.Text)
    end
end)
