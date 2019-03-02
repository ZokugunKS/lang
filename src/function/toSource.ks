include {
	'../inc/function'

	'../toSource'
}

impl Function {
	/**[md.zot]**api**
	Returns the representation of the function as javascript source.

	@function toSource
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'function instance toSource').code()}}
	**/
	toSource(): String {
		let src = this.toString().replace(/^function (?:\w*)\(/, 'function(')

		let regex = /^function\((?:([\r\n]*|\/\*(?:[^*]|(?:\*+[^\*\/]))*\*+\/)|[\w\t, ])*\)/gim
		let info
		while (info ?= regex.exec(src)) && info[1]? {
			src = src.replace(info[1], '')
		}

		return src
	}
}