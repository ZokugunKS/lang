require|extern systemic class Function

disclose Function {
	caller: Any
	length: Number
	apply(thisArg: Dictionary, arguments: Array)
	bind(thisArg: Dictionary, ...arguments): Function
	call(thisArg: Dictionary, ...arguments)
	toString(): String
}

export Function

extern {
	clearTimeout
	setInterval
	setTimeout
}