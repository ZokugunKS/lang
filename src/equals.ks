include once {
	'./array/equals'
	'./object/equals'
}

/**[md.zot]**api**
Returns *true* if *one* is softly equals to *two*, *false* if it's not.

@function equals
@param 	{any} 		itemA		The first value to compare
@param 	{any} 		itemB		The second value to compare
@return {boolean}
@free

@example basics
	{{:dokka.get('mocha', 'universal equals').code()}}
**/
export func equals(itemA?, itemB?) { // {{{
	if itemA == itemB {
		return true
	}
	else if itemA == null || itemB == null {
		return false
	}
	else if itemA is Array {
		return itemA:Array.equals(itemB)
	}
	else if itemA is Object {
		return Object.equals(itemA, itemB)
	}
	else {
		return false
	}
} // }}}