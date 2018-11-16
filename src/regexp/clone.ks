include '../inc/regexp'

impl RegExp {
	/**[md.zot]**api**
	Returns a  clone of the given value.
	
	@function clone
	@param	{regex}	value	The value
	@return {regex}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'regexp clone w/flag:i').code()}}
	**/
	static clone(value): RegExp => new RegExp(value.source, (value.global ? 'g' : '') + (value.ignoreCase ? 'i' : '') + (value.multiline ? 'm' : ''))
}