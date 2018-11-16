include {
	'../inc/array'
	
	'./from'
}

impl Array {
	/**[md.zot]**api**
	Erase all the values of the array except the values of the give array
	
	@function retain
	@param	{array}		'...		The list of values to retain'
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance retain :one').code()}}
	**/
	retain(...args): Array {
		for i from 0 til args.length {
			args[i] = Array.from(args[i])
		}
		
		let remove, j
		for value, i in this desc {
			remove = true
			
			for j from 0 til args.length while remove {
				remove = false if args[j].indexOf(value) != -1
			}
			
			this.splice(i, 1) if remove
		}
		
		return this
	}
}