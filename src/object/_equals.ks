include {
	'../inc/object'
}

impl Object {
	/**[md.zot]**api**
	Returns *true* if *one* is softly equals to *two*, *false* if it's not.

	@function equals
	@param	{object}	itemA		The first value to compare
	@param	{object}	itemB		The first value to compare
	@return {boolean}
	@static

	@example basics
		{{:dokka.get('mocha', 'object equals :default').code()}}
	**/
	static equals(itemA?, itemB?): Boolean {
		return true if itemA == itemB
		return false if itemA == null || itemB == null
		return false if itemA.constructor != itemB.constructor

		if itemA.constructor.equals {
			return itemA.constructor.equals(itemA, itemB)
		}

		if itemA.constructor.prototype.equals {
			return itemA.equals(itemB)
		}

		let count = 0
		for const :key of itemA when itemA.hasOwnProperty(key) {
			return false unless itemB.hasOwnProperty(key)
			return false unless equals(itemA[key], itemB[key])

			++count
		}

		for const :key of itemB when itemB.hasOwnProperty(key) {
			--count
		}

		return count == 0
	}
}