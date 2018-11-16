include {
	'../string/escapeRegex'
	'../array/from'
}

impl String {
	/**[md.zot]**api**
	Returns the string without surrounding quotes.
	
	@function unquote
	@param	{string|array}	[quote]			The quote to use
	@param	{string}		[escape]		How to escape the quote
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance unquote :double').code()}}
	**/
	unquote(quote = ['"', "'"], escape: String = ''): String {
		if quote is not Array {
			quote = Array.from(quote)
		}
		
		let last = this.length - 1
		
		for i from 0 til quote.length {
			if this[0] == quote[i] && this[last] == quote[i] {
				if escape.length > 0 {
					return this.slice(1, last).replace(new RegExp(`([^\(escape.escapeRegex())])\(escape.escapeRegex())(\(quote.join('|')))`, 'g'), '$1$2')
				}
				else {
					return this.slice(1, last)
				}
			}
		}
		
		return this.valueOf()
	}
	/**[md.zot]**api**
	Returns the string without surrounding quotes.
	
	@function unquote
	@param	{string}		value			The value to unquote
	@param	{string|array}	[quote]			The quote to use
	@param	{string}		[escape]		How to escape the quote
	@return {string}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'string class unquote').code()}}
	**/
	static unquote(value: String, quote = null, escape = null) {
		return value.unquote(quote, escape)
	}
}