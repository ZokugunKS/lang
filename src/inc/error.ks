require|extern sealed class Error

disclose Error {
	message: String
	name: String
	toString(): String
}

require|extern {
	sealed class ReferenceError extends Error
	sealed class SyntaxError extends Error
	sealed class TypeError extends Error
}

export Error, ReferenceError, SyntaxError, TypeError