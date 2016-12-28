include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Insert the values of the given array at the given *index*.
	
	@function injectAt
	@param	{number}	index	The index to insert at
	@param	{any}		...		The array of values to insert
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance injectAt :3:1:a').code()}}
	**/
	injectAt(index: Number, ...args): Array {
		if index < 0 {
			do {
				index = this.length + index + 1
			}
			while index < 0
		}
		
		if args.length > 1 {
			if index {
				if index >= this.length {
					for i from 0 til args.length {
						this.push(...args[i])
					}
				}
				else {
					for i from 0 til args.length {
						this.splice(index, 0, ...args[i])
						
						index += [].concat(args[i]).length
					}
				}
			}
			else {
				for i from args.length - 1 to 0 by -1 {
					this.unshift(...args[i])
				}
			}
		}
		else {
			if index {
				if index >= this.length {
					this.push(...args[0])
				}
				else {
					this.splice(index, 0, ...args[0])
				}
			}
			else {
				this.unshift(...args[0])
			}
		}
		
		return this
	}
}