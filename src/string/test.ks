include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns *true* is the string matchs the *pattern*, *false* if not.
	If the given *pattern* is a string, convert it to a regex with *options* as the regex's options.
	
	@function test
	@param	{string|regex}	pattern		The pattern to match
	@param	{string}		[options]	The options of the new pattern
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'string instance test').code()}}
	**/
	test(pattern, options = ''): Boolean => (pattern is RegExp ? pattern : new RegExp(pattern, options)).test(this)
}