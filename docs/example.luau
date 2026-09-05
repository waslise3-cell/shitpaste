local Sealz = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/Sealz/refs/heads/main/source/source.luau"))();

local Window = Sealz.new({
	Title = "Sealz Library", -- title of the window
	Description = "By 4lpaca", -- description of the window
	Path = "sealz.ui", -- directory path for save config
	
	--Scale = (Sealz.IsMobile and 0.75) or 1, -- UI scale >>>> (many bugs)
	
	Size = (Sealz.IsMobile and Sealz.Sizes.Small) or Sealz.Sizes.Default,
	
	Keybind = "Insert", -- ui keybind
});

local Logger = Sealz.Logger();
local Indicator = Sealz.Indicator();
local Watermark = Sealz.Watermark();

Watermark.new("square-person","Sealz")
Watermark.new("fingerprint",Sealz.Verion)

local Ping = Watermark.new("square-bar-graph",'')

local FirstIndicator = Indicator.new("person-walking","16",Sealz.ColorMode.Red);

-- Menu Toggle Button

Watermark:AddButton("MENU",function()
	Window:Toggle()
end)

-- Force Center (recommended for mobile)
-- This will bring UI to center of the screen
Watermark:AddButton("+",function()
	Window:ForceCenter()
end)

-- Visible Indicator
FirstIndicator:Render(true);

task.spawn(function()
	while true do task.wait(0.05)
		local Look = workspace.CurrentCamera.CFrame.LookVector.X;
		
		-- CHange Indicator Text
		FirstIndicator:SetText(tostring(Sealz:Rounding(Look,2)));
		
		--[[
				Change Indicator Color
			FirstIndicator:SetColor(<Color3 or Sealz.ColorMode>)
		]]
		
		
		-- Change Watermark Text
		if game:GetService('RunService'):IsStudio() then
			Ping:SetText(tostring(math.random(20,55))..'ms')
		else
			Ping:SetText(tostring(Sealz:Rounding(game:GetService('Players').LocalPlayer:GetNetworkPing(),2))..'ms')
		end
	end
end)

local MainMenu = Window:AddMenu({
	Name = "GENERAL"
});

local MiscMenu = Window:AddMenu({
	Name = "MISCELLANEOUS"
});

do
	for i = 1 , 3 do
		local extra = MiscMenu:AddTab()
		
		extra:AddSection("Section")
		extra:AddSection("Extra Section")
	end;
end;

local FirstTab = MainMenu:AddTab();
local SecondTab = MainMenu:AddTab();


local First = FirstTab:AddSection("First Section");

local Second = SecondTab:AddSection("Second Section");

local Bottom = SecondTab:AddSection("Bottom Section");
Bottom:AddLabel("Scroll down for more maltese.");


Bottom:AddImage({
	Image = "rbxassetid://89078820",
	Type = "Fit",
	Size = 150,
});

Bottom:AddImage({
	Image = "rbxassetid://6762647",
	Type = "Fit",
	Size = 150,
});

Bottom:AddImage({
	Image = "rbxassetid://1488833226",
	Type = "Fit",
	Size = 150,
});

Second:AddLabel("You can")
Second:AddLabel("Add as many tabs as you want");

local Toggle = First:AddLabel("Toggle"):ToolTip("Example Toggle\nJust press"):AddToggle({
	Default = false,
	Flag = "Toggle",
	Callback = print,
});

-- <Enum.KeyCode or Enum.UserInputType , "Hold" or "Toggle" , Boolean>
local AutoKeybind = Toggle:AutoKeybind(Enum.KeyCode.E,"Hold",false);

task.spawn(function()
	while true do task.wait()
		if AutoKeybind:IsActive() then
			print('bind!')
		end
	end
end)

First:AddLabel("try right click on toggle."):ToolTip("Right click on toggle.")

First:AddLabel("Slider"):AddSlider({
	Flag = "Slider",
	Default = 5,
	Max = 10,
	Min = 1,
	Rounding = 1,
	Type = "%",
	Callback = print,
})

First:AddLabel("Click"):AddButton({
	Name = "Button",
	Callback = print,
})

First:AddLabel("Input"):AddInput({
	Default = "",
	Placeholder = "Search",
	Size = "Auto", -- "Auto" or number
	Numeric = false,
	Flag = "Input",
	Callback = print,
})


First:AddLabel("Input"):AddKeybind({
	Default = Enum.KeyCode.F,
	
	Flag = "Keybind",
	Callback = print,
})

First:AddLabel("Color"):AddColorPicker({
	Default = Color3.fromRGB(255,255,255),
	Flag = "Color",
	Callback = print,
})

First:AddLabel("Option"):AddOption():AddLabel("Hello, World"):AddButton({
	Name = "Button",
	Callback = print
})

First:AddLabel("Dropdown"):AddDropdown({
	Flag = "DB",
	Default = "A",
	Values = {"A","B","C","D"},
	Callback = print,
})

First:AddLabel("Multi Dropdown"):AddDropdown({
	Flag = "DBm",
	
	Default = {
		A = true	
	},
	Multi = true,
	Values = {"A","B","C","D"},
	Callback = print,
});

First:AddLabel("Audio Player"):AddAudio({
	Audio = "rbxassetid://129077471372634",
	Volume = 1,
	Speed = 1,
})

Second:AddLabel("Image Dropdown"):AddDropdown({
	Flag = "DBImage",
	Type = "Image",
	Default = "The Singularity",
	Values = {
		{
			Name = "The Singularity",
			Description = "HUX A7 13",
			Image = "rbxassetid://111340797625892"
		},
		{
			Name = "The Mastermind",
			Description = "Albert Wesker",
			Image = "rbxassetid://121092959701558"
		},
		{
			Name = "The Huntress",
			Description = "I don't know",
			Image = "rbxassetid://2500874070"
		},
		{
			Name = "Chat GPT",
			Description = "I don't know",
			Image = "rbxassetid://121386119197954"
		}
	},
	Size = 325, -- Size X of Dropdown Menu
	Callback = print,
})

Second:AddLabel("Logger"):AddButton({
	Name = "Test",
	Callback = function()
		Logger.new("This Logger!",math.random(3,5))
	end,
})

local UISettings = Window:AddTool("gear")

UISettings:AddLabel("Scale"):AddSlider({
	Default = Window:GetScale(),
	Flag = "UIScale",
	Min = 0.5,
	Max = 1.5,
	Type = "%",
	Rounding = 2,
	Callback = function(value)
		Window:SetScale(value)
	end,
});

UISettings:AddLabel("Size"):AddDropdown({
	Default = "Default",
	Flag = "UIScaleUDim2",
	Values = {"Small","Default","Large"},
	Callback = function(value)
		Window:SetSize(Sealz.Sizes[value]);
	end,
})

UISettings:AddLabel("Keybind"):AddKeybind({
	Flag = "MenuKeybind",
	Default = Enum.KeyCode.Insert,
	Callback = function(value)
		Window:SetKeybind(value);
	end,
});

local WMSetting = UISettings:AddLabel("Watermark")

WMSetting:AddToggle({
	Default = true,
	Flag = "WatermarkVisible",
	Callback = function(value)
		Watermark:Render(value)
	end,
});

WMSetting:AddDropdown({
	Default = "Middle",
	FLag = "WatermarkPosition",
	Values = {"Left","Middle","Right"},
	Callback = function(value)
		Watermark:SetPosition(value);
	end,
})

UISettings:AddLabel("Indicator"):AddToggle({
	Default = true,
	Flag = "IndicatorVisible",
	Callback = function(Value)
		FirstIndicator:Render(Value);
	end,
})

-- Load Config
-- You can use custom config path: Window:Load(<Path: string>)
Window:Load();

-- Auto Save Config

-- Window:Save() < Manual

Window:AutoSave();
