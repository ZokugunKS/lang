include once ../inc/json

func $path(value, seen, keys) { // {{{
	let index = seen.indexOf(value)
	let path = [keys[index]]
	
	while --index >= 0 {
		if seen[index] && seen[index][path[0]] == value {
			value = seen[index]
			path.unshift(keys[index])
		}
	}
	
	return '~' + path.join('.')
} // }}}
	
func $replacer(replacer?, decycle?) { // {{{
	let seen = []
	let keys = []
	
	decycle ??= (key, value) => '[Circular ' + $path(value, seen, keys) + ']'
	
	if replacer? {
		return func(key, value?) {
			let index
			if value == null {
				return null
			}
			else if value is Object && (index = seen.indexOf(value)) != -1 {
				return replacer(key, decycle(key, value))
			}
			else {
				seen.push(value)
				keys.push(key)
				
				return replacer(key, value)
			}
		}
	}
	else {
		return func(key, value?) {
			let index
			if value == null {
				return null
			}
			else if value is Object && (index = seen.indexOf(value)) != -1 {
				return decycle(key, value)
			}
			else {
				seen.push(value)
				keys.push(key)
				
				return value
			}
		}
	}
} // }}}

impl JSON {
	/**[md.zot]**api**
	Returns a JSON string without circular references.
	
	@function stringifySafely
	@param	{any}					item			The object to serialize
	@param	{function(key, value)}	[replacer]		Generate the object representation
	@param	{string}				[indent]		The indentation
	@param	{function(key, value)}	[decycle]		How to generate the circular references
	@return {string}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'json stringifySafely :default').code()}}
	**/
	stringifySafely(item, replacer?, indent?, decycle?) => JSON.stringify(item, $replacer(replacer, decycle), indent)
}