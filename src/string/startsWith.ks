include '../inc/string'

#[cc(any(trident, all(safari, target_version='8')))]
impl String {
	/**[md.zot]**api**
	Returns *true* if the string starts with the *value*, *false* if not.
	
	@function startsWith
	@param	{string}	value	The value to search
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'string instance startsWith').code()}}
	**/
	startsWith(value: String): Boolean => this.length >= value.length && this.slice(0, value.length) == value
}