include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string with the matches of *pattern* replaced with the values of *object* where the key equals the first substring of a match.
	If no *pattern* is given, it will match *{key}*.
	
	@function substitute
	@param	{object}	object
	@param	{regex}		[pattern]
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance substitute :default').code()}}
	**/
	substitute(object, pattern = /\\?\{([^{}]+)\}/g): String {
		return this.replace(pattern, (match, name) => {
			if match.charAt(0) == '\\' {
				return match.slice(1)
			}
			
			return object[name] ?? ''
		})
	}
}