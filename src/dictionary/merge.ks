include {
	'../inc/dictionary'

	'../clone'
}

const $merge = {
	merge(source, key, value = null) { // {{{
		if value == null {
			return source
		}
		else if value is Array {
			source[key] = (value as Array).clone()
		}
		else if value is Dictionary {
			if source[key] is Dictionary {
				$merge.object(source[key], value)
			}
			else {
				source[key] = clone(value)
			}
		}
		else {
			source[key] = value
		}

		return source
	} // }}}
	object(source, current) { // {{{
		for const _, key of current {
			if source[key] {
				$merge.merge(source, key, current[key])
			}
			else {
				source[key] = current[key]
			}
		}
	} // }}}
}

impl Dictionary {
	/**[md.zot]**api**
	Returns the *object* after it was deeply merged with all the arguments.

	@function merge
	@param	{object}	object	The object
	@param	{object}	[...]	The objects to merge
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object merge :default').code()}}
	**/
	static merge(...args): Dictionary {
		let source = {}

		let i = 0
		let l = args.length
		while i < l && !(source ?= args[i]) {
			i++
		}

		while ++i < l {
			if args[i] is Dictionary {
				for const _, key of args[i] {
					$merge.merge(source, key, args[i][key])
				}
			}
		}

		return source
	}
}