
local G2L = {};

G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0.35169, 0, 0.25346, 0);
G2L["2"]["Position"] = UDim2.new(0.49231, 0, 0.4641, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);


-- StarterGui.ScreenGui.Frame.Frame
G2L["3"] = Instance.new("Frame", G2L["2"]);
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(94, 94, 94);
G2L["3"]["Size"] = UDim2.new(1, 0, 0.97, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);


-- StarterGui.ScreenGui.Frame.Frame.TextLabel
G2L["4"] = Instance.new("TextLabel", G2L["3"]);
G2L["4"]["TextWrapped"] = true;
G2L["4"]["TextSize"] = 14;
G2L["4"]["TextScaled"] = true;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["BackgroundTransparency"] = 1;
G2L["4"]["Size"] = UDim2.new(0.88369, 0, 0.30301, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["4"]["Text"] = [[Are you sure you'd like to load this script?]];
G2L["4"]["Position"] = UDim2.new(0.057, 0, 0.0687, 0);


-- StarterGui.ScreenGui.Frame.Frame.Load
G2L["5"] = Instance.new("TextButton", G2L["3"]);
G2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["TextSize"] = 14;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["Size"] = UDim2.new(0.35, 0, 0.15, 0);
G2L["5"]["BackgroundTransparency"] = 0.9;
G2L["5"]["Name"] = [[Load]];
G2L["5"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["5"]["Text"] = [[LOAD]];
G2L["5"]["Position"] = UDim2.new(0.09904, 0, 0.58634, 0);


-- StarterGui.ScreenGui.Frame.Frame.Load.UICorner
G2L["6"] = Instance.new("UICorner", G2L["5"]);
G2L["6"]["CornerRadius"] = UDim.new(0.5, 0);


-- StarterGui.ScreenGui.Frame.Frame.Load.LocalScript
G2L["7"] = Instance.new("LocalScript", G2L["5"]);



-- StarterGui.ScreenGui.Frame.Frame.Cancel
G2L["8"] = Instance.new("TextButton", G2L["3"]);
G2L["8"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["TextSize"] = 14;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"]["Size"] = UDim2.new(0.35, 0, 0.15, 0);
G2L["8"]["BackgroundTransparency"] = 0.9;
G2L["8"]["Name"] = [[Cancel]];
G2L["8"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["8"]["Text"] = [[CANCEL]];
G2L["8"]["Position"] = UDim2.new(0.56173, 0, 0.5851, 0);


-- StarterGui.ScreenGui.Frame.Frame.Cancel.UICorner
G2L["9"] = Instance.new("UICorner", G2L["8"]);
G2L["9"]["CornerRadius"] = UDim.new(0.5, 0);


-- StarterGui.ScreenGui.Frame.Frame.Cancel.LocalScript
G2L["a"] = Instance.new("LocalScript", G2L["8"]);



-- StarterGui.ScreenGui.Frame.Frame.UICorner
G2L["b"] = Instance.new("UICorner", G2L["3"]);
G2L["b"]["CornerRadius"] = UDim.new(0.125, 0);


-- StarterGui.ScreenGui.Frame.Frame.TextLabel
G2L["c"] = Instance.new("TextLabel", G2L["3"]);
G2L["c"]["TextWrapped"] = true;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextScaled"] = true;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c"]["TextColor3"] = Color3.fromRGB(171, 0, 0);
G2L["c"]["BackgroundTransparency"] = 1;
G2L["c"]["Size"] = UDim2.new(0.84423, 0, 0.13764, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["c"]["Text"] = [[This may lag your game.]];
G2L["c"]["Position"] = UDim2.new(0.07625, 0, 0.40648, 0);


-- StarterGui.ScreenGui.Frame.Frame.TextLabel
G2L["d"] = Instance.new("TextLabel", G2L["3"]);
G2L["d"]["TextWrapped"] = true;
G2L["d"]["TextSize"] = 14;
G2L["d"]["TextScaled"] = true;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["BackgroundTransparency"] = 1;
G2L["d"]["Size"] = UDim2.new(0.84423, 0, 0.13764, 0);
G2L["d"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["d"]["Text"] = [[Iris Remote Spy]];
G2L["d"]["Position"] = UDim2.new(0.07625, 0, 0.77945, 0);


-- StarterGui.ScreenGui.Frame.UICorner
G2L["e"] = Instance.new("UICorner", G2L["2"]);
G2L["e"]["CornerRadius"] = UDim.new(0.175, 0);


-- StarterGui.ScreenGui.Frame.Frame.Load.LocalScript
local function C_7()
local script = G2L["7"];
	
	local gui = script.Parent.Parent.Parent.Parent.Parent.ScreenGui
	
	script.Parent.MouseButton1Click:connect(function()
			print("loading iris")
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Michaellitsxd/CUSOTM-IY/refs/heads/main/iris.lua'))()
            gui:Destroy()
	end)
	
end;
task.spawn(C_7);
-- StarterGui.ScreenGui.Frame.Frame.Cancel.LocalScript
local function C_a()
local script = G2L["a"];
	
	local gui = script.Parent.Parent.Parent.Parent.Parent.ScreenGui
	
	script.Parent.MouseButton1Click:connect(function()
			gui:Destroy()
            print("destroyed ui")
	end)
	
end;
task.spawn(C_a);

return G2L["1"], require;
