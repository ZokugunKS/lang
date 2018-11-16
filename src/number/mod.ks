include '../inc/number'

impl Number {
	/**[md.zot]**api**
	Modulate the number.
	
	@function mod
	@param	{number}	max	The maximum number
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'number instance mod').code()}}
	**/
	mod(max): Number {
		if isNaN(this) {
			return 0
		}
		else {
			let n = this % max
			if n < 0 {
				return n + max
			}
			else {
				return n
			}
		}
	}
}