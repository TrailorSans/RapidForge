local Library = game:GetService("ReplicatedStorage"):WaitForChild("library")

local mathUtils = require(Library.mathUtils)
local utilityUtils = require(Library.utilityUtils)

local passed = 0
local failed = 0
local total = 0

local function expect(label, value, expected)
	total += 1
	if value == expected then
		passed += 1
		print("[PASS] " .. label)
	else
		failed += 1
		warn("[FAIL] " .. label .. " | got: " .. tostring(value) .. " | expected: " .. tostring(expected))
	end
end

local function expectClose(label, value, expected, tolerance)
	total += 1
	tolerance = tolerance or 0.0001
	if math.abs(value - expected) <= tolerance then
		passed += 1
		print("[PASS] " .. label)
	else
		failed += 1
		warn("[FAIL] " .. label .. " | got: " .. tostring(value) .. " | expected: ~" .. tostring(expected))
	end
end

local function expectBetween(label, value, min, max)
	total += 1
	if value >= min and value <= max then
		passed += 1
		print("[PASS] " .. label)
	else
		failed += 1
		warn("[FAIL] " .. label .. " | got: " .. tostring(value) .. " | expected between: " .. min .. " and " .. max)
	end
end

local function section(name)
	print("\n── " .. name .. " ──")
end

-- mathUtils

section("lerp")
expectClose("lerp midpoint",     mathUtils.lerp(0, 100, 0.5),   50)
expectClose("lerp start",        mathUtils.lerp(0, 100, 0),     0)
expectClose("lerp end",          mathUtils.lerp(0, 100, 1),     100)
expectClose("lerp negative",     mathUtils.lerp(-50, 50, 0.5),  0)
expectClose("lerp beyond 1",     mathUtils.lerp(0, 10, 1.5),    15)

section("clamp")
expect("clamp within range", mathUtils.clamp(5, 0, 10),   5)
expect("clamp below min",    mathUtils.clamp(-5, 0, 10),  0)
expect("clamp above max",    mathUtils.clamp(15, 0, 10),  10)
expect("clamp at min edge",  mathUtils.clamp(0, 0, 10),   0)
expect("clamp at max edge",  mathUtils.clamp(10, 0, 10),  10)

section("roundTo")
expectClose("roundTo 2 decimals",  mathUtils.roundTo(3.14159, 2),  3.14)
expectClose("roundTo 0 decimals",  mathUtils.roundTo(3.7, 0),      4)
expectClose("roundTo 3 decimals",  mathUtils.roundTo(1.23456, 3),  1.235)
expectClose("roundTo negative",    mathUtils.roundTo(-2.5678, 2),  -2.57)

section("randomFloat")
expectBetween("randomFloat within range",  mathUtils.randomFloat(0, 1),     0, 1)
expectBetween("randomFloat wide range",    mathUtils.randomFloat(-100, 100), -100, 100)

section("randomInt")
expectBetween("randomInt within range",  mathUtils.randomInt(1, 6),   1, 6)
expectBetween("randomInt single value",  mathUtils.randomInt(5, 5),   5, 5)

section("distanceBetween")
do
	local a = Instance.new("Part")
	local b = Instance.new("Part")
	a.Position = Vector3.new(0, 0, 0)
	b.Position = Vector3.new(3, 4, 0)
	expectClose("distanceBetween 3-4-5 triangle", mathUtils.distanceBetween(a, b), 5)
	a.Position = Vector3.new(0, 0, 0)
	b.Position = Vector3.new(0, 0, 0)
	expectClose("distanceBetween same position", mathUtils.distanceBetween(a, b), 0)
	a:Destroy()
	b:Destroy()
end

section("flattenVector")
do
	local v = mathUtils.flattenVector(Vector3.new(3, 99, 5))
	expect("flattenVector X preserved",  v.X, 3)
	expect("flattenVector Y zeroed",     v.Y, 0)
	expect("flattenVector Z preserved",  v.Z, 5)
end

section("isInRange")
do
	local a = Instance.new("Part")
	local b = Instance.new("Part")
	a.Position = Vector3.new(0, 0, 0)
	b.Position = Vector3.new(5, 0, 0)
	expect("isInRange within range",  mathUtils.isInRange(a, b, 10), true)
	expect("isInRange exact edge",    mathUtils.isInRange(a, b, 5),  true)
	expect("isInRange out of range",  mathUtils.isInRange(a, b, 4),  false)
	a:Destroy()
	b:Destroy()
end

-- utilityUtils

section("formatNumber")
expect("formatNumber thousands",   utilityUtils.formatNumber(1000),     "1,000")
expect("formatNumber millions",    utilityUtils.formatNumber(1000000),  "1,000,000")
expect("formatNumber below 1000",  utilityUtils.formatNumber(999),      "999")
expect("formatNumber zero",        utilityUtils.formatNumber(0),        "0")

section("formatTime")
expect("formatTime 90 seconds",  utilityUtils.formatTime(90),  "01:30")
expect("formatTime 9 seconds",   utilityUtils.formatTime(9),   "00:09")
expect("formatTime 0 seconds",   utilityUtils.formatTime(0),   "00:00")
expect("formatTime 3600",        utilityUtils.formatTime(3600), "60:00")

section("tableContains")
expect("tableContains found",     utilityUtils.tableContains({"a", "b", "c"}, "b"),  true)
expect("tableContains not found", utilityUtils.tableContains({"a", "b", "c"}, "z"),  false)
expect("tableContains empty",     utilityUtils.tableContains({}, "a"),                false)
expect("tableContains number",    utilityUtils.tableContains({1, 2, 3}, 2),           true)

section("tableKeys")
do
	local keys = utilityUtils.tableKeys({ a = 1, b = 2, c = 3 })
	expect("tableKeys count", #keys, 3)
end

section("tableLength")
expect("tableLength dict",   utilityUtils.tableLength({ a = 1, b = 2, c = 3 }), 3)
expect("tableLength empty",  utilityUtils.tableLength({}),                        0)
expect("tableLength one",    utilityUtils.tableLength({ x = 99 }),                1)

section("merge")
do
	local result = utilityUtils.merge({ a = 1, b = 2 }, { b = 99, c = 3 })
	expect("merge keeps A key",      result.a, 1)
	expect("merge B overwrites A",   result.b, 99)
	expect("merge adds B-only key",  result.c, 3)
end

section("deepCopy")
do
	local original = { x = 1, nested = { y = 2 } }
	local copy = utilityUtils.deepCopy(original)
	expect("deepCopy top-level value",    copy.x,          1)
	expect("deepCopy nested value",       copy.nested.y,   2)
	copy.nested.y = 99
	expect("deepCopy is independent",     original.nested.y, 2)
end

section("debounce")
do
	local count = 0
	local fn = utilityUtils.debounce(function() count += 1 end, 1)
	fn()
	fn()
	fn()
	expect("debounce fires only once in cooldown", count, 1)
end

section("throttle")
do
	local count = 0
	local fn = utilityUtils.throttle(function() count += 1 end, 1)
	fn()
	fn()
	fn()
	expect("throttle fires only once in interval", count, 1)
end

section("once")
do
	local count = 0
	local fn = utilityUtils.once(function() count += 1 end)
	fn()
	fn()
	fn()
	expect("once fires exactly one time", count, 1)
end

-- Summary

print("\n══════════════════════════════════")
print(string.format("Results: %d / %d passed", passed, total))
if failed > 0 then
	warn(string.format("%d test(s) FAILED", failed))
else
	print("All tests passed.")
end
print("══════════════════════════════════")
