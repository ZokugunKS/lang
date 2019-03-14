include '../inc/string'

#[if(any(gte(monkey-v61), gte(v8-v6.6)))]
disclose String {
	trimStart(): String
}

#[else]
impl String {
	/**[md.zot]**api**
	Returns the string trimmed of the left.

	@function trimStart
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance trimStart').code()}}
	**/
	trimStart(): String => this.replace(/(^\s*)/g, '')
}