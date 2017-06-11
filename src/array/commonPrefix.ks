include once '../inc/array'

extern console

impl Array<String> {
	/**[md.zot]**api**
	Returns the common prefix for the given *array*.
	
	@function commonPrefix
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'array string commonPrefix :many:first').code()}}
	**/
	commonPrefix(): String { // {{{
		let l = this.length
		if l == 0 {
			return ''
		}
		else if l == 1 {
			return this[0]
		}
		else {
			let i, c, k
			let last = -1
			
			do {
				++last
				k = null
				
				for i from 0 til l {
					if (c = this[i].charAt(last)).length == 0 {
						break
					}
					
					if k == null {
						k = c
					}
					else if k != c {
						break
					}
				}
			}
			while i == l
			
			return this[0].slice(0, last)
		}
	} // }}}
}