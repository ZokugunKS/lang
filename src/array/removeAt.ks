include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Remove the value at the given index.
	
	@function removeAt
	@param	{number}	index	The index of the value to remove
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance removeAt :1').code()}}
	**/
	removeAt(index): Array {
		if index < 0 {
			if -this.length < index {
				this.splice(this.length + index, 1)
			}
		}
		else if index < this.length {
			this.splice(index, 1)
		}
		
		return this
	}
}