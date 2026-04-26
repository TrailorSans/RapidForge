local LEVELS = {
	debug = 1,
	info  = 2,
	warn  = 3,
	error = 4,
}

local minLevel = 2

local Logger = {}
Logger.__index = Logger

function Logger.setMinLevel(level)
	assert(LEVELS[level], "logger.setMinLevel: invalid level '" .. tostring(level) .. "'")
	minLevel = LEVELS[level]
end

function Logger.new(prefix)
	return setmetatable({ prefix = prefix and ("[" .. prefix .. "] ") or "" }, Logger)
end

function Logger:_log(level, fn, ...)
	if LEVELS[level] < minLevel then return end
	local parts = { self.prefix }
	for _, v in ipairs({ ... }) do
		parts[#parts + 1] = tostring(v)
	end
	fn(table.concat(parts, " "))
end

function Logger:debug(...)
	self:_log("debug", print, "[DEBUG]", ...)
end

function Logger:info(...)
	self:_log("info", print, "[INFO]", ...)
end

function Logger:warn(...)
	self:_log("warn", warn, "[WARN]", ...)
end

function Logger:error(...)
	self:_log("error", error, "[ERROR]", ...)
end

return Logger
