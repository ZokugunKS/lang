require|extern sealed class RegExp

#[rules(non-exhaustive)]
disclose RegExp {
	exec(...): Array<String?>?
	test(...): Boolean
}

export RegExp