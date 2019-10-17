include '../inc/dictionary'

impl Dictionary {
	/**[md.zot]**api**
	Returns *true* if the *object* contains the given key, *false* if not.

	@function hasKey
	@param	{object}	object	The object
	@param	{any}		key		The key to search for
	@return {boolean}
	@static

	@example basics
		{{:dokka.get('mocha', 'object hasKey').code()}}
	**/
	static hasKey(item: Dictionary, key: String): Boolean => item[key]? || item[key] == null
}