include '../inc/string'

impl Object {
	/**[md.zot]**api**
	Returns *object* after copying into all the values of the arguments.

	@function append
	@param	{object}	object	The object
	@param	{object}	[...]	The objects to merge with
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object append :default').code()}}
	**/
	static append(item, ...args): Object {
		let arg, key
		for const i from 0 til args.length {
			arg = args[i] ?? {}

			for :key of arg {
				item[key] = arg[key]
			}
		}

		return item
	}
}