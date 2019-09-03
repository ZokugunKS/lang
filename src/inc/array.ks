require|extern sealed class Array

disclose Array {
	length: Number
	concat(...values): Array
	every(callback: Function, thisArg: Object = null): Boolean
	forEach(callback: Function, thisArg: Object = null): void
	indexOf(searchElement, fromIndex: Number = 0): Number
	join(separator: String = ','): String
	pop(): Any
	push(...elements): Number
	shift(): Any
	slice(begin: Number = 0, end: Number = -1)
	some(callback: Function, thisArg: Object = null): Boolean
	sort(compare: Function = null): Array
	splice(start: Number, delete: Number = -1, ...items): Array
	toString(): String
	unshift(...elements): Number
}

export Array