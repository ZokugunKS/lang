include {
	'./startsWith'
	'../dictionary/values'
}

extern eval

impl String {
	/**[md.zot]**api**
	Evaluate the string as Javascript code.

	If the string starts with 'function' or '{', or the argument *context* is given, it will build a returning function so, the code won't be able to access the local variable of the caller.

	The *context* will give the keys as the arguments' names and its values as the aruments' values.

	@function evaluate
	@param	{object}	[context]		The key-value pairs
	@param	{boolean}	[hasReturn]		Flag if the code has already a return
	@return {any}

	@example basics
		{{:dokka.get('mocha', 'string instance evaluate').code()}}
	**/
	evaluate(context = null, hasReturn = false) {
		const value = this.trim()

		if value.startsWith('function') || value.startsWith('{') || context? {
			if context is Dictionary {
				if value.startsWith('return') || hasReturn {
					return eval('(function(' + Dictionary.keys(context).join(',') + '){' + value + '})').apply(null, Dictionary.values(context))
				}
				else {
					return eval('(function(' + Dictionary.keys(context).join(',') + '){return ' + value + ';})').apply(null, Dictionary.values(context))
				}
			}
			else {
				if value.startsWith('return') || context? {
					return eval('(function(){' + value + '})()')
				}
				else {
					return eval('(function(){return ' + value + ';})()')
				}
			}
		}
		else {
			return eval(value)
		}
	}
}