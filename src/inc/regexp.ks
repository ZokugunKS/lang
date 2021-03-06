require|extern systemic class RegExp

type RegExpExecArray = Array<String?> & {
    index: Number
    input: String
}

disclose RegExp {
	source: String
	global: Boolean
	ignoreCase: Boolean
	multiline: Boolean
	exec(str: String, index: Number = 0): RegExpExecArray?
	test(str: String): Boolean
	toString(): String
}

export RegExp, RegExpExecArray