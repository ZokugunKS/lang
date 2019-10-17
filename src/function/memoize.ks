include {
	'../inc/function'

	'../dictionary/hasKey'
}

impl Function {
	/**[md.zot]**api**
	Returns a function that cache the computed results.

	@function memoize
	@param	{hasher}	[hasher]	The function the give the hash key of the arguments
	@param	{object}	[bind]		The *this* context
	@return {function}

	@example basics
		{{:dokka.get('mocha', 'function instance memoize :wh').code()}}
	**/
	memoize(hasher = null, bind = null): Function {
		let self = this

		func memoize(...args) {
			let cache = memoize.cache
			let hash = hasher != null ? hasher*$(null, ...args) : args[0]

			if Dictionary.hasKey(cache, hash) {
				return cache[hash]
			}
			else {
				return cache[hash] = self*$(bind, ...args)
			}
		}

		memoize.cache = {}

		return memoize
	}
}