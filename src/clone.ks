include {
	'./array/_clone'
	'./date/_clone'
	'./dictionary/_clone'
	'./object/_clone'
	'./regexp/_clone'
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
func clone(value: Array): Array => value.clone()
func clone(value: Date): Date => value.clone()
func clone(value: Dictionary): Dictionary => Dictionary.clone(value)
func clone(value: Object): Object => Object.clone(value)
func clone(value: RegExp): RegExp => value.clone()
func clone(value?) => value

export clone