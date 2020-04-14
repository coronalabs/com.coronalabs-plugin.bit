local lib
local platform = system.getInfo("platform")
if platform == 'html5' then
	lib = require "plugin_bit_js"
else
	local Library = require "CoronaLibrary"

	-- Create stub library for simulator
	lib = Library:new{ name='plugin.bit', publisherId='com.coronalabs' }
	-- Default implementations
	local function defaultFunction()
		print( "WARNING: The '" .. lib.name .. "' library is not available on this platform." )
	end

	lib.tobit = defaultFunction
	lib.bnot = defaultFunction
	lib.band = defaultFunction
	lib.bor = defaultFunction
	lib.bxor = defaultFunction
	lib.lshift = defaultFunction
	lib.rshift = defaultFunction
	lib.arshift = defaultFunction
	lib.rol = defaultFunction
	lib.ror = defaultFunction
	lib.bswap = defaultFunction
	lib.tohex = defaultFunction
end

-- Return an instance
return lib