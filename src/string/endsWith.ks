include '../inc/string'

#[cc(any(trident, all(safari, target_version='8')))]
impl String {
	/**[md.zot]**api**
	Returns *true* if the string ends with the *value*, *false* if not.
	
	@function endsWith
	@param	{string}	value	The value to search
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'string instance endsWith').code()}}
	**/
	endsWith(value: String): Boolean => this.length >= value.length && this.slice(this.length - value.length) == value
}