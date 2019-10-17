include '../inc/regexp'

impl RegExp {
	static clone(value: RegExp): RegExp => value.clone()

	clone(): RegExp => new RegExp(this.source, (this.global ? 'g' : '') + (this.ignoreCase ? 'i' : '') + (this.multiline ? 'm' : ''))
}