include '../inc/date'

impl Date {
	static clone(value: Date): Date => value.clone()

	clone(): Date => new Date(this)
}