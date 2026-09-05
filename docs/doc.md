# Sealz Interface
Interface Suit for Roblox. Ultrasmooth, Mobile Friendly.
# Load Library
```lua
local Sealz = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/Sealz/refs/heads/main/source/source.luau"))();
```

# Build a Logger
```lua
local Logger = Sealz.Logger();
```
```lua
Logger.new("Hit Player in the head for 200 damage (0 health remaining)",5)
```
| Arguments | Description | Type |
| --- | --- | -- |
| 1 | Text | String |
| 2 | duration | Number |

# Build a Watermark
```lua
local Watermark = Sealz.Watermark();
```
Text:
```lua
local Watermark = Sealz.Watermark();

Watermark.new("square-person","Sealz")
Watermark.new("fingerprint",Sealz.Verion)
```
| Arguments | Description | Type |
| --- | --- | -- |
| 1 | Icon | String |
| 2 | Text | String |

Button:
```lua
local Watermark = Sealz.Watermark();

Watermark:AddButton("MENU",function()
	Window:Toggle()
end)
```
| Arguments | Description | Type |
| --- | --- | -- |
| 1 | Text | String |
| 2 | Callback | Function |

# Build a Indicator
```lua
local Indicator = Sealz.Indicator();
```
```lua
local IndicatorItem = Indicator.new("person-walking","Text",Color3.fromRGB(255,255,255));
```
| Arguments | Description | Type |
| --- | --- | -- |
| 1 | Icon | String |
| 2 | Text | String |
| 3 | Color | Color3 |
```lua
IndicatorItem:SetText(<string>)
```
```lua
IndicatorItem:SetColor(<Color3>)
```
```lua
IndicatorItem:Render(<Boolean>)
```

# Build a Window
```lua
local Window = Sealz.new({
	Title = "Sealz Library",
	Description = "By 4lpaca",
	Path = "sealz.ui",
	Scale = 1,
	Size = Sealz.Sizes.Default,
	Keybind = "Insert",
});
```

| Arguments | Description | Type |
| --- | --- | -- |
| Title | Name of the window | String |
| Description | Second Text of the window | String |
| Path | Directory path for save annd load config | String |
| Scale | Custom Scale of the window (may have some bug) | Number |
| Size | UDim2 Size of the window | UDim2 |
| Keybind | Keybind of the window | String, Enum.KeyCode |

Toggle the window
```lua
Window:Toggle()
```
Move window to center of the screen
```lua
Window:ForceCenter()
```

# Create Menu
```lua
local Menu = Window:AddMenu({
	Name = "GENERAL"
});
```
| Arguments | Description | Type |
| --- | --- | -- |
| Name | Name of the menu | String |

# Create Tab
```lua
local Tab = Menu:AddTab()
```

# Create Section
```lua
local Section = Menu:AddSection("Section");
```
| Arguments | Description | Type |
| --- | --- | -- |
| Name | Name of the section | String |

# Create Label
```lua
local Label = Section:AddLabel("Label");
```
### Tool Tip
```lua
Label:ToolTip("Tool Tip!");
```
## Create Toggle
```lua
local Toggle = Label:AddToggle({
  Default = false,
  Flag = "MyToggle",
  Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Default | Default value of toggle | Boolean |
| Callback | action callback | Function |
| Flag | Id of toggle for save data | String |

### Auto Keybind
Right click on toggle to use.
```lua
local Bind = Toggle:AutoKeybind(Enum.KeyCode.E,"Hold",false);
```
```lua
if Bind:IsActive() then
    print("bind")
else
    print("no")
end;
```
| Arguments | Description | Type |
| --- | --- | -- |
| 1 | Default key | Enu.KeyCode, Enum.UserInputType |
| 2 | action type Hold or Toggle | String |
| 3 | enable value | Boolean |

## Create Slider
```lua
local Toggle = Label:AddToggle({
  Default = 5,
	Max = 10,
	Min = 1,
	Rounding = 1,
	Type = "%",
  Flag = "MySlider",
  Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Default | Default value of slider | Number |
| Max | Maximum value of slider | Number |
| Min | Minimum value of slider | Number |
| Rounding | rounding number value | Number |
| Type | type of number. ex: "10%" | String |
| Callback | action callback | Function |
| Flag | Id for save data | String |

## Create Button
```lua
local Toggle = Label:AddButton({
	Name = "Button",
	Callback = function()
    
  end,
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Name | Text of Button | String |
| Callback | action callback | Function |

## Create Input
```lua
local Toggle = Label:AddInput({
	Default = "",
	Placeholder = "Search",
	Size = "Auto",
	Numeric = false,
	Flag = "MyInput",
	Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Default | default text | String |
| Placeholder | Placeholder text | String |
| Size | Maximum size X. "Auto" for inf | Number, String |
| Numeric | number only | Boolean |
| Callback | action callback | Function |
| Flag | Id for save data | String |

## Create Keybind
```lua
local Toggle = Label:AddKeybind({
	Default = Enum.KeyCode.F,
	Flag = "MyKeybind",
  Blacklist = {
      Enum.KeyCode.X
  },
	Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Default | default key of keybind | Enum.KeyCode, Enum.UserInputType |
| Blacklist | blacklist key | Table |
| Callback | action callback | Function |
| Flag | Id for save data | String |

## Create Color Picker
```lua
local Toggle = Label:AddColorPicker({
	Default = Color3.fromRGB(255,255,255),
	Flag = "MyColor",
	Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Default | default color | Color3 |
| Callback | action callback | Function |
| Flag | Id for save data | String |

## Create Dropdown
```lua
local Toggle = Label:AddDropdown({
	Flag = "MyDropdown",
	Default = "A",
	Values = {"A","B","C","D"},
  Size = 100,
	Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Default | default value | Any |
| Values | list data | Table |
| Size | size x of window | Number |
| Callback | action callback | Function |
| Flag | Id for save data | String |

### Multi Dropdown
```lua
local Toggle = Label:AddDropdown({
	Flag = "MyMultiDropdown",
	Default = {
    A = true
  },
  Multi = true,
	Values = {"A","B","C","D"},
	Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Multi | enable multi | Boolean |

### Image Dropdown
```lua
local Toggle = Label:AddDropdown({
	Flag = "MyImageDropdown",
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
	Size = 325, 
	Callback = function(value)
    
  end
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Type | dropdown type "Text" or "Image" | String |

Update dropdown list
```lua
Item:SetValues()
```

## API
```lua
Item:GetValue() -> any
```
```lua
Item:SetValue(<any>)
```

## Create Audio Player
```lua
Label:AddAudio({
	Audio = "rbxassetid://129077471372634",
	Volume = 1,
	Speed = 1,
})
```
| Arguments | Description | Type |
| --- | --- | -- |
| Audio | assetid | String |
| Volume | Audio volume | Number |
| Speed | Audio Playback speed | Number |
Set new sound Id
```lua
Audio:SetAudio(<String>)
```
Set new sound Volume
```lua
Audio:SetVolume(<Number>)
```
Set new Playback speed
```lua
Audio:SetSpeed(<Number>)
```

# Create a Image
```lua
Section:AddImage({
	Image = "rbxassetid://1488833226",
	Type = "Fit",
	Size = 150,
});
```
Set new image
```lua
Image:SetImage(<String>)
```
Set new size
```lua
Audio:SetSize(<Number>)
```

| Arguments | Description | Type |
| --- | --- | -- |
| Image | image id | String |
| Type | Crop , Fit , Stretch | String |
| Size | Size of image | Number |

# Build a Tool
```lua
local Tool = Window:AddTool("gear")
```
| Arguments | Description | Type |
| --- | --- | -- |
| 1 | Icon | String |
Everything like section.
```lua
Tool:AddLabel(...)......
```

# Config
Load Config
```lua
Window:Load(<Path, Nil>);
```
Save Config
```lua
Window:Save();
```
Enable Auto Save
```lua
Window:AutoSave();
```
