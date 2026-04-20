-- ========================================================================
-- DSS CONFIG MODULE
-- ========================================================================

local cfg = {}

cfg.FFB_ENABLED          = true
cfg.FFB_GAIN             = 0.8
cfg.GYRO_GAIN            = 8.0
cfg.STEER_COUNTER_STEER  = 2.0
cfg.FFB_DAMPER           = 0.5
cfg.FFB_LATERAL          = 0.3
cfg.FFB_GAMMA            = 1.0
cfg.STEER_SENSI          = 65.0
cfg.STEER_LIMIT          = 1.0
cfg.STEER_GAMMA          = 1.0
cfg.STEER_FILTER         = 0.0
cfg.STEER_REVERSAL_LIMIT = 2.5
cfg.SPEED_SENSI          = 1.0
cfg.SPEED_SENSI_START    = 80
cfg.SPEED_SENSI_END      = 250
cfg.GAS_PRESS_SPEED      = 4.8
cfg.GAS_RELEASE_SPEED    = 4.4
cfg.BRAKE_PRESS_SPEED    = 4.8
cfg.BRAKE_RELEASE_SPEED  = 4.4
cfg.CLUTCH_PRESS_SPEED   = 4.8
cfg.CLUTCH_RELEASE_SPEED = 4.8
cfg.AUTOCLUTCH_ENABLED       = true
cfg.AUTOCLUTCH_DEPTH         = 1.0
cfg.AUTOCLUTCH_PRESS_SPEED   = 10.0
cfg.AUTOCLUTCH_RELEASE_SPEED = 5.0
cfg.HANDBRAKE_PRESS_SPEED    = 8.0
cfg.HANDBRAKE_RELEASE_SPEED  = 8.0
cfg.ANTISTALL_ENABLED         = true
cfg.ANTISTALL_FULL_SPEED      = 30.0
cfg.ANTISTALL_MIN_SPEED       = 2.0
cfg.ANTISTALL_ENGAGE_SPEED    = 1.8
cfg.ANTISTALL_DISENGAGE_SPEED = 2.5
cfg.ANTISTALL_GAMMA           = 1.0
cfg.ANTISTALL_MAX_PRESS       = 1.0
cfg.ANTISTALL_BITE_POINT      = 0.5
cfg.ANTISTALL_TARGET_SMOOTH   = 0.92
cfg.BLIP_ENABLED       = true
cfg.BLIP_INTENSITY     = 1.5
cfg.BLIP_DURATION      = 200
cfg.BLIP_MIN_RPM_DIFF  = 200
cfg.BLIP_ATTACK_SPEED  = 15.0
cfg.BLIP_RELEASE_SPEED = 4.0
cfg.NLS_ENABLED       = true
cfg.NLS_CUT_DURATION  = 150
cfg.NLS_CUT_AMOUNT    = 0.2
cfg.NLS_MIN_RPM       = 3000
cfg.NLS_RELEASE_MULT  = 2.0

-- [SCROLL GAS]
cfg.SCROLL_GAS_ENABLED        = false
cfg.SCROLL_GAS_STEP           = 0.10
cfg.SCROLL_GAS_DECAY          = 0.0
cfg.SCROLL_GAS_RESET_ON_BRAKE = true
cfg.SCROLL_GAS_MAX_SPEED      = 0.0
cfg.SCROLL_GAS_INVERT         = false
-- 0 = só gás | 1 = só freio | 2 = ambos (↑ gás, ↓ freio)
cfg.SCROLL_GAS_MODE           = 2

cfg.ABS_ENABLED      = true
cfg.ABS_LEVEL        = 15
cfg.ABS_THRESHOLD    = 0.032
cfg.ABS_MIN_SPEED    = 14
cfg.ABS_MIN_BRAKE    = 0.14
cfg.ABS_INTENSITY    = 0.42
cfg.ABS_SMOOTH       = 3.0
cfg.ABS_NDSLIP_DIV   = 2.6
cfg.ABS_CURVE_FACTOR = 0.5
cfg.TC_ENABLED    = true
cfg.TC_LEVEL      = 13
cfg.TC_THRESHOLD  = 0.053
cfg.TC_MIN_SPEED  = 10
cfg.TC_MIN_GAS    = 0.51
cfg.TC_INTENSITY  = 0.48
cfg.TC_SMOOTH     = 3.1
cfg.TC_NDSLIP_DIV = 2.4
cfg.LAUNCH_ENABLED  = false
cfg.LAUNCH_RPM      = 4500
cfg.LAUNCH_CUT_TIME = 200
cfg.CRUISE_ENABLED    = false
cfg.CRUISE_FULL_SPEED = 30.0
cfg.CRUISE_GAS_MIN    = 0.30
cfg.CRUISE_BRAKE_MIN  = 0.25

-- ========================================================================
-- TABELAS DE NÍVEIS ABS / TC
-- ========================================================================

local ABS_LEVELS = {
	[1]={0.120,0.01,0.02,0.3},[2]={0.114,0.01,0.03,0.4},[3]={0.108,0.02,0.04,0.4},
	[4]={0.100,0.02,0.05,0.5},[5]={0.092,0.03,0.06,0.5},[6]={0.084,0.03,0.07,0.6},
	[7]={0.078,0.04,0.08,0.7},[8]={0.072,0.04,0.09,0.7},[9]={0.068,0.04,0.09,0.8},
	[10]={0.064,0.05,0.10,0.9},[11]={0.060,0.05,0.10,1.0},[12]={0.052,0.08,0.18,1.5},
	[13]={0.044,0.10,0.26,2.0},[14]={0.038,0.12,0.34,2.5},[15]={0.032,0.14,0.42,3.0},
	[16]={0.026,0.16,0.50,3.3},[17]={0.021,0.18,0.60,3.6},[18]={0.016,0.20,0.70,4.0},
	[19]={0.010,0.22,0.82,4.5},[20]={0.005,0.25,0.95,5.0},
}
function cfg.applyAbsLevel()
	if cfg.ABS_LEVEL >= 1 and cfg.ABS_LEVEL <= 20 then
		local l = ABS_LEVELS[cfg.ABS_LEVEL]
		cfg.ABS_THRESHOLD = l[1]; cfg.ABS_MIN_BRAKE = l[2]
		cfg.ABS_INTENSITY = l[3]; cfg.ABS_SMOOTH    = l[4]
	end
end

local TC_LEVELS = {
	[1]={0.200,0.92,0.04,0.4},[2]={0.155,0.85,0.08,0.6},[3]={0.120,0.78,0.14,0.9},
	[4]={0.100,0.95,0.03,1.0},[5]={0.095,0.90,0.08,1.2},[6]={0.090,0.85,0.13,1.5},
	[7]={0.085,0.80,0.18,1.7},[8]={0.079,0.76,0.23,1.9},[9]={0.074,0.71,0.28,2.2},
	[10]={0.069,0.66,0.33,2.4},[11]={0.064,0.61,0.38,2.6},[12]={0.058,0.56,0.43,2.9},
	[13]={0.053,0.51,0.48,3.1},[14]={0.048,0.46,0.53,3.3},[15]={0.043,0.41,0.58,3.6},
	[16]={0.037,0.37,0.63,3.8},[17]={0.032,0.32,0.68,4.0},[18]={0.027,0.27,0.73,4.3},
	[19]={0.022,0.22,0.78,4.5},[20]={0.016,0.17,0.83,4.7},[21]={0.011,0.12,0.88,5.0},
	[22]={0.006,0.07,0.93,5.2},[23]={0.001,0.02,0.98,5.5},
}
function cfg.applyTcLevel()
	if cfg.TC_LEVEL >= 1 and cfg.TC_LEVEL <= 23 then
		local l = TC_LEVELS[cfg.TC_LEVEL]
		cfg.TC_THRESHOLD = l[1]; cfg.TC_MIN_GAS   = l[2]
		cfg.TC_INTENSITY = l[3]; cfg.TC_SMOOTH    = l[4]
	end
end

-- ========================================================================
-- LEITURA DO CONFIG.INI
-- ========================================================================

local CONFIG_PATH = "apps/lua/TxylorConfig/config.ini"

local function parseIni(path)
	local result = {}
	local file = io.open(path, "r")
	if not file then return nil end
	for line in file:lines() do
		local key, val = line:match("^%s*([%w_]+)%s*=%s*(.+)%s*$")
		if key and val then result[key:lower()] = val end
	end
	file:close()
	return result
end

local function clamp(v, lo, hi) return math.max(lo, math.min(hi, v)) end

function cfg.loadConfig()
	local ini = parseIni(CONFIG_PATH)
	if not ini then return end
	local function getf(key, default) return ini[key] and tonumber(ini[key]) or default end
	local function getb(key, default)
		if ini[key] == nil then return default end
		return ini[key] == "1" or ini[key] == "true"
	end

	cfg.FFB_ENABLED         = getb("ffb_enabled", cfg.FFB_ENABLED)
	cfg.FFB_GAIN            = clamp(getf("ffb_gain",            0.8),  0.0, 10.0)
	cfg.GYRO_GAIN           = clamp(getf("gyro_gain",           4.0),  0.0, 10.0) * 2.0
	cfg.STEER_COUNTER_STEER = clamp(getf("steer_counter_steer", 10.0), 0.0, 10.0) * 0.2
	cfg.FFB_DAMPER          = clamp(getf("ffb_damper",          1.7),  0.0, 10.0) * 0.3
	cfg.FFB_LATERAL         = clamp(getf("ffb_lateral",         1.5),  0.0, 10.0) * 0.2
	cfg.FFB_GAMMA           = 0.5 + clamp(getf("ffb_gamma",     5.0),  0.0, 10.0) * 0.1
	cfg.STEER_SENSI  = clamp(getf("steer_sensi",  4.5),  1.0, 10.0) * 15.0
	cfg.STEER_LIMIT  = clamp(getf("steer_limit",  10.0), 0.0, 10.0) * 0.1
	cfg.STEER_GAMMA  = 0.5 + clamp(getf("steer_gamma", 5.0), 0.0, 10.0) * 0.1
	cfg.STEER_FILTER = clamp(getf("steer_filter", 0.0),  0.0, 10.0) * 0.095
	cfg.SPEED_SENSI       = clamp(getf("speed_sensi", 10.0), 0.0, 10.0) * 0.1
	cfg.SPEED_SENSI_START = getf("speed_sensi_start", cfg.SPEED_SENSI_START)
	cfg.SPEED_SENSI_END   = getf("speed_sensi_end",   cfg.SPEED_SENSI_END)
	cfg.GAS_PRESS_SPEED      = getf("gas_press",     cfg.GAS_PRESS_SPEED)
	cfg.GAS_RELEASE_SPEED    = getf("gas_release",   cfg.GAS_RELEASE_SPEED)
	cfg.BRAKE_PRESS_SPEED    = getf("brake_press",   cfg.BRAKE_PRESS_SPEED)
	cfg.BRAKE_RELEASE_SPEED  = getf("brake_release", cfg.BRAKE_RELEASE_SPEED)
	cfg.CLUTCH_PRESS_SPEED   = getf("clutch_press",  cfg.CLUTCH_PRESS_SPEED)
	cfg.CLUTCH_RELEASE_SPEED = getf("clutch_release",cfg.CLUTCH_RELEASE_SPEED)
	cfg.AUTOCLUTCH_ENABLED       = getb("autoclutch_enabled",       cfg.AUTOCLUTCH_ENABLED)
	cfg.AUTOCLUTCH_DEPTH         = getf("autoclutch_depth",         cfg.AUTOCLUTCH_DEPTH)
	cfg.AUTOCLUTCH_PRESS_SPEED   = getf("autoclutch_press_speed",   cfg.AUTOCLUTCH_PRESS_SPEED)
	cfg.AUTOCLUTCH_RELEASE_SPEED = getf("autoclutch_release_speed", cfg.AUTOCLUTCH_RELEASE_SPEED)
	cfg.ANTISTALL_ENABLED         = getb("antistall_enabled",         cfg.ANTISTALL_ENABLED)
	cfg.ANTISTALL_FULL_SPEED      = getf("antistall_full_speed",      cfg.ANTISTALL_FULL_SPEED)
	cfg.ANTISTALL_MIN_SPEED       = getf("antistall_min_speed",       cfg.ANTISTALL_MIN_SPEED)
	cfg.ANTISTALL_ENGAGE_SPEED    = getf("antistall_engage_speed",    cfg.ANTISTALL_ENGAGE_SPEED)
	cfg.ANTISTALL_DISENGAGE_SPEED = getf("antistall_disengage_speed", cfg.ANTISTALL_DISENGAGE_SPEED)
	cfg.ANTISTALL_GAMMA           = getf("antistall_gamma",           cfg.ANTISTALL_GAMMA)
	cfg.ANTISTALL_MAX_PRESS       = getf("antistall_max_press",       cfg.ANTISTALL_MAX_PRESS)
	cfg.ANTISTALL_BITE_POINT      = getf("antistall_bite_point",      cfg.ANTISTALL_BITE_POINT)
	cfg.ANTISTALL_TARGET_SMOOTH   = getf("antistall_target_smooth",   cfg.ANTISTALL_TARGET_SMOOTH)
	if cfg.ANTISTALL_FULL_SPEED <= cfg.ANTISTALL_MIN_SPEED then cfg.ANTISTALL_FULL_SPEED = cfg.ANTISTALL_MIN_SPEED + 5.0 end
	cfg.ANTISTALL_GAMMA         = clamp(cfg.ANTISTALL_GAMMA,         0.1,  10.0)
	cfg.ANTISTALL_MAX_PRESS     = clamp(cfg.ANTISTALL_MAX_PRESS,     0.0,  1.0)
	cfg.ANTISTALL_BITE_POINT    = clamp(cfg.ANTISTALL_BITE_POINT,    0.1,  0.9)
	cfg.ANTISTALL_TARGET_SMOOTH = clamp(cfg.ANTISTALL_TARGET_SMOOTH, 0.0,  0.99)
	cfg.NLS_ENABLED      = getb("nls_enabled",      cfg.NLS_ENABLED)
	cfg.NLS_CUT_DURATION = clamp(getf("nls_cut_duration", cfg.NLS_CUT_DURATION), 50,   500)
	cfg.NLS_CUT_AMOUNT   = clamp(getf("nls_cut_amount",   cfg.NLS_CUT_AMOUNT),   0.0,  1.0)
	cfg.NLS_MIN_RPM      = clamp(getf("nls_min_rpm",      cfg.NLS_MIN_RPM),      1000, 9000)
	cfg.NLS_RELEASE_MULT = clamp(getf("nls_release_mult", cfg.NLS_RELEASE_MULT), 0.5,  5.0)
	cfg.BLIP_ENABLED       = getb("blip_enabled",       cfg.BLIP_ENABLED)
	cfg.BLIP_INTENSITY     = clamp(getf("blip_intensity",     cfg.BLIP_INTENSITY),     0.5,  3.0)
	cfg.BLIP_DURATION      = clamp(getf("blip_duration",      cfg.BLIP_DURATION),      50,   500)
	cfg.BLIP_MIN_RPM_DIFF  = clamp(getf("blip_min_rpm_diff",  cfg.BLIP_MIN_RPM_DIFF),  0,    2000)
	cfg.BLIP_ATTACK_SPEED  = clamp(getf("blip_attack_speed",  cfg.BLIP_ATTACK_SPEED),  1.0,  50.0)
	cfg.BLIP_RELEASE_SPEED = clamp(getf("blip_release_speed", cfg.BLIP_RELEASE_SPEED), 0.5,  30.0)

	-- [SCROLL GAS]
	cfg.SCROLL_GAS_ENABLED        = getb("scroll_gas_enabled",        cfg.SCROLL_GAS_ENABLED)
	cfg.SCROLL_GAS_STEP           = getf("scroll_gas_step",           cfg.SCROLL_GAS_STEP)
	cfg.SCROLL_GAS_DECAY          = getf("scroll_gas_decay",          cfg.SCROLL_GAS_DECAY)
	cfg.SCROLL_GAS_RESET_ON_BRAKE = getb("scroll_gas_reset_on_brake", cfg.SCROLL_GAS_RESET_ON_BRAKE)
	cfg.SCROLL_GAS_MAX_SPEED      = getf("scroll_gas_max_speed",      cfg.SCROLL_GAS_MAX_SPEED)
	cfg.SCROLL_GAS_INVERT         = getb("scroll_gas_invert",         cfg.SCROLL_GAS_INVERT)
	cfg.SCROLL_GAS_MODE           = clamp(getf("scroll_gas_mode",     cfg.SCROLL_GAS_MODE), 0, 2)

	cfg.ABS_ENABLED      = getb("abs_enabled",     cfg.ABS_ENABLED)
	cfg.ABS_MIN_SPEED    = getf("abs_min_speed",    cfg.ABS_MIN_SPEED)
	cfg.ABS_LEVEL        = getf("abs_level",        cfg.ABS_LEVEL)
	cfg.ABS_NDSLIP_DIV   = getf("abs_ndslip_div",   cfg.ABS_NDSLIP_DIV)
	cfg.ABS_CURVE_FACTOR = getf("abs_curve_factor", cfg.ABS_CURVE_FACTOR)
	if cfg.ABS_LEVEL == 0 then
		cfg.ABS_THRESHOLD = getf("abs_threshold", cfg.ABS_THRESHOLD)
		cfg.ABS_MIN_BRAKE = getf("abs_min_brake", cfg.ABS_MIN_BRAKE)
		cfg.ABS_INTENSITY = getf("abs_intensity", cfg.ABS_INTENSITY)
		cfg.ABS_SMOOTH    = getf("abs_smooth",    cfg.ABS_SMOOTH)
	else cfg.applyAbsLevel() end
	cfg.TC_ENABLED    = getb("tc_enabled",    cfg.TC_ENABLED)
	cfg.TC_MIN_SPEED  = getf("tc_min_speed",  cfg.TC_MIN_SPEED)
	cfg.TC_LEVEL      = getf("tc_level",      cfg.TC_LEVEL)
	cfg.TC_NDSLIP_DIV = getf("tc_ndslip_div", cfg.TC_NDSLIP_DIV)
	if cfg.TC_LEVEL == 0 then
		cfg.TC_THRESHOLD = getf("tc_threshold", cfg.TC_THRESHOLD)
		cfg.TC_MIN_GAS   = getf("tc_min_gas",   cfg.TC_MIN_GAS)
		cfg.TC_INTENSITY = getf("tc_intensity", cfg.TC_INTENSITY)
		cfg.TC_SMOOTH    = getf("tc_smooth",    cfg.TC_SMOOTH)
	else cfg.applyTcLevel() end
	cfg.LAUNCH_ENABLED  = getb("launch_enabled",  cfg.LAUNCH_ENABLED)
	cfg.LAUNCH_RPM      = clamp(getf("launch_rpm",      cfg.LAUNCH_RPM),      1000, 20000)
	cfg.LAUNCH_CUT_TIME = clamp(getf("launch_cut_time", cfg.LAUNCH_CUT_TIME), 130,  500)
	cfg.CRUISE_ENABLED    = getb("cruise_enabled",    cfg.CRUISE_ENABLED)
	cfg.CRUISE_FULL_SPEED = clamp(getf("cruise_full_speed", cfg.CRUISE_FULL_SPEED), 10.0,  120.0)
	cfg.CRUISE_GAS_MIN    = clamp(getf("cruise_gas_min",    cfg.CRUISE_GAS_MIN),    0.10,  1.00)
	cfg.CRUISE_BRAKE_MIN  = clamp(getf("cruise_brake_min",  cfg.CRUISE_BRAKE_MIN),  0.10,  1.00)
end

cfg.loadConfig()

return cfg