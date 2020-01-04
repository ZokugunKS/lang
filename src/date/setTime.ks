include '../inc/date'

#[rules(non-exhaustive)]
disclose Date {
	internal setTime(value: Number): Number
}

impl Date {
	overwrite setTime(value: Number): Date {
		precursor(value)

		return this
	}
}