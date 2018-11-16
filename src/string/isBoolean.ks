include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns *true* if the string can be casted as a boolean, *false* if not.
	
	@function isBoolean
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'string instance isBoolean').code()}}
	**/
	isBoolean(): Boolean => (/^(?:true|false|1|0|on|off|yes|no)$/i).test(this)
}