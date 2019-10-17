include {
	'./array/_toSource'
	'./function/_toSource'
	'./dictionary/_toSource'
	'./object/_toSource'

	'./string/replaceAll'
}

/**[md.zot]**api**
Returns the representation of the given *value* as javascript source.

@function toSource
@param 	{any} 		value	The value
@return {string}
@free

@example basics
	{{:dokka.get('mocha', 'universal toSource').code()}}
**/
func toSource(value: Array): String => Array.toSource(value)
func toSource(value: Dictionary): String => Dictionary.toSource(value)
func toSource(value: Function): String => value.toSource()
func toSource(value: Object): String => Object.toSource(value)
func toSource(value?): String { // {{{
	if value == null {
		return 'null'
	}
	else if value is String {
		return '\'' + value:String.replaceAll('\'', '\\\'').replaceAll('\n', '\\n').replaceAll('\r', '\\r').replaceAll('\t', '\\t') + '\''
	}
	else if value.toString is Function {
		return value.toString()
	}
	else {
		return ''
	}
} // }}}

export toSource