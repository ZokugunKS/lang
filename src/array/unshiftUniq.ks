include once {
	'../inc/array'
	
	'./contains'
	'./from'
}

impl Array {
	/**[md.zot]**api**
	Add the given *item* at the begin of the array only if it's unique.
	
	@class Array
	@function unshiftUniq
	@param	{any}	'...		The value to add'
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance unshiftUniq').code()}}
	**/
	unshiftUniq(...items): Array {
		if items.length == 1 {
			this.unshift(items[0]) if !this.contains(items[0])
		}
		else {
			for item in items desc {
				this.unshift(item) if !this.contains(item)
			}
		}
		
		return this
	}
}