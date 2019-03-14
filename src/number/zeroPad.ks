include {
	'../inc/number'

	'../string/padStart'
	'../string/padEnd'
}

impl Number {
	/**[md.zot]**api**
	If *end* is true, returns the number as a string padded, from the end, with '0' as its length is *targetLength*.
	If *end* is false, returns the number as a string padded, from the start, with '0' as its length is *targetLength*.

	@function zeroPad
	@param	{number}	targetLength	The length of the resulting string once the current string has been padded.
	@param	{boolean}	[end]			The flag to padded from the end or not
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'number instance zeroPad').code()}}
	**/
	zeroPad(targetLength: Number, end: Boolean = false): String {
		if end {
			return this.toString().padEnd(targetLength, '0')
		}
		else {
			return this.toString().padStart(targetLength, '0')
		}
	}
}