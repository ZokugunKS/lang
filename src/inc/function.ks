require|extern sealed class Function

disclose Function {
	caller: Object
	length: Number
	apply(thisArg: Object, arguments: Array)
	bind(thisArg: Object, ...arguments): Function
	call(thisArg: Object, ...arguments)
	toString(): String
}

export Function

extern {
	clearTimeout
	setInterval
	setTimeout
}