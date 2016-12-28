include once ../inc/string

impl String {
	/**[md.zot]**api**
	Capitalizes the string only if the *sample* is capitalized.
	
	@function capitalizeSameAs
	@param	{string}	sample	The sample
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance capitalizeSameAs').code()}}
	**/
	capitalizeSameAs(sample): String {
		if sample.match(/^[A-Z]/) {
			return this.charAt(0).toUpperCase() + this.slice(1)
		}
		else {
			return this.valueOf()
		}
	}
}