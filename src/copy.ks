include {
	'./array/copy'
	'./dictionary/copy'
}

/**[md.zot]**api**
Returns the shallow copy of the given *value*.

@function copy
@param 	{any}	value	The value
@return {any}
@free

@example basics
	{{:dokka.get('mocha', 'universal copy').code()}}
**/
export func copy(value?) { // {{{
	if value == null {
		return null
	}
	else if value is Array {
		return value.copy()
	}
	else if value is Dictionary {
		return Dictionary.copy(value)
	}
	else {
		return value
	}
} // }}}