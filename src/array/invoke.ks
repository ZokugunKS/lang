include './map'

impl Array {
	/**[md.zot]**api**
	Returns an array with the named method applied to the array's elements.
	
	@function invoke
	@param	{string}	methodName		The method's name to call
	@return	{array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance invoke').code()}}
	**/
	invoke(methodName: String, ...args): Array {
		return this.map(item => item[methodName]*$(item, ...args))
	}
}