include once ./contains

impl Array {
	/**[md.zot]**api**
	Add the given *item* at the end of the array only if it's unique.
	
	@class Array
	@function pushUniq
	@param	{any}	...		The value to add
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance pushUniq').code()}}
	**/
	pushUniq(...args): Array {
		if args.length == 1 {
			if !this.contains(args[0]) {
				this.push(args[0])
			}
		}
		else {
			for item in args {
				if !this.contains(item) {
					this.push(item)
				}
			}
		}
		return this
	}
}