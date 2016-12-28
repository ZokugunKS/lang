include once ../inc/string

impl String {
	/**[md.zot]**api**
	If the given *regex* is global, returns an array of all the matches' *substring*.
	If the given *regex* isn't global, returns the first match's *substring*.
	If the regex isn't match, returns an empty string.
	
	@function extract
	@param	{regex}		regex			The regex matched
	@param	{number}	[substring=0]		the substring of the match to use
	@return {array|string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance extract w/global').code()}}
	**/
	extract(regex, substring = 0): Array | String  {
		if regex.global {
			let values = []
			
			while info = regex.exec(this) {
				values.push(info[substring] ?? '')
			}
			
			return values
		}
		else {
			return this.match(regex)[substring] ?? ''
		}
	}
}