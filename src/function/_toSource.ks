include '../inc/function'

const COMMENTS_REGEX = /((?:\/\/[^\r\n\\]*$)|(?:\/\*[^\\]*?\*\/))/mg
const FUNCTION_REGEX = /^function\s*(?:\w*)\(([^\)]*)\)\s*([\s\S]+)$/m
const NEWLINE_REGEX = /[\r\n]+/g

impl Function {
	/**[md.zot]**api**
	Returns the representation of the function as javascript source.

	@function toSource
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'function instance toSource').code()}}
	**/
	toSource(): String {
		const src = this.toString().replace(COMMENTS_REGEX, '')

		if const match = FUNCTION_REGEX.exec(src) {
			return `function(\(match[1]!?.replace(NEWLINE_REGEX, ''))) \(match[2])`
		}
		else {
			return src
		}
	}
}