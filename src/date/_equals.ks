include '../inc/date'

impl Date {
	static equals(itemA?, itemB?): Boolean { // {{{
		if itemA is not Date || itemB is not Date {
			return false
		}
		else {
			return itemA.getTime() == itemB.getTime()
		}
	} // }}}

	equals(itemB?): Boolean { // {{{
		if itemB is not Date {
			return false
		}
		else {
			return this.getTime() == itemB.getTime()
		}
	} // }}}
}