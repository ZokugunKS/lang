include '../inc/string'

#[if(any(gte(monkey-v61), gte(v8-v6.6)))]
disclose String {
	trimEnd(): String
}

#[else]
impl String {
	/**[md.zot]**api**
	Returns the string trimmed of the right.

	@function trimEnd
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance trimEnd').code()}}
	**/
	trimEnd(): String => this.replace(/\s+$/, '')
}