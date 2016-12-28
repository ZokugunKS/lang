include once {
	../inc/object
	
	../array/intersection
}

impl Object {
	/**[md.zot]**api**
	Returns an object containing the key-value pair from *object* with the key contained in *keys*.
	
	@function subset
	@param	{object}		item	The object
	@param	{array[string]}	keys	The keys to extract
	@return {object}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'object subset').code()}}
	**/
	static subset(item: Object, keys: Array<String>): Object {
		let results = {}
		
		for key in Object.keys(item).intersection(keys) {
			results[key] = item[key]
		}
		
		return results
	}
}