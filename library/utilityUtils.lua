local log = require(script.Parent.internalLogger)

local function debounce(callback, cooldown)
	local lastCall = 0
	return function(...)
		local now = tick()
		if now - lastCall >= cooldown then
			lastCall = now
			callback(...)
		end
	end
end

local function retry(callback, attempts, interval)
	for i = 1, attempts do
		local success, result = pcall(callback)
		if success then
			return result
		end
		if i < attempts then
			task.wait(interval or 1)
		end
	end
	log:warn("retry: all " .. attempts .. " attempts failed")
	return nil
end

local function formatNumber(number)
	local formatted = tostring(math.floor(number))
	local result = ""
	local count = 0
	for i = #formatted, 1, -1 do
		count += 1
		result = formatted:sub(i, i) .. result
		if count % 3 == 0 and i > 1 then
			result = "," .. result
		end
	end
	return result
end

local function formatTime(seconds)
	local mins = math.floor(seconds / 60)
	local secs = math.floor(seconds % 60)
	return string.format("%02d:%02d", mins, secs)
end

local function tableContains(tbl, value)
	for _, v in ipairs(tbl) do
		if v == value then return true end
	end
	return false
end

local function tableKeys(tbl)
	local keys = {}
	for k in pairs(tbl) do
		table.insert(keys, k)
	end
	return keys
end

local function tableLength(tbl)
	local count = 0
	for _ in pairs(tbl) do
		count += 1
	end
	return count
end

local function merge(tableA, tableB)
	local result = {}
	for k, v in pairs(tableA) do result[k] = v end
	for k, v in pairs(tableB) do result[k] = v end
	return result
end

local function deepCopy(tbl)
	local copy = {}
	for k, v in pairs(tbl) do
		if type(v) == "table" then
			copy[k] = deepCopy(v)
		else
			copy[k] = v
		end
	end
	return copy
end

local function throttle(callback, interval)
	local lastCall = -math.huge
	return function(...)
		local now = tick()
		if now - lastCall >= interval then
			lastCall = now
			return callback(...)
		end
	end
end

local function once(callback)
	local called = false
	return function(...)
		if called then return end
		called = true
		return callback(...)
	end
end

return {
	once = once,
	debounce = debounce,
	retry = retry,
	formatNumber = formatNumber,
	formatTime = formatTime,
	tableContains = tableContains,
	tableKeys = tableKeys,
	tableLength = tableLength,
	merge = merge,
	deepCopy = deepCopy,
	throttle = throttle,
}
