include '../inc/string'

macro strEquals(@value: String) { // {{{
	macro this.charCodeAt(0) == #(value.charCodeAt(0))

	for const i from 1 til value.length {
		macro \ && this.charCodeAt(#i) == #(value.charCodeAt(i))
	}
} // }}}

impl String {
	toBooleanOrNull(): Boolean? {
		if this.length == 0 || this.length > 5 {
			return null
		}
		else if this.length == 1 {
			if strEquals!('1') {
				return true
			}
			else if strEquals!('0') {
				return false
			}
			else {
				return null
			}
		}
		else if this.length == 2 {
			if strEquals!('on') {
				return true
			}
			else if strEquals!('no') {
				return false
			}
			else {
				return null
			}
		}
		else if this.length == 3 {
			if strEquals!('yes') {
				return true
			}
			else if strEquals!('off') {
				return false
			}
			else {
				return null
			}
		}
		else if this.length == 4 {
			if strEquals!('true') {
				return true
			}
			else {
				return null
			}
		}
		else {
			if strEquals!('false') {
				return false
			}
			else {
				return null
			}
		}
	}
}