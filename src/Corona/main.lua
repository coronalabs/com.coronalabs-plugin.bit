--------------------------------------------------------------------------------
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2012 Corona Labs Inc. All Rights Reserved.
--------------------------------------------------------------------------------

print( "Bit sample start." )

local bit = require( "plugin.bit" )

local vb = {
  0, 1, -1, 2, -2, 0x12345678, 0x87654321,
  0x33333333, 0x77777777, 0x55aa55aa, 0xaa55aa55,
  0x7fffffff, 0x80000000, 0xffffffff
}

local function cksum(name, s, r)
  local z = 0
  for i=1,#s do z = (z + string.byte(s, i)*i) % 2147483629 end
  if z ~= r then
    error("bit."..name.." test failed (got "..z..", expected "..r..")", 0)
  end
end

local function check_unop(name, r)
  local f = bit[name]
  local s = ""
  if pcall(f) or pcall(f, "z") or pcall(f, true) then
    error("bit."..name.." fails to detect argument errors", 0)
  end
  for _,x in ipairs(vb) do s = s..","..tostring(f(x)) end
  cksum(name, s, r)
end

local function check_binop(name, r)
  local f = bit[name]
  local s = ""
  if pcall(f) or pcall(f, "z") or pcall(f, true) then
    error("bit."..name.." fails to detect argument errors", 0)
  end
  for _,x in ipairs(vb) do
    for _,y in ipairs(vb) do s = s..","..tostring(f(x, y)) end
  end
  cksum(name, s, r)
end

local function check_binop_range(name, r, yb, ye)
  local f = bit[name]
  local s = ""
  if pcall(f) or pcall(f, "z") or pcall(f, true) or pcall(f, 1, true) then
    error("bit."..name.." fails to detect argument errors", 0)
  end
  for _,x in ipairs(vb) do
    for y=yb,ye do s = s..","..tostring(f(x, y)) end
  end
  cksum(name, s, r)
end

local function check_shift(name, r)
  check_binop_range(name, r, 0, 31)
end

-- Minimal sanity checks.
assert(0x7fffffff == 2147483647, "broken hex literals")
assert(0xffffffff == -1 or 0xffffffff == 2^32-1, "broken hex literals")
assert(tostring(-1) == "-1", "broken tostring()")
assert(tostring(0xffffffff) == "-1" or tostring(0xffffffff) == "4294967295", "broken tostring()")

assert( bit.bor( 1, 2, 4, 8 ) == 15 )
assert( bit.band( 0x12345678, 0xff ) == 0x00000078 )
assert( bit.bxor( 0xa5a5f0f0, 0xaa55ff00 ) == 0x0ff00ff0 )

assert( bit.lshift( 1, 8 ) == 256 )
assert( bit.lshift( 0x87654321, 12 ) == 0x54321000 )
assert( bit.rshift( 0x87654321, 12 ) == 0x00087654 )

assert( bit.rol( 0x12345678, 12 ) == 0x45678123 )
assert( bit.ror( 0x12345678, 12 ) == 0x67812345 )

assert( bit.bswap( 0x12345678 ) == 0x78563412 )
assert( bit.bswap( 0x78563412 ) == 0x12345678 )

print( "Bit sample done." )
