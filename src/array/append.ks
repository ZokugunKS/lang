include {
	'../inc/array'

	'./from'
}

impl Array {
	/**[md.zot]**api**
	Append the values of the given array to the array.

	@class Array
	@function append
	@param	{array}		'...'		The array to add
	@return {this}

	@example basics
		{{:dokka.get('mocha', 'array instance append :one').code()}}
	**/
	append(...args): Array {
		if args.length == 1 {
			this.push(...args[0])
		}
		else {
			for i from 0 til args.length {
				this.push(...args[i])
			}
		}

		return this
	}
}