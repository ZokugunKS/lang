include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Converts the string as a boolean.
	
	@function toBoolean
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'string instance toBoolean').code()}}
	**/
	toBoolean(): Boolean => (/^(?:true|1|on|yes)$/i).test(this)
}