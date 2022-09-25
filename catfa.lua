local ver = "0.0a"
--[[

    // catfa.lua, by spec

    ~ description - a script that uses the new richtext chat vuln
    --> CREDITS: Me, UI-Scripting | Bug, Awesome round function | Sang, Giving chatsend function | Fusion1227, Color alg

]]

getgenv().theme = {
    ["bg1"] = Color3.fromRGB(25, 27, 29),
    ["bg2"] = Color3.fromRGB(25, 27, 29),
    ["toggle"] = Color3.fromRGB(125, 125, 125),

    ["text"] = Color3.fromRGB(255, 255, 255),
    ["accent"] = Color3.fromRGB(255, 255, 255)
}

--// wait for game to load
if not game:IsLoaded() then
    repeat wait() until game:IsLoaded() 
end

wait(1)

local classicdisplay = game:GetService("Players").LocalPlayer.DisplayName

local intro = Instance.new("Sound")
local introroot = Instance.new("ScreenGui")
local jinx = Instance.new("ImageLabel")
local notif = Instance.new("TextLabel")

local getasset = getsynasset or getcustomasset

if not isfolder("catfa_assets") then
    makefolder("catfa_assets")
    if not isfile("catfa_assets/breaking.mp3") then
        writefile("catfa_assets/breaking.mp3", game:HttpGet("https://gitfront.io/r/user-8844596/uap3j1qReAyv/catfa/raw/breakinggood.mp3"))
    end
end

intro.Parent = game:GetService("Workspace")
intro.SoundId = "rbxassetid://5772117110"
intro.Volume = 8
intro.Name = "Intro"

introroot.Parent = game:GetService("CoreGui")
introroot.Name = "IntroRoot"

jinx.Name = "jinx"
jinx.Parent = introroot
jinx.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jinx.BackgroundTransparency = 1.000
jinx.Position = UDim2.new(0.5, -50, 0.5, -50)
jinx.Image = "rbxassetid://8730930741"

notif.Name = "notif"
notif.Parent = introroot
notif.BackgroundTransparency = 1.000
notif.Position = UDim2.new(0.5, -100, 0.5, -25)
notif.Size = UDim2.new(0, 200, 0, 50)
notif.Font = Enum.Font.Gotham
notif.TextColor3 = theme.text
notif.TextSize = 16.000
notif.TextStrokeTransparency = 0.9
notif.TextTransparency = 1

local function funny(sizey, rot, waittime)
    jinx.Size = UDim2.new(0, 100, 0, sizey)
    jinx.Rotation = rot
    wait(waittime)
end

local function fade(text)
    notif.Text = text
    game:GetService("TweenService"):Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextTransparency=0}):Play()
    wait(0.75)
    game:GetService("TweenService"):Create(notif, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextTransparency=1}):Play()
    wait(0.75)
end

--// intro
spawn(function()
    if game.PlaceId == 4282985734 then
        intro.SoundId = getasset("catfa_assets/breaking.mp3")
        intro:Play()
        fade("Error")
        fade("unsupported game")
        fade("catfa v"..ver)
        fade("spec")
        spawn(function()
            wait(2)
            intro:Destroy()
            return print("Experience chat not found, catfa unsupported.")
        end)
    elseif game:GetService("CoreGui"):FindFirstChild("ExperienceChat") then
        intro:Play()
        funny(50, 0, 0.5)
        funny(100, -25, 0.5)
        for i = 1, 7 do
            funny(50, 0, 0.1)
            funny(100, 0, 0.1)
        end
        funny(100, 90, 0.1)
        wait(0.5)
        jinx:Destroy()
        wait(0.5)
        intro.SoundId = getasset("catfa_assets/breaking.mp3")
        intro:Play()
        wait(0.2)
        fade("Loaded")
        fade("catfa v"..ver)
        fade("spec")
        wait(2)
        intro:Destroy()
    elseif not game:GetService("CoreGui"):FindFirstChild("ExperienceChat") then
        intro.SoundId = getasset("catfa_assets/breaking.mp3")
        intro:Play()
        fade("Error")
        fade("ExperienceChat not found")
        fade("catfa v"..ver)
        fade("spec")
        spawn(function()
            wait(2)
            intro:Destroy()
            return print("Experience chat not found, catfa unsupported.")
        end)
    end
    
    wait(2)
    introroot:Destroy()
end)

--// catfa ui build v0.2, why tf does this have to be 500+ lines of ui -.-
local Functions = {
	["Round"] = function(Object, Amount)
		local Round = Instance.new("UICorner", Object)
		Round.CornerRadius = UDim.new(0, Amount)
	end
}

local namecall
namecall = hookmetamethod(game, "__namecall", function(self, ...)
	local Function = getnamecallmethod() 

	if Functions[Function] then
		Functions[Function](self, ...)
	else
		return namecall(self, ...)
	end
end)

--// create ui
local catfa = Instance.new("ScreenGui")
local bg1 = Instance.new("Frame")
local list = Instance.new("UIListLayout")
local pad = Instance.new("UIPadding")
local module_userinfo = Instance.new("Frame")
local userinfo_scriptname = Instance.new("TextLabel")
local destroy_catfa = Instance.new("ImageButton")
local userinfo_scriptcred = Instance.new("TextLabel")
local pad_scriptcred = Instance.new("UIPadding")
local devide1 = Instance.new("Frame")
local displaynamelabel = Instance.new("TextLabel")
local setdisplayname = Instance.new("TextBox")
local spoofrt_toggle = Instance.new("Frame")
local spoofrtlabel = Instance.new("TextLabel")
local togglespoofrt = Instance.new("TextButton")
local displayname_tsplit = Instance.new("Frame")
local displaystart_tbox = Instance.new("TextBox")
local constraint2 = Instance.new("UITextSizeConstraint")
local displayend_tbox = Instance.new("TextBox")
local constraint1 = Instance.new("UITextSizeConstraint")
local devide2 = Instance.new("Frame")
local chatvarslabel = Instance.new("TextLabel")
local chatrt_tsplit = Instance.new("Frame")
local chatrtstart_tbox = Instance.new("TextBox")
local constraint3 = Instance.new("UITextSizeConstraint")
local chatrtend_tbox = Instance.new("TextBox")
local constraint4 = Instance.new("UITextSizeConstraint")
local devide3 = Instance.new("Frame")
local chatall = Instance.new("TextBox")
local module_plugins = Instance.new("Frame")
local list_plugins = Instance.new("UIListLayout")
local openconfig = Instance.new("ImageButton")
local copyfavcol = Instance.new("ImageButton")
local bg2 = Instance.new("Frame")
local module_config = Instance.new("Frame")
local list_config = Instance.new("UIListLayout")
local pad_config = Instance.new("UIPadding")
local configlabel = Instance.new("TextLabel")
local devide4 = Instance.new("Frame")
local confignamebox = Instance.new("TextBox")
local configbox = Instance.new("Frame")
local saveconfigbtn = Instance.new("TextButton")
local list_configbox = Instance.new("UIListLayout")
local loadconfigbtn = Instance.new("TextButton")
local delconfigbtn = Instance.new("TextButton")
local devide5 = Instance.new("Frame")
local module_setfavcolor = Instance.new("Frame")
local favcolorlabel = Instance.new("TextLabel")
local hexbox = Instance.new("TextBox")

--// ui props
catfa.Name = "catfa"
catfa.Parent = game:GetService("CoreGui")

bg1.Name = "bg1"
bg1.Parent = catfa
bg1.BackgroundColor3 = theme.bg1
bg1.BackgroundTransparency = 0.300
bg1.BorderSizePixel = 0
bg1.Position = UDim2.new(0, 414, 0.314999998, 10)
bg1.Size = UDim2.new(0, 250, 0, 357)
bg1.ZIndex = -10
bg1.Visible = false
bg1:Round(10)

list.Name = "list"
list.Parent = bg1
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Padding = UDim.new(0, 6)

pad.Name = "pad"
pad.Parent = bg1
pad.PaddingTop = UDim.new(0, 6)

module_userinfo.Name = "module_userinfo"
module_userinfo.Parent = bg1
module_userinfo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
module_userinfo.BackgroundTransparency = 1.000
module_userinfo.Position = UDim2.new(0, 6, 0, 6)
module_userinfo.Size = UDim2.new(1, -12, 0, 28)
module_userinfo.ZIndex = -9

userinfo_scriptname.Name = "userinfo_scriptname"
userinfo_scriptname.Parent = module_userinfo
userinfo_scriptname.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
userinfo_scriptname.BackgroundTransparency = 1.000
userinfo_scriptname.Position = UDim2.new(0, 2, 0, 0)
userinfo_scriptname.Size = UDim2.new(1, 0, 1, 0)
userinfo_scriptname.ZIndex = 5
userinfo_scriptname.Font = Enum.Font.Gotham
userinfo_scriptname.Text = "catfa private v"..ver
userinfo_scriptname.TextColor3 = theme.text
userinfo_scriptname.TextSize = 14.000
userinfo_scriptname.TextXAlignment = Enum.TextXAlignment.Left
userinfo_scriptname.TextYAlignment = Enum.TextYAlignment.Top

destroy_catfa.Name = "destroy_catfa"
destroy_catfa.Parent = module_userinfo
destroy_catfa.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
destroy_catfa.BackgroundTransparency = 1.000
destroy_catfa.Position = UDim2.new(1, -28, 0, -2)
destroy_catfa.Size = UDim2.new(0, 30, 0, 30)
destroy_catfa.ZIndex = 2
destroy_catfa.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
destroy_catfa.ImageRectOffset = Vector2.new(228, 340)
destroy_catfa.ImageRectSize = Vector2.new(36, 36)
destroy_catfa.ImageColor3 = theme.accent

userinfo_scriptcred.Name = "userinfo_scriptcred"
userinfo_scriptcred.Parent = module_userinfo
userinfo_scriptcred.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
userinfo_scriptcred.BackgroundTransparency = 1.000
userinfo_scriptcred.Size = UDim2.new(1, 0, 1, 0)
userinfo_scriptcred.ZIndex = 5
userinfo_scriptcred.Font = Enum.Font.Gotham
userinfo_scriptcred.Text = "by spec"
userinfo_scriptcred.TextColor3 = theme.text
userinfo_scriptcred.TextSize = 11.000
userinfo_scriptcred.TextXAlignment = Enum.TextXAlignment.Left
userinfo_scriptcred.TextYAlignment = Enum.TextYAlignment.Bottom

pad_scriptcred.Name = "pad_scriptcred"
pad_scriptcred.Parent = userinfo_scriptcred
pad_scriptcred.PaddingBottom = UDim.new(0, 3)
pad_scriptcred.PaddingLeft = UDim.new(0, 2)

devide1.Name = "devide1"
devide1.Parent = bg1
devide1.BackgroundColor3 = theme.bg2
devide1.BackgroundTransparency = 0.500
devide1.BorderColor3 = Color3.fromRGB(27, 42, 53)
devide1.BorderSizePixel = 0
devide1.Size = UDim2.new(1, -20, 0, 2)

displaynamelabel.Name = "displaynamelabel"
displaynamelabel.Parent = bg1
displaynamelabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
displaynamelabel.BackgroundTransparency = 1.000
displaynamelabel.Position = UDim2.new(0, 77, 0, 0)
displaynamelabel.Size = UDim2.new(1, -20, 0, 22)
displaynamelabel.Font = Enum.Font.Gotham
displaynamelabel.Text = "Display name and richtext"
displaynamelabel.TextColor3 = theme.text
displaynamelabel.TextSize = 14.000
displaynamelabel.TextXAlignment = Enum.TextXAlignment.Left

setdisplayname.Name = "setdisplayname"
setdisplayname.Parent = bg1
setdisplayname.Active = false
setdisplayname.BackgroundColor3 = theme.bg2
setdisplayname.BackgroundTransparency = 0.200
setdisplayname.Selectable = false
setdisplayname.Size = UDim2.new(1, -12, 0, 34)
setdisplayname.Font = Enum.Font.Gotham
setdisplayname.PlaceholderText = "Display name"
setdisplayname.TextColor3 = theme.text
setdisplayname.TextSize = 14.000
setdisplayname:Round(8)

spoofrt_toggle.Name = "spoofrt_toggle"
spoofrt_toggle.Parent = bg1
spoofrt_toggle.BackgroundColor3 = theme.bg2
spoofrt_toggle.BackgroundTransparency = 0.200
spoofrt_toggle.Position = UDim2.new(0, 6, 0, 6)
spoofrt_toggle.Size = UDim2.new(1, -12, 0, 34)
spoofrt_toggle.ZIndex = -9

spoofrtlabel.Name = "spoofrtlabel"
spoofrtlabel.Parent = spoofrt_toggle
spoofrtlabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
spoofrtlabel.BackgroundTransparency = 1.000
spoofrtlabel.Position = UDim2.new(0, 40, 0, 0)
spoofrtlabel.Size = UDim2.new(1, -40, 1, 0)
spoofrtlabel.Font = Enum.Font.Gotham
spoofrtlabel.Text = "Spoof richtext"
spoofrtlabel.TextColor3 = theme.text
spoofrtlabel.TextSize = 14.000
spoofrtlabel.TextXAlignment = Enum.TextXAlignment.Left
spoofrt_toggle:Round(8)

togglespoofrt.Name = "togglespoofrt"
togglespoofrt.Parent = spoofrt_toggle
togglespoofrt.BackgroundColor3 = theme.toggle
togglespoofrt.BackgroundTransparency = 0.800
togglespoofrt.Position = UDim2.new(0, 6, 0, 6)
togglespoofrt.Size = UDim2.new(0, 22, 0, 22)
togglespoofrt.Font = Enum.Font.SourceSans
togglespoofrt.Text = ""
togglespoofrt.TextColor3 = theme.text
togglespoofrt.TextSize = 14.000
togglespoofrt:Round(6)

displayname_tsplit.Name = "displayname_tsplit"
displayname_tsplit.Parent = bg1
displayname_tsplit.BackgroundColor3 = theme.bg2
displayname_tsplit.BackgroundTransparency = 0.200
displayname_tsplit.Position = UDim2.new(0, 6, 0, 6)
displayname_tsplit.Size = UDim2.new(1, -12, 0, 34)
displayname_tsplit.ZIndex = -9
displayname_tsplit:Round(8)

displaystart_tbox.Name = "displaystart_tbox"
displaystart_tbox.Parent = displayname_tsplit
displaystart_tbox.Active = false
displaystart_tbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
displaystart_tbox.BackgroundTransparency = 1.000
displaystart_tbox.Selectable = false
displaystart_tbox.Size = UDim2.new(1, -113, 1, 0)
displaystart_tbox.ClearTextOnFocus = false
displaystart_tbox.Font = Enum.Font.Gotham
displaystart_tbox.PlaceholderText = "Richtext start"
displaystart_tbox.Text = "<font size=\"20\">"
displaystart_tbox.TextColor3 = theme.text
displaystart_tbox.TextSize = 14.000
displaystart_tbox.TextScaled = true
displaystart_tbox.TextWrapped = true

constraint2.Name = "constraint2"
constraint2.Parent = displaystart_tbox
constraint2.MaxTextSize = 14

displayend_tbox.Name = "displayend_tbox"
displayend_tbox.Parent = displayname_tsplit
displayend_tbox.Active = false
displayend_tbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
displayend_tbox.BackgroundTransparency = 1.000
displayend_tbox.Position = UDim2.new(0, 126, 0, 0)
displayend_tbox.Selectable = false
displayend_tbox.Size = UDim2.new(1, -126, 1, 0)
displayend_tbox.ClearTextOnFocus = false
displayend_tbox.Font = Enum.Font.Gotham
displayend_tbox.PlaceholderText = "Richtext end"
displayend_tbox.Text = "<\\font>"
displayend_tbox.TextColor3 = theme.text
displayend_tbox.TextScaled = true
displayend_tbox.TextSize = 14.000
displayend_tbox.TextWrapped = true

constraint1.Name = "constraint1"
constraint1.Parent = displayend_tbox
constraint1.MaxTextSize = 14

devide2.Name = "devide2"
devide2.Parent = bg1
devide2.BackgroundColor3 = theme.bg2
devide2.BackgroundTransparency = 0.500
devide2.BorderColor3 = Color3.fromRGB(27, 42, 53)
devide2.BorderSizePixel = 0
devide2.Size = UDim2.new(1, -20, 0, 2)

chatvarslabel.Name = "chatvarslabel"
chatvarslabel.Parent = bg1
chatvarslabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
chatvarslabel.BackgroundTransparency = 1.000
chatvarslabel.Position = UDim2.new(0, 77, 0, 0)
chatvarslabel.Size = UDim2.new(1, -20, 0, 22)
chatvarslabel.Font = Enum.Font.Gotham
chatvarslabel.Text = "Chat richtext"
chatvarslabel.TextColor3 = theme.text
chatvarslabel.TextSize = 14.000
chatvarslabel.TextXAlignment = Enum.TextXAlignment.Left

chatrt_tsplit.Name = "chatrt_tsplit"
chatrt_tsplit.Parent = bg1
chatrt_tsplit.BackgroundColor3 = theme.bg2
chatrt_tsplit.BackgroundTransparency = 0.200
chatrt_tsplit.Position = UDim2.new(0, 6, 0, 6)
chatrt_tsplit.Size = UDim2.new(1, -12, 0, 34)
chatrt_tsplit.ZIndex = -9
chatrt_tsplit:Round(8)

chatrtstart_tbox.Name = "chatrtstart_tbox"
chatrtstart_tbox.Parent = chatrt_tsplit
chatrtstart_tbox.Active = false
chatrtstart_tbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
chatrtstart_tbox.BackgroundTransparency = 1.000
chatrtstart_tbox.Selectable = false
chatrtstart_tbox.Size = UDim2.new(1, -113, 1, 0)
chatrtstart_tbox.ClearTextOnFocus = false
chatrtstart_tbox.Font = Enum.Font.Gotham
chatrtstart_tbox.PlaceholderText = "Richtext start"
chatrtstart_tbox.Text = "<font size=\"20\">"
chatrtstart_tbox.TextColor3 = theme.text
chatrtstart_tbox.TextSize = 14.000
chatrtstart_tbox.TextScaled = true
chatrtstart_tbox.TextWrapped = true

constraint3.Name = "constraint3"
constraint3.Parent = chatrtstart_tbox
constraint3.MaxTextSize = 14

chatrtend_tbox.Name = "chatrtend_tbox"
chatrtend_tbox.Parent = chatrt_tsplit
chatrtend_tbox.Active = false
chatrtend_tbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
chatrtend_tbox.BackgroundTransparency = 1.000
chatrtend_tbox.Position = UDim2.new(0, 126, 0, 0)
chatrtend_tbox.Selectable = false
chatrtend_tbox.Size = UDim2.new(1, -126, 1, 0)
chatrtend_tbox.ClearTextOnFocus = false
chatrtend_tbox.Font = Enum.Font.Gotham
chatrtend_tbox.PlaceholderText = "Richtext end"
chatrtend_tbox.Text = "<\\font>"
chatrtend_tbox.TextColor3 = theme.text
chatrtend_tbox.TextSize = 14.000
chatrtend_tbox.TextWrapped = true
chatrtend_tbox.TextScaled = true
chatrtend_tbox.TextWrapped = true

constraint4.Name = "constraint4"
constraint4.Parent = chatrtend_tbox
constraint4.MaxTextSize = 14

devide3.Name = "devide3"
devide3.Parent = bg1
devide3.BackgroundColor3 = theme.bg2
devide3.BackgroundTransparency = 0.500
devide3.BorderColor3 = Color3.fromRGB(27, 42, 53)
devide3.BorderSizePixel = 0
devide3.Size = UDim2.new(1, -20, 0, 2)

chatall.Name = "chatall"
chatall.Parent = bg1
chatall.Active = false
chatall.BackgroundColor3 = theme.bg2
chatall.BackgroundTransparency = 0.200
chatall.Selectable = false
chatall.Size = UDim2.new(1, -12, 0, 34)
chatall.Font = Enum.Font.Gotham
chatall.PlaceholderText = "Chat all"
chatall.Text = ""
chatall.TextColor3 = theme.text
chatall.TextSize = 14.000
chatall:Round(8)

module_plugins.Name = "module_plugins"
module_plugins.Parent = bg1
module_plugins.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
module_plugins.BackgroundTransparency = 1.000
module_plugins.Position = UDim2.new(0, 6, 0, 6)
module_plugins.Size = UDim2.new(1, -12, 0, 34)
module_plugins.ZIndex = -9

list_plugins.Name = "list_plugins"
list_plugins.Parent = module_plugins
list_plugins.FillDirection = Enum.FillDirection.Horizontal
list_plugins.SortOrder = Enum.SortOrder.LayoutOrder
list_plugins.Padding = UDim.new(0, 6)

openconfig.Name = "openconfig"
openconfig.Parent = module_plugins
openconfig.BackgroundColor3 = theme.bg2
openconfig.BackgroundTransparency = 0.500
openconfig.Size = UDim2.new(0, 30, 0, 30)
openconfig.ZIndex = 2
openconfig.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
openconfig.ImageRectOffset = Vector2.new(76, 454)
openconfig.ImageRectSize = Vector2.new(36, 36)
openconfig.ImageColor3 = theme.accent
openconfig:Round(8)

copyfavcol.Name = "copyfavcol"
copyfavcol.Parent = module_plugins
copyfavcol.BackgroundColor3 = theme.bg2
copyfavcol.BackgroundTransparency = 0.500
copyfavcol.Size = UDim2.new(0, 30, 0, 30)
copyfavcol.ZIndex = 2
copyfavcol.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/App/ImageSet/ImageAtlas/img_set_1x_5.png"
copyfavcol.ImageRectOffset = Vector2.new(114, 303)
copyfavcol.ImageRectSize = Vector2.new(36, 36)
copyfavcol:Round(8)

bg2.Name = "bg2"
bg2.Parent = bg1
bg2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg2.BackgroundTransparency = 1.000
bg2.Size = UDim2.new(1, 0, 0, 15)
bg2.ZIndex = -9

module_config.Name = "module_config"
module_config.Parent = bg2
module_config.BackgroundColor3 = theme.bg1
module_config.BackgroundTransparency = 0.300
module_config.BorderSizePixel = 0
module_config.Position = UDim2.new(0, 0, 1, 0)
module_config.Size = UDim2.new(0, 250, 0, 172)
module_config.ZIndex = -10
module_config.Visible = false
module_config:Round(10)

list_config.Name = "list_config"
list_config.Parent = module_config
list_config.HorizontalAlignment = Enum.HorizontalAlignment.Center
list_config.SortOrder = Enum.SortOrder.LayoutOrder
list_config.Padding = UDim.new(0, 6)

pad_config.Name = "pad_config"
pad_config.Parent = module_config
pad_config.PaddingTop = UDim.new(0, 7)

configlabel.Name = "configlabel"
configlabel.Parent = module_config
configlabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
configlabel.BackgroundTransparency = 1.000
configlabel.Position = UDim2.new(0, 77, 0, 0)
configlabel.Size = UDim2.new(1, -20, 0, 22)
configlabel.Font = Enum.Font.Gotham
configlabel.Text = "Config"
configlabel.TextColor3 = theme.text
configlabel.TextSize = 14.000
configlabel.TextXAlignment = Enum.TextXAlignment.Left

devide4.Name = "devide4"
devide4.Parent = module_config
devide4.BackgroundColor3 = theme.bg2
devide4.BackgroundTransparency = 0.500
devide4.BorderColor3 = Color3.fromRGB(27, 42, 53)
devide4.BorderSizePixel = 0
devide4.Size = UDim2.new(1, -20, 0, 2)

confignamebox.Name = "confignamebox"
confignamebox.Parent = module_config
confignamebox.Active = false
confignamebox.BackgroundColor3 = theme.bg2
confignamebox.BackgroundTransparency = 0.200
confignamebox.Selectable = false
confignamebox.Size = UDim2.new(1, -12, 0, 34)
confignamebox.Font = Enum.Font.Gotham
confignamebox.PlaceholderText = "Config name"
confignamebox.Text = ""
confignamebox.TextColor3 = theme.text
confignamebox.TextSize = 14.000
confignamebox:Round(8)

configbox.Name = "configbox"
configbox.Parent = module_config
configbox.BackgroundColor3 = theme.bg2
configbox.BackgroundTransparency = 0.200
configbox.Position = UDim2.new(0, 6, 0, 6)
configbox.Size = UDim2.new(1, -12, 0, 34)
configbox.ZIndex = -9
configbox:Round(8)

saveconfigbtn.Name = "saveconfigbtn"
saveconfigbtn.Parent = configbox
saveconfigbtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
saveconfigbtn.BackgroundTransparency = 1.000
saveconfigbtn.Position = UDim2.new(0, 6, 0, 6)
saveconfigbtn.Size = UDim2.new(0, 73, 0, 24)
saveconfigbtn.Font = Enum.Font.Gotham
saveconfigbtn.Text = "Save"
saveconfigbtn.TextColor3 = theme.text
saveconfigbtn.TextSize = 14.000

list_configbox.Name = "list_configbox"
list_configbox.Parent = configbox
list_configbox.FillDirection = Enum.FillDirection.Horizontal
list_configbox.HorizontalAlignment = Enum.HorizontalAlignment.Center
list_configbox.SortOrder = Enum.SortOrder.LayoutOrder
list_configbox.VerticalAlignment = Enum.VerticalAlignment.Center
list_configbox.Padding = UDim.new(0, 4)

loadconfigbtn.Name = "loadconfigbtn"
loadconfigbtn.Parent = configbox
loadconfigbtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadconfigbtn.BackgroundTransparency = 1.000
loadconfigbtn.Position = UDim2.new(0, 6, 0, 6)
loadconfigbtn.Size = UDim2.new(0, 73, 0, 24)
loadconfigbtn.Font = Enum.Font.Gotham
loadconfigbtn.Text = "Load"
loadconfigbtn.TextColor3 = theme.text
loadconfigbtn.TextSize = 14.000

delconfigbtn.Name = "delconfigbtn"
delconfigbtn.Parent = configbox
delconfigbtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
delconfigbtn.BackgroundTransparency = 1.000
delconfigbtn.Position = UDim2.new(0, 6, 0, 6)
delconfigbtn.Size = UDim2.new(0, 73, 0, 24)
delconfigbtn.Font = Enum.Font.Gotham
delconfigbtn.Text = "Delete"
delconfigbtn.TextColor3 = theme.text
delconfigbtn.TextSize = 14.000

devide5.Name = "devide5"
devide5.Parent = module_config
devide5.BackgroundColor3 = theme.bg2
devide5.BackgroundTransparency = 0.500
devide5.BorderColor3 = Color3.fromRGB(27, 42, 53)
devide5.BorderSizePixel = 0
devide5.Size = UDim2.new(1, -20, 0, 2)

module_setfavcolor.Name = "module_setfavcolor"
module_setfavcolor.Parent = module_config
module_setfavcolor.BackgroundColor3 = theme.bg2
module_setfavcolor.BackgroundTransparency = 0.200
module_setfavcolor.Position = UDim2.new(0, 6, 0, 6)
module_setfavcolor.Size = UDim2.new(1, -12, 0, 34)
module_setfavcolor.ZIndex = -9

favcolorlabel.Name = "favcolorlabel"
favcolorlabel.Parent = module_setfavcolor
favcolorlabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
favcolorlabel.BackgroundTransparency = 1.000
favcolorlabel.Position = UDim2.new(0, 77, 0, 0)
favcolorlabel.Size = UDim2.new(1, -77, 1, 0)
favcolorlabel.Font = Enum.Font.Gotham
favcolorlabel.Text = "Set favorite color"
favcolorlabel.TextColor3 = theme.text
favcolorlabel.TextSize = 14.000
favcolorlabel.TextXAlignment = Enum.TextXAlignment.Left
module_setfavcolor:Round(8)

hexbox.Name = "hexbox"
hexbox.Parent = module_setfavcolor
hexbox.BackgroundColor3 = theme.toggle
hexbox.BackgroundTransparency = 0.800
hexbox.Position = UDim2.new(0, 6, 0, 6)
hexbox.Size = UDim2.new(0, 58, 0, 22)
hexbox.Font = Enum.Font.Gotham
hexbox.PlaceholderText = "Hex"
hexbox.Text = ""
hexbox.TextColor3 = Color3.fromRGB(0, 0, 0)
hexbox.TextSize = 14.000
hexbox:Round(6)

--// chatbar
local chatroot = game:GetService("CoreGui").ExperienceChat
local chatbar = chatroot.container.chatInputBar.Background:WaitForChild("Container")

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

--// open/close
local function TweenAll(bg1_amount, bg2_amount, toggle_amount, general_amount)
    for _, v in pairs(catfa:GetDescendants()) do
        if pcall(function() error = v.BackgroundTransparency end) then
            if v.BackgroundColor3 ~= Color3.fromRGB(0, 0, 0) then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {BackgroundTransparency=bg1_amount}):Play()

                if v.Name ~= "bg1" and v.Name ~= "module_config" then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {BackgroundTransparency=bg2_amount}):Play()
                end
                
                if v.BackgroundColor3 == theme.toggle then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {BackgroundTransparency=toggle_amount}):Play()
                end

                if pcall(function() error = v.TextTransparency end) then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency=general_amount}):Play()
                end
                
                if pcall(function() error = v.ImageTransparency end) then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {ImageTransparency=general_amount}):Play()
                end
            end
        end
    end
end

TweenAll(1, 1, 1, 1)

specialedit.MouseButton1Click:Connect(function()
    if bg1.BackgroundTransparency == 1 then
        bg1.Visible = true
        TweenAll(0.3, 0.2, 0.8, 0)
    else
        TweenAll(1, 1, 1, 1)
        wait(0.2)
        bg1.Visible = false
    end
end)

openconfig.MouseButton1Click:Connect(function()
    if module_config.Visible == true then
        module_config.Visible = false
    else
        module_config.Visible = true
    end
end)

destroy_catfa.MouseButton1Click:Connect(function()
    TweenAll(1, 1, 1, 1)
    wait(0.2)
    chatbar.SendButton.Visible = true
    chatbar.TextContainer.Size = UDim2.new(1, -30, 0, 0)
    specialsend:Destroy()
    specialedit:Destroy()
    catfa:Destroy()

    game:GetService("Players").LocalPlayer.DisplayName = classicdisplay
end)

--// config system
if not isfolder("catfa") then
    makefolder("catfa")
    if not isfile("catfa/defualt.lua") then
        writefile("catfa/defualt.lua", [[
local config = {
    DisplayName = ']]..game:GetService("Players").LocalPlayer.DisplayName..[[',
    RichTextDisplay = {'<font color="#fccc2f" size="14">', '</font>'},
    SpoofNameColor = '',
    RichTextChat = {'<font size="14">', '</font>'},
    FavoriteColor = '#ffd700',
}

return config
        ]])
    end
end

local function loadconfig(configname)
    config = loadfile("catfa/"..configname..".lua")()
    game:GetService("Players").LocalPlayer.DisplayName = config.RichTextDisplay[1]..config.DisplayName..config.RichTextDisplay[2]; setdisplayname.Text = config.DisplayName;
    displaystart_tbox.Text = config.RichTextDisplay[1]; displayend_tbox.Text = config.RichTextDisplay[2];
    togglespoofrt.Text = config.SpoofNameColor
    chatrtstart_tbox.Text = config.RichTextChat[1]; chatrtend_tbox.Text = config.RichTextChat[2];
    hexbox.Text = config.FavoriteColor; hexbox.TextColor3 = Color3.fromHex(config.FavoriteColor); copyfavcol.ImageColor3 = Color3.fromHex(config.FavoriteColor);
end

loadconfig("defualt")

--// config btns
saveconfigbtn.MouseButton1Click:Connect(function()
    writefile("catfa/"..confignamebox.Text..".lua", [[
local config = {
    DisplayName = ']]..setdisplayname.Text..[[',
    RichTextDisplay = {']]..displaystart_tbox.Text..[[', ']]..displayend_tbox.Text..[['},
    SpoofNameColor = ']]..togglespoofrt.Text..[[',
    RichTextChat = {']]..chatrtstart_tbox.Text..[[', ']]..chatrtend_tbox.Text..[['},
    FavoriteColor = ']]..hexbox.Text..[[',
}

return config
    ]])
end)

loadconfigbtn.MouseButton1Click:Connect(function()
    loadconfig(confignamebox.Text)
end)

delconfigbtn.MouseButton1Click:Connect(function()
    delfile("catfa/"..confignamebox.Text..".lua")
end)

--// color alg
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

--// say all function
local function sayall(message)
    for _, v in pairs(game.Players:GetPlayers()) do
        local color = "#"..ChatColors[getChatColorsIndex(v.Name)]
        
        game:GetService("Players").LocalPlayer.DisplayName = '<font color="'..color..'">'..v.DisplayName..'</font>'
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
        wait(0.05)
    end
end

--// send btn
specialsend.MouseButton1Click:Connect(function()
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(chatrtstart_tbox.Text..chatbar.TextContainer.TextBox.Text..chatrtend_tbox.Text)
    chatbar.TextContainer.TextBox.Text = ""
    TweenAll(1, 1, 1, 1)
    wait(0.3)
    bg1.Visible = false
end)

--// coding for ui btns now
setdisplayname.FocusLost:connect(function()
    game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..setdisplayname.Text..displayend_tbox.Text
    if togglespoofrt.Text == "x" then
        game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..'<font color="#'..ChatColors[getChatColorsIndex(setdisplayname.Text)]..'">'..setdisplayname.Text.."</font>"..displayend_tbox.Text
        if game:GetService("Players"):FindFirstChild(setdisplayname.Text) then
            game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..'<font color="#'..ChatColors[getChatColorsIndex(setdisplayname.Text)]..'">'..game:GetService("Players"):FindFirstChild(setdisplayname.Text).DisplayName.."</font>"..displayend_tbox.Text
        else
            game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..'<font color="#'..ChatColors[getChatColorsIndex(setdisplayname.Text)]..'">'..setdisplayname.Text.."</font>"..displayend_tbox.Text
        end
    end
end)

displaystart_tbox.Changed:connect(function()
    game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..setdisplayname.Text..displayend_tbox.Text
end)

displayend_tbox.Changed:connect(function()
    game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..setdisplayname.Text..displayend_tbox.Text
end)

togglespoofrt.MouseButton1Click:Connect(function()
    if togglespoofrt.Text == "" then
        togglespoofrt.Text = "x"
        if game:GetService("Players"):FindFirstChild(setdisplayname.Text) then
            game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..'<font color="#'..ChatColors[getChatColorsIndex(setdisplayname.Text)]..'">'..game:GetService("Players"):FindFirstChild(setdisplayname.Text).DisplayName.."</font>"..displayend_tbox.Text
        else
            game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..'<font color="#'..ChatColors[getChatColorsIndex(setdisplayname.Text)]..'">'..setdisplayname.Text.."</font>"..displayend_tbox.Text
        end
    else
        togglespoofrt.Text = ""
        game:GetService("Players").LocalPlayer.DisplayName = displaystart_tbox.Text..setdisplayname.Text..displayend_tbox.Text
    end
end)

chatall.FocusLost:connect(function(enterPressed)
    if enterPressed then
        if chatall.Text ~= '' or chatall.Text ~= ' ' then
            sayall(chatall.Text)
            chatall.Text = ""
        end
    end
end)

copyfavcol.MouseButton1Click:Connect(function()
    setclipboard(tostring(copyfavcol.ImageColor3:ToHex()))
    game:GetService("TweenService"):Create(copyfavcol, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {ImageTransparency=0.5}):Play()
    wait(0.3)
    game:GetService("TweenService"):Create(copyfavcol, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {ImageTransparency=0}):Play()
end)

hexbox.FocusLost:connect(function(enterPressed)
    pcall(function()
        hexbox.TextColor3 = Color3.fromHex(hexbox.Text)
        copyfavcol.ImageColor3 = Color3.fromHex(hexbox.Text)
    end)
end)
