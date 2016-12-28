include once {
	../inc/array
	
	./from
	./pushUniq
}

impl Array {
	/**[md.zot]**api**
	Add all the values of the given array only if they aren't contained in the array.
	
	@class Array
	@function appendUniq
	@param	{array}		...		The array to append
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance appendUniq :one').code()}}
	**/
	appendUniq(...args): Array {
		if args.length == 1 {
			this.pushUniq(...args[0])
		}
		else {
			for i from 0 til args.length {
				this.pushUniq(...args[i])
			}
		}
		
		return this
	}
}