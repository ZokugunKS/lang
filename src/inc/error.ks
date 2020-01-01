require|extern systemic class Error

disclose Error {
	message: String
	name: String
	toString(): String
}

require|extern {
	systemic class ReferenceError extends Error
	systemic class SyntaxError extends Error
	systemic class TypeError extends Error
}

class ParseError extends Error {
	override toString() => `ParseError: \(@message)`
}

export Error, ParseError, ReferenceError, SyntaxError, TypeError