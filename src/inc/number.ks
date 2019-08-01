require|extern sealed class Number

#[rules(non-exhaustive)]
disclose Number {
	toString(): String
}

extern {
	isNaN
	parseFloat
	parseInt
}

export Number