include '../inc/regexp'

impl RegExp {
	static equals(itemA?, itemB?): Boolean { // {{{
		if itemA is not RegExp || itemB is not RegExp {
			return false
		}
		else {
			return itemA.equals(itemB)
		}
	} // }}}

	equals(itemB?): Boolean { // {{{
		if itemB is not RegExp {
			return false
		}
		else {
			return this.source == itemB.source && this.global == itemB.global && this.ignoreCase == itemB.ignoreCase && this.multiline == itemB.multiline
		}
	} // }}}
}