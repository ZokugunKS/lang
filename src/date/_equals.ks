include './getEpochTime'

extern console

impl Date {
	static equals(itemA?, itemB?): Boolean { // {{{
		if itemA is not Date || itemB is not Date {
			return false
		}
		else {
			return itemA.getEpochTime() == itemB.getEpochTime()
		}
	} // }}}

	equals(itemB?): Boolean { // {{{
		if itemB is not Date {
			return false
		}
		else {
			return this.getEpochTime() == itemB.getEpochTime()
		}
	} // }}}
}