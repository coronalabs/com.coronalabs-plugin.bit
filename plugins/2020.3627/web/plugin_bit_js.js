//
// plugin definition
//
window.plugin_bit_js = 
{
	bor: function(arg)
	{
		var ret = arguments[0];
  		for (var i = 1; i < arguments.length; i++)
  		{
    		ret |= arguments[i];
  		}
		return ret;
	},

	tobit: function(arg)
	{
		return arg;
	},

	bnot: function(arg)
	{
		return (~arg);
	},

	band: function(arg)
	{
		var ret = arguments[0];
  		for (var i = 1; i < arguments.length; i++)
  		{
    		ret &= arguments[i];
  		}
		return ret;
	},

	bxor: function(arg)
	{
		var ret = arguments[0];
  		for (var i = 1; i < arguments.length; i++)
  		{
    		ret ^= arguments[i];
  		}
		return ret;
	},

	lshift: function(x, n)
	{
		return (x << n);
	},

	rshift: function(x, n)
	{
		return (x >>> n);
	},

	arshift: function(x, n)
	{
		return (x >> n);
	},

	rol: function(x, n)
	{
		return ((x << n) | (x >> (32 - n)));		// 32 = sizeof(int)
	},

	ror: function(x, n)
	{
		return ((x >>> n) | (x << (32 - n)));		// // 32 = sizeof(int)
	},

	bswap: function(val)
	{
		// swap 32
		return ((val & 0xFF) << 24) | ((val & 0xFF00) << 8) | ((val >> 8) & 0xFF00) | ((val >> 24) & 0xFF);
	},

	tohex: function(x, n)
	{
		if (x < 0)
		{
	    	x = 0xFFFFFFFF + x + 1;
		}
	    return x.toString(16).toUpperCase();
	},
};
console.log('*** plugin_bit_js is loaded');
