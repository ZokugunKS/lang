include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Insert a value at the given *index*.
	
	@function insertAt
	@param	{number}	index	The index to insert at
	@param	{any}		...		The value to insert
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance insertAt :3:1:1').code()}}
	**/
	insertAt(index: Number, ...args): Array {
		if index < 0 {
			do {
				index = this.length + index + 1
			}
			while index < 0
		}
		
		if args.length > 1 {
			if index {
				if index >= this.length {
					this.push(...args)
				}
				else {
					this.splice(index, 0, ...args)
				}
			}
			else {
				this.unshift(...args)
			}
		}
		else {
			if index {
				if index >= this.length {
					this.push(args[0])
				}
				else {
					this.splice(index, 0, args[0])
				}
			}
			else {
				this.unshift(args[0])
			}
		}
		
		return this
	}
}