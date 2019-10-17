require|extern sealed class Dictionary

#[rules(non-exhaustive)]
disclose Dictionary {
	static keys(obj: Dictionary): Array<String>
	toString(): String
}

export Dictionary