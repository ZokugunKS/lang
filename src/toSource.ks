include {
	'./array/toSource'
	'./function/toSource'
	'./object/toSource'
	
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
export func toSource(value?): String { // {{{
	if value == null {
		return 'null'
	}
	else if value is Array {
		return Array.toSource(value)
	}
	else if value is Function {
		return value.toSource()
	}
	else if value is Object {
		return Object.toSource(value)
	}
	else if value is String {
		return '\'' + value:String.replaceAll('\'', '\\\'').replaceAll('\n', '\\n').replaceAll('\r', '\\r').replaceAll('\t', '\\t') + '\''
	}
	else if value? {
		return value.toString()
	}
	else {
		return ''
	}
} // }}}