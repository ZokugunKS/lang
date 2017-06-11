include once './unshiftUniq'

impl Array {
	/**[md.zot]**api**
	Add all the values of the given array only if they aren't contained in the array.
	
	@function prependUniq
	@param	{array}		'...		The array to prepend'
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance prependUniq :one').code()}}
	**/
	prependUniq(...items): Array {
		if items.length == 1 {
			this.unshiftUniq(...items[0])
		}
		else {
			for item in items desc {
				this.unshiftUniq(...item)
			}
		}
		
		return this
	}
}

export Array