include '../inc/function'

impl Function {
	/**[md.zot]**api**
	Try to execute the function with the given arguments and given context.
	
	@function try
	@param	{array}		[args]	The arguments to pass
	@param	{object}	[bind]	The *this* context of the function
	@return {any}
	
	@example basics
		{{:dokka.get('mocha', 'function instance try').code()}}
	**/
	try(args = null, bind = null) {
		try {
			return this*$(bind, ...args)
		}

		return null
	}
	/**[md.zot]**api**
	Try to execute the given functions. As soon as a function doesn't throw an error, return its value. If no functions are executed without error, return *null*.
	
	@function try
	@param	{function}	[...]	The functions to try
	@return {any}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'function class try :val').code()}}
	**/
	static try(...args) {
		for arg in args {
			try {
				return arg()
			}
		}
		
		return null
	}
}