include '../inc/string'

impl String {
	/**[md.zot]**api**
	If the *pattern* is found, returns the string after it.
	If *last* is *true*, *after()* will use the last match of the *pattern*.

	@function substringAfter
	@param	{string|regex}	pattern			The pattern to search for
	@param	{boolean|int}	[position]		The position from which to get the string. If *true*, return last instance.
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance substringAfter w/string:default').code()}}
	**/
	substringAfter(pattern: String, position: Boolean | Number = 0, missingValue: String = ''): String { // {{{
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

			for i from 1 til position {
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

			for i from 1 til position {
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

		return index != -1 ? this.slice(index + length) : missingValue
	} // }}}
	substringAfter(pattern: RegExp, position: Boolean | Number = 0, missingValue: String = ''): String { // {{{
		if position == true {
			position = -1
		}

		let data: RegExpExecArray? = null

		if position == 0 || position == 1 {
			data = pattern.exec(this)
		}
		else {
			pattern = pattern.global ? pattern : new RegExp(pattern.source, 'g' + (pattern.ignoreCase ? 'i' : '') + (pattern.multiline ? 'm' : ''))

			if position < 0 {
				const founds: Array<RegExpExecArray> = []

				while const data = pattern.exec(this) {
					founds.push(data)
				}

				const index = founds.length + position
				if index >= 0 {
					data = founds[index]
				}
				else {
					return missingValue
				}
			}
			else {
				for const i from 1 til position {
					if !?pattern.exec(this) {
						return missingValue
					}
				}

				data = pattern.exec(this)
			}
		}

		if data? {
			return this.slice(data.index + data[0].length)
		}
		else {
			return missingValue
		}
	} // }}}
}