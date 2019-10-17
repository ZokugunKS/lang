include '../inc/string'

impl String {
	/**[md.zot]**api**
	If the *pattern* is found, returns the string before it.

	@function substringBefore
	@param	{string|regex}	pattern			The pattern to search for
	@param	{boolean|int}	[position]		The position from which to get the string. If *true*, return last instance.
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance substringBefore w/string:default').code()}}
	**/
	substringBefore(pattern: String, position: Boolean | Number = 0, missingValue: String = ''): String { // {{{
		if position == true {
			position = -1
		}

		if pattern.length == 0 {
			return missingValue
		}

		let index = -1
		let length = pattern.length

		if position < 0 {
			index = this.length
			position = -position

			for const i from 1 til position {
				index = this.lastIndexOf(pattern, index)

				if index != -1 {
					index -= length
				}
				else {
					break
				}
			}

			if index != -1 {
				index = this.lastIndexOf(pattern, index)
			}
		}
		else {
			index = 0

			for const i from 1 til position {
				index = this.indexOf(pattern, index)

				if index != -1 {
					index += length
				}
				else {
					break
				}
			}

			if index != -1 {
				index = this.indexOf(pattern, index)
			}
		}

		return index != -1 ? this.substr(0, index) : missingValue
	} // }}}
	substringBefore(pattern: RegExp, position: Boolean | Number = 0, missingValue: String = ''): String { // {{{
		if position == true {
			position = -1
		}

		let index: Number = -1

		if position == 0 || position == 1 {
			if const data = pattern.exec(this) {
				index = data.index
			}
		}
		else {
			pattern = pattern.global ? pattern : new RegExp(pattern.source, 'g' + (pattern.ignoreCase ? 'i' : '') + (pattern.multiline ? 'm' : ''))

			if position < 0 {
				let founds: Array = []

				while const data = pattern.exec(this) {
					founds.push(data)
				}

				if position {
					if founds.length != 0 {
						index = founds.last().index
					}
				}
				else {
					const i = founds.length + position
					if i >= 0 {
						index = founds[i].index
					}
				}
			}
			else {
				for const i from 1 til position {
					if data !?= pattern.exec(this) {
						return missingValue
					}
				}

				if const data = pattern.exec(this) {
					index = data.index
				}
			}
		}

		return index != -1 ? this.substr(0, index) : missingValue
	} // }}}
}