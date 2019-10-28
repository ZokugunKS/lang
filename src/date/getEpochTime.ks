include '../inc/date'

#[rules(non-exhaustive)]
disclose Date {
	internal getTime(): Number
}

impl Date {
	getEpochTime(): Number => this.getTime()
}