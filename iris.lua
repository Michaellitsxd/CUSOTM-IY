
print("-----------------------------------------------------------------------")
print("Iris loading...")
local Iris: Iris
local iristime = os.clock()
if not getgenv().Iris then
	print("Iris is not cached, so it's needs to load. This may took some time.")
	getgenv().Iris = loadstring(
		game:HttpGet(
			"https://gist.githubusercontent.com/lovrewe/5d6212aef21edc546f12a0ee958ea47a/raw/8bb4eb60bc479449547a997957745f388dc8f5d2/IrisPorted.luau"
		)
	)().Init(gethui())
else
	print("Iris is cached!")
end
Iris = getgenv().Iris
print("Iris loaded! Took " .. os.clock() - iristime .. "s")
print("-----------------------------------------------------------------------")

local envcache = {
	--currenttab = 1,

	remotes = {} :: Remotes,
	spyEnabled = Iris.State(true),
}

-- misc
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old

local function tablesEqual(a, b)
	if type(a) ~= "table" or type(b) ~= "table" then
		return a == b
	end
	local ka, kb = {}, {}
	for k in a do
		ka[k] = true
	end
	for k in b do
		kb[k] = true
	end
	for k in ka do
		if kb[k] ~= true then
			return false
		end
		if type(a[k]) == "table" then
			if not tablesEqual(a[k], b[k]) then
				return false
			end
		else
			if a[k] ~= b[k] then
				return false
			end
		end
	end
	for k in kb do
		if ka[k] ~= true then
			return false
		end
	end
	return true
end

local remotesAmount = 0
local function createRemoteTable(Remote: RemoteEvent)
	remotesAmount += 1
	envcache.remotes[remotesAmount] = {}
	local ref = envcache.remotes[remotesAmount]
	ref.totalCalls = 0
	ref.totalEvents = 0
	ref.calls = {}
	ref.events = {}
	ref.methodType = {}
	ref.remote = Remote

	return ref
end

local function findRemoteTable(Remote: RemoteEvent)
	for i, v in envcache.remotes do
		if v.remote == Remote then
			return v
		end
	end

	return nil
end

local function addCall(Remote: RemoteTable, method: "FireServer" | "OnClientEvent", ...)
	if Remote == nil then
		return
	end
	local args = { ... }
	local ref = Remote
	if method == "FireServer" then
		local tablesNotEqual = true
		for i, v in ref.calls do
			if tablesEqual(v, args) then
				tablesNotEqual = false
				break
			end
		end

		if not tablesNotEqual then
			return
		end
		ref.totalCalls += 1
		ref.calls[ref.totalCalls] = args
		ref.methodType[ref.totalCalls] = method
	else
		local tablesNotEqual = true
		for i, v in ref.events do
			if tablesEqual(v, args) then
				tablesNotEqual = false
				break
			end
		end

		if not tablesNotEqual then
			return
		end
		ref.totalEvents += 1
		ref.events[ref.totalEvents] = args
		ref.methodType[ref.totalEvents] = method
	end
end

local function addRemote(Remote: RemoteEvent, method: "FireServer" | "OnClientEvent", ...)
	if not envcache.spyEnabled.value then
		return
	end
	if not findRemoteTable(Remote) then
		createRemoteTable(Remote)
	end

	addCall(findRemoteTable(Remote), method, ...)
end

local function startRecursiveTableDraw(table: { any }, tableAmount: number, i: number)
	tableAmount = tableAmount or 1
	local arguments = 0

	if Iris.Tree({ "Argument " .. i .. " | table" .. tableAmount })then
		for i, v in table do
			arguments += 1
			if type(v) == "table" then
				startRecursiveTableDraw(v, tableAmount + 1, arguments)
			else
				Iris.Text({
					"Argument "
						.. arguments
						.. " | key: "
						.. i
						.. " | key type: "
						.. typeof(i)
						.. " | value: "
						.. tostring(v)
						.. " | type: "
						.. typeof(v),
				})
				if Iris.Button({ "Copy value to the clipboard" }).clicked() then
					setclipboard(tostring(v))
				end
				if Iris.Button({ "Copy key to the clipboard" }).clicked() then
					setclipboard(tostring(i))
				end
				Iris.Separator()
			end
		end
	end
	Iris.End()
	Iris.Separator()
end

local function drawArguments(table)
	for i, v in table do
		if type(v) ~= "table" then
			Iris.Text({ "Argument " .. i .. " | value: " .. tostring(v) .. " | type: " .. typeof(v) })
			if Iris.Button({ "Copy value to the clipboard" }).clicked() then
				setclipboard(tostring(v))
			end
			Iris.Separator()
		else
			startRecursiveTableDraw(v, 1, i)
		end
	end
end

local function drawCalls()
	for index, remoteTable in ipairs(envcache.remotes) do -- using ipairs cause i can
		local remote = remoteTable.remote
		if Iris.Tree({ remote.Name .. "[" .. remoteTable.totalCalls .. "|" .. remoteTable.totalEvents .. "]" }) then
			if Iris.Button({ "Uncache this remote" }).clicked() then
				envcache.remotes[remote] = nil
				Iris.End()
				continue
			end
			Iris.Text({ "Total calls: " .. remoteTable.totalCalls })
			Iris.Text({ "Total events: " .. remoteTable.totalEvents })
			if Iris.Tree({ "Arguments:" }) then
				-- calls
				for i: number, _ in remoteTable.calls do
					if Iris.Tree({ "Call #" .. i }) then
						drawArguments(remoteTable.calls[i])

						Iris.SameLine()
						do
							local execute = Iris.Button({ "Fire" })
							if execute.hovered() then
								Iris.Tooltip({ "Fires this RemoteEvent with these arguments." })
							end
							if execute.clicked() then
								remote:FireServer(table.unpack(remoteTable.calls[i]))
							end
						end
						Iris.End()
					end
					Iris.End()
				end

				-- events
				for i: number, _ in remoteTable.events do
					if Iris.Tree({ "Event #" .. i }) then
						drawArguments(remoteTable.events[i])

						Iris.SameLine()
						do
							local execute = Iris.Button({ "Execute" })
							if execute.hovered() then
								Iris.Tooltip({ "Executes this RemoteEvent with these arguments. Requires firesignal in executor." })
							end
							if execute.clicked() then
								firesignal(remote.OnClientEvent, table.unpack(remoteTable.events[i]))
								print(remote, table.unpack(remoteTable.events[i]))
							end
						end
						Iris.End()
					end
					Iris.End()
				end
			end
			Iris.End()
		end
		Iris.End()
		Iris.Separator()
	end
end

-- spy on remotes calls
pcall(function()
	old = hookmetamethod(game, "__namecall", function(self: Instance, ...)
		if getnamecallmethod() == "FireServer" then
			local args = { ... }
			task.spawn(function()
				addRemote(self, "FireServer", table.unpack(args))
			end)
		end
	
		return old(self, ...)
	end)
end)


-- spy on remotes events
for i, v in game:GetDescendants() do
	if v.ClassName == "RemoteEvent" then
		v.OnClientEvent:Connect(function(...)
			addRemote(v, "OnClientEvent", ...)
		end)
	end
end

-- window gui
Iris:Connect(function()
	Iris.Window({ "SanTer's Remote Spy" }, { size = Iris.State(Vector2.new(640, 400)) })
	do
		Iris.MenuBar()
		do
			Iris.Menu({ "Options" })
			do
				Iris.MenuToggle({ "Spy enabled" }, { isChecked = envcache.spyEnabled })
			end
			Iris.End()
		end
		Iris.End()

		--[[Iris.SameLine() -- tabs are not used right now
		do
			if Iris.Button({ "Main" }).clicked() then
				envcache.currenttab = 1
			end
		end
		Iris.End()

		Iris.Separator()]]

		local killiris
		local removehook
		local removecache

		Iris.SameLine()
		do
			killiris = Iris.Button({ "Kill Iris" })
			if killiris.clicked() then
				Iris.Shutdown()
				getgenv().Iris = nil
			end

			removehook = Iris.Button({ "Kill hook" })
			if removehook.clicked() then
				mt.__namecall = old
			end

			removecache = Iris.Button({ "Uncache RemoteEvents" })
			if removecache.clicked() then
				envcache.remotes = {}
			end
		end
		Iris.End()

		if killiris.hovered() then
			Iris.Text({ "This will unload Iris!" })
		elseif removehook.hovered() then
			Iris.Text({ "This will kill RemoteEvents interception." })
		elseif removecache.hovered() then
			Iris.Text({ "This will clear lists of RemoteEvents calls." })
		else
			Iris.Text("...")
		end

		Iris.Separator()

		-- main tab
		--if envcache.currenttab == 1 then
		Iris.Text({ "Remotes:" })
		drawCalls()
		Iris.Separator()
		--end
	end
	Iris.End()
end)
