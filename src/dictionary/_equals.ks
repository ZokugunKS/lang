include {
	'../inc/dictionary'
}

impl Dictionary {
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
	static equals(itemA!: Dictionary?, itemB!: Dictionary?): Boolean {
		return true if itemA == itemB
		return false if itemA == null || itemB == null

		let count = 0
		for const :key of itemA {
			return false unless equals(itemA[key], itemB[key])

			++count
		}

		for const :key of itemB {
			--count
		}

		return count == 0
	}
}