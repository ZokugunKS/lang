include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Returms the string with all instance of the string *find* replaced by the *replacement*.
	
	@function replaceAll
	@param	{string}	find			The string to search
	@param	{string}	replacement		The string to replace with
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance replaceAll :default').code()}}
	**/
	replaceAll(find: String, replacement: String): String {
		return this.valueOf() if find.length == 0
		
		if find.length <= 3 {
			return this.split(find).join(replacement)
		}
		else {
			return this.replace(new RegExp(find.escapeRegex(), 'g'), replacement)
		}
	}
}