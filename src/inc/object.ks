require|extern sealed class Object

#[rules(non-exhaustive)]
disclose Object {
	static keys(obj: Object): Array<String>
	toString(): String
}

export Object