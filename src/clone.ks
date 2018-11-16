include {
	'./array/clone'
	'./object/clone'
}

/**[md.zot]**api**
Returns the clone of the given *value*.

@function clone
@param 	{any}	value	The value
@return {any}
@free

@example basics
	{{:dokka.get('mocha', 'universal clone').code()}}
**/
export func clone(value = null) { // {{{
	if value == null {
		return null
	}
	else if value is Array {
		return value:Array.clone()
	}
	else if value is Object {
		return Object.clone(value)
	}
	else {
		return value
	}
} // }}}