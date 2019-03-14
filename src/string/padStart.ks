include {
	'../inc/string'

	'./repeat'
}

#[if(any(lt(chakra-v1.3), lt(ecma-v8), lt(jsc-v10), lt(monkey-v48), trident, lt(v8-v5.7)))]
impl String {
	/**[md.zot]**api**
	Returns the string of length *length* and left padded with *pad* or space.

	@function padStart
	@param	{number}	targetLength	The length of the resulting string once the current string has been padded.
	@param	{string}	[pad]			The string to pad the current string with.
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance padStart').code()}}
	**/
	padStart(targetLength: Number, pad: String = ' '): String => pad.repeat(targetLength - this.length) + this
}

#[else]
disclose String {
	padStart(targetLength: Number, pad: String = ' '): String
}