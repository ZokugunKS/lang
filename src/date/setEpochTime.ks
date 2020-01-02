include '../inc/date'

#[rules(non-exhaustive)]
disclose Date {
	internal setTime(value: Number): Number
}

impl Date {
	setEpochTime(value: Number): Date {
		this.setTime(value)

		return this
	}
}