include once './replaceAll'

impl String {
	/**[md.zot]**api**
	Returns the string with surrounding quotes.
	
	@function quote
	@param	{string}	[quote="]		The quote to use
	@param	{string}	[escape]		How to escape the quote
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance quote :default').code()}}
	**/
	quote(quote: String = '"', escape: String = ''): String {
		let last = this.length - 1
		
		if this[0] == quote && this[last] == quote {
			return this.valueOf()
		}
		else if escape.length > 0 {
			return quote + this.replaceAll(escape, escape + escape).replaceAll(quote, escape + quote) + quote
		}
		else {
			return quote + this + quote
		}
	}
	/**[md.zot]**api**
	Returns the string with surrounding quotes.
	
	@function quote
	@param	{string}	value			The value to quote
	@param	{string}	[quote="]		The quote to use
	@param	{string}	[escape]		How to escape the quote
	@return {string}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'string class quote').code()}}
	**/
	static quote(value: String, quote = null, escape = null): String {
		return value.quote(quote, escape)
	}
}