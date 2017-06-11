include once {
	'../inc/number'
	
	'../string/lpad'
	'../string/rpad'
}

impl Number {
	/**[md.zot]**api**
	If *right* is true, returns the number as a string padded, on the right, with '0' as its length is *length*.
	If *right* is false, returns the number as a string padded, on the left, with '0' as its length is *length*.
	
	@function zeroPad
	@param	{number}	length		The length of the string
	@param	{boolean}	[right]		The flag to padded on right or not
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'number instance zeroPad').code()}}
	**/
	zeroPad(length, right = false) {
		if right {
			return this.toString().rpad(length, '0')
		}
		else {
			return this.toString().lpad(length, '0')
		}
	}
}