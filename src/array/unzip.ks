include once {
	../inc/array
	
	./pluck
}

impl Array {
	/**[md.zot]**api**
	Returns a series of new arrays, the first of which contains all of the first elements, the second of which contains all of the second elements, and so on.
	
	@class Array
	@function unzip
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance unzip').code()}}
	**/
	unzip(): Array {
		let length = 0
		for item in this when item?.length > length {
			length = item.length
		}
		
		let result = []
		
		for i from 0 til length {
			result[i] = this.pluck(i)
		}
		
		return result
	}
}