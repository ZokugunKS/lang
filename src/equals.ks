include {
	'./array/_equals'
	'./date/_equals'
	'./dictionary/_equals'
	'./object/_equals'
	'./regexp/_equals'
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
func equals(itemA: Array, itemB: Array) => itemA.equals(itemB)
func equals(itemA: Date, itemB: Date) => itemA.equals(itemB)
func equals(itemA: Dictionary, itemB: Dictionary) => Dictionary.equals(itemA, itemB)
func equals(itemA: Object, itemB: Object) => Object.equals(itemA, itemB)
func equals(itemA: RegExp, itemB: RegExp) => itemA.equals(itemB)
func equals(itemA?, itemB?) => itemA == itemB

export equals