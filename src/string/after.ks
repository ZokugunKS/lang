include '../inc/string'

impl String {
	/**[md.zot]**api**
	If the *pattern* is found, returns the string after it.
	If *last* is *true*, *after()* will use the last match of the *pattern*.
	
	@function after
	@param	{string|regex}	pattern			The pattern to search for
	@param	{boolean|int}	[position]		The position from which to get the string. If *true*, return last instance.
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance after w/string:default').code()}}
	**/
	after(pattern, position = 0): String {
		let index = -1
		let length
		
		position = -1 if position == true
		
		if pattern is String {
			if pattern.length {
				length = pattern.length
				
				if position < 0 {
					index = this.length
					position = -position
					
					for i from 1 til position {
						index = this.lastIndexOf(pattern, index)
						
						if index != -1 {
							index -= length
						}
						else {
							break
						}
					}
					
					if index != -1 {
						index = this.lastIndexOf(pattern, index)
					}
				}
				else {
					index = 0
					
					for i from 1 til position {
						index = this.indexOf(pattern, index)
						
						if index != -1 {
							index += length
						}
						else {
							break
						}
					}
					
					if index != -1 {
						index = this.indexOf(pattern, index)
					}
				}
			}
		}
		else {
			let data = true
			
			if position == 1 {
				data = pattern.exec(this)
				
				index = data.index
			}
			else {
				pattern = pattern.global ? pattern : new RegExp(pattern.source, 'g' + (pattern.ignoreCase ? 'i' : '') + (pattern.multiline ? 'm' : ''))
				
				if position < 0 {
					let founds = []
					while data = pattern.exec(this) {
						founds.push(data)
					}
					
					if position == true {
						if founds.length {
							data = founds.last()
							
							index = data.index
						}
					}
					else {
						let i = founds.length + position
						if i >= 0 {
							data = founds[i]
							
							index = data.index
						}
					}
				}
				else {
					for i from 1 til position while data? {
						data = pattern.exec(this)
					}
					
					if data? {
						data = pattern.exec(this)
						
						index = data.index
					}
				}
			}
			
			if index != -1 {
				length = data[0].length
			}
		}
		
		return index != -1 ? this.slice(index + length) : ''
	}
}