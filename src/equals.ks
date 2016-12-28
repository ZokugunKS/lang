include once {
	./array/equals
	./object/equals
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
	return true if itemA == itemB
	return false if itemA == null || itemB == null
	return itemA:Array.equals(itemB) if itemA is Array
	return Object.equals(itemA, itemB) if itemA is Object
	return false
} // }}}