include once ./capitalize

impl String {
	/**[md.zot]**api**
	Uppercases the first letter of all the words and downcases all the others.
	
	@function capitalizeWords
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance capitalizeWords').code()}}
	**/
	capitalizeWords(): String => [item.capitalize() for item in this.split(' ')].join(' ')
}