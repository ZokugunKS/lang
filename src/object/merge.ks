include once {
	'../inc/object'
	
	'../clone'
}

const $merge = {
	merge(source, key, value) { // {{{
		if value is Array {
			source[key] = (value as Array).clone()
		}
		else if value is Object {
			if source[key] is Object {
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
		for key of current {
			if source[key] {
				$merge.merge(source, key, current[key])
			}
			else {
				source[key] = current[key]
			}
		}
	} // }}}
}

impl Object {
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
	static merge(...args): Number {
		let source
		let i = 0
		let l = args.length
		while i < l && !(source ?= args[i]) {
			i++
		}
		
		while(++i < l) {
			if args[i] is Object {
				for key of args[i] {
					$merge.merge(source, key, args[i][key])
				}
			}
		}
		
		return source
	}
}