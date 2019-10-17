include './merge'

impl Dictionary {
	/**[md.zot]**api**
	Merge all arguments into a new object.

	@function defaults
	@param	{object}	[...]	The objects to merge
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object defaults').code()}}
	**/
	static defaults(...args): Dictionary => Dictionary.merge({}, ...args)
}