require|extern sealed class String

disclose String {
	length: Number
	charAt(index: Number): String
	charCodeAt(index: Number): Number
	concat(...strings: Array<String>): String
	fromCharCode(...numbers: Array<Number>): String
	indexOf(search: String, fromIndex: Number = 0): Number
	lastIndexOf(search: String, fromIndex: Number = 0): Number
	match(regexp: RegExp): Array?
	replace(pattern: RegExp | String, replacement: Function | String): String
	search(regexp: RegExp): Number
	slice(beginIndex: Number, endIndex: Number = -1): String
	split(separator: RegExp | String = null, limit: Number = -1): Array<String>
	substr(start: Number, length: Number = -1): String
	substring(indexStart: Number, indexEnd: Number = -1): String
	toLowerCase(): String
	toString(): String
	toUpperCase(): String
	trim(): String
	valueOf(): String
}

export String