include {
	'../inc/array'
	
	'../number/randomInt'
}

impl Array {
	/**[md.zot]**api**
	Returns a value picked randomly.
	
	@function random
	@return {any}
	
	@example basics
		{{:dokka.get('mocha', 'array instance random :3').code()}}
	**/
	random() => this.length ? this[Number.randomInt(0, this.length - 1)] : null
}

export Array