include '../inc/string'

impl Dictionary {
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
	static append(item: Dictionary, ...args): Dictionary {
		for const i from 0 til args.length {
			const arg = args[i] ?? {}

			if arg is Dictionary {
				for const :key of arg {
					item[key] = arg[key]
				}
			}
		}

		return item
	}
}