#![bin]

extern {
	describe:	func
	it:			func
}

import {
	expect 		from 'chai'
	*			from '../index.ks'
}

describe('string', func() {
	describe('instance', func() {
		it('after w/string:default', func() { // {{{
			expect('How are you doing miss White?'.after(' ')).to.equal('are you doing miss White?')
		}) // }}}
		
		it('after w/string:true', func() { // {{{
			expect('How are you doing miss White?'.after(' ', true)).to.equal('White?')
		}) // }}}
		
		it('after w/string:3', func() { // {{{
			expect('How are you doing miss White?'.after(' ', 3)).to.equal('doing miss White?')
		}) // }}}
		
		it('after w/string:-2', func() { // {{{
			expect('How are you doing miss White?'.after(' ', -2)).to.equal('miss White?')
		}) // }}}
		
		it('after w/string:break', func() { // {{{
			expect('miss White?'.after(' ', -3)).to.equal('')
		}) // }}}
		
		it('after w/string:10', func() { // {{{
			expect('How are you doing miss White?'.after(' ', 10)).to.equal('')
		}) // }}}
		
		it('after w/regex:default', func() { // {{{
			expect('How are you doing miss White?'.after(/\s+/)).to.equal('are you doing miss White?')
		}) // }}}
		
		it('after w/regex:true', func() { // {{{
			expect('How are you doing miss White?'.after(/\s+/, true)).to.equal('White?')
		}) // }}}
		
		it('after w/regex:3', func() { // {{{
			expect('How are you doing miss White?'.after(/\s+/, 3)).to.equal('doing miss White?')
		}) // }}}
		
		it('after w/regex:-2', func() { // {{{
			expect('How are you doing miss White?'.after(/\s+/, -2)).to.equal('miss White?')
		}) // }}}
		
		it('after w/regex:10', func() { // {{{
			expect('How are you doing miss White?'.after(/\s+/, 10)).to.equal('')
		}) // }}}
		
		it('after w/regex:g', func() { // {{{
			expect('How are you doing miss White?'.after(/\s+/g, 3)).to.equal('doing miss White?')
		}) // }}}
		
		it('after w/regex:im', func() { // {{{
			expect('How are you doing miss White?'.after(/\s+/im, 3)).to.equal('doing miss White?')
		}) // }}}
		
		it('append wo/separator wo/null', func() { // {{{
			expect('foo'.append('bar')).to.equal('foobar')
		}) // }}}
		
		it('append wo/separator w/null', func() { // {{{
			expect('foo'.append(null)).to.equal('foo')
		}) // }}}
		
		it('append w/separator wo/null', func() { // {{{
			expect('foo'.append('bar', '|')).to.equal('foo|bar')
		}) // }}}
		
		it('append w/separator w/null', func() { // {{{
			expect('foo'.append(null, '|')).to.equal('foo')
		}) // }}}
		
		it('append empty', func() { // {{{
			expect(''.append('bar')).to.equal('bar')
		}) // }}}
		
		it('before w/string:default', func() { // {{{
			expect('How are you doing miss White?'.before(' ')).to.equal('How')
		}) // }}}
		
		it('before w/string:true', func() { // {{{
			expect('How are you doing miss White?'.before(' ', true)).to.equal('How are you doing miss')
		}) // }}}
		
		it('before w/string:3', func() { // {{{
			expect('How are you doing miss White?'.before(' ', 3)).to.equal('How are you')
		}) // }}}
		
		it('before w/string:-2', func() { // {{{
			expect('How are you doing miss White?'.before(' ', -2)).to.equal('How are you doing')
		}) // }}}
		
		it('before w/string:break', func() { // {{{
			expect('miss White?'.before(' ', -3)).to.equal('')
		}) // }}}
	
		it('before w/string:10', func() { // {{{
			expect('How are you doing miss White?'.before(' ', 10)).to.equal('')
		}) // }}}
		
		it('before w/regex:default', func() { // {{{
			expect('How are you doing miss White?'.before(/\s+/)).to.equal('How')
		}) // }}}
		
		it('before w/regex:true', func() { // {{{
			expect('How are you doing miss White?'.before(/\s+/, true)).to.equal('How are you doing miss')
		}) // }}}
		
		it('before w/regex:3', func() { // {{{
			expect('How are you doing miss White?'.before(/\s+/, 3)).to.equal('How are you')
		}) // }}}
		
		it('before w/regex:-2', func() { // {{{
			expect('How are you doing miss White?'.before(/\s+/, -2)).to.equal('How are you doing')
		}) // }}}
		
		it('before w/regex:10', func() { // {{{
			expect('How are you doing miss White?'.before(/\s+/, 10)).to.equal('')
		}) // }}}
		
		it('before w/regex:g', func() { // {{{
			expect('How are you doing miss White?'.before(/\s+/g, 3)).to.equal('How are you')
		}) // }}}
		
		it('before w/regex:im', func() { // {{{
			expect('How are you doing miss White?'.before(/\s+/im, 3)).to.equal('How are you')
		}) // }}}
		
		it('camelize', func() { // {{{
			expect('miss white'.camelize()).to.equal('missWhite')
			expect('miss_white'.camelize()).to.equal('missWhite')
			expect('-miss-white'.camelize()).to.equal('MissWhite')
		}) // }}}
		
		it('capitalize', func() { // {{{
			expect('miss White'.capitalize()).to.equal('Miss white')
		}) // }}}
		
		it('capitalizeSameAs', func() { // {{{
			expect('he'.capitalizeSameAs('she')).to.equal('he')
			expect('he'.capitalizeSameAs('She')).to.equal('He')
		}) // }}}
		
		it('capitalizeWords', func() { // {{{
			expect('miss white'.capitalizeWords()).to.equal('Miss White')
		}) // }}}
		
		it('classify', func() { // {{{
			expect('miss white'.classify()).to.equal('MissWhite')
			expect('miss_white'.classify()).to.equal('MissWhite')
			expect('-miss-white'.classify()).to.equal('MissWhite')
		}) // }}}
		
		it('clean', func() { // {{{
			expect('miss    \n    White'.clean()).to.equal('miss White')
		}) // }}}
		
		it('clip :default', func() { // {{{
			expect('miss White'.clip()).to.equal('miss White')
		}) // }}}
		
		it('clip :2:2', func() { // {{{
			expect('miss White'.clip(2, 2)).to.equal('ss Whi')
		}) // }}}
		
		it('contains', func() { // {{{
			expect('yellow,red'.contains('yellow')).to.be.true
			expect('yellow,red'.contains('redyellow')).to.be.false
			expect('redyellow,red'.contains('yellow')).to.be.true
			
			expect('redyellow,red'.contains('yellow', ',')).to.be.false
			expect('yellow'.contains('yellow', ',')).to.be.true
		}) // }}}
		
		it('dasherize', func() { // {{{
			expect('missWhite'.dasherize()).to.equal('miss-white')
			expect('miss white'.dasherize()).to.equal('miss-white')
			expect('miss_white'.dasherize()).to.equal('miss-white')
			expect('-miss-white'.dasherize()).to.equal('-miss-white')
		}) // }}}
		
		it('drop :default', func() { // {{{
			expect('miss White'.drop()).to.equal('iss White')
		}) // }}}
		
		it('drop :5', func() { // {{{
			expect('miss White'.drop(5)).to.equal('White')
		}) // }}}
		
		it('endsWith', func() { // {{{
			expect('miss White'.endsWith('te')).to.be.true
			expect('miss White'.endsWith('ta')).to.be.false
		}) // }}}
		
		it('escapeRegex', func() { // {{{
			expect('[miss.white]'.escapeRegex()).to.equal('\\[miss\\.white\\]')
		}) // }}}
		
		it('evaluate', func() { // {{{
			expect('1 + 2'.evaluate()).to.equal(3)
			
			expect('{"name":"White"}'.evaluate()).to.eql({
				name: 'White'
			})
			
			expect('"miss " + name'.evaluate({
				name: 'White'
			})).to.equal('miss White')
			
			expect('return {"name":"White"}'.evaluate(true)).to.eql({
				name: 'White'
			})
			
			expect('return "miss " + name'.evaluate({
				name: 'White'
			})).to.equal('miss White')
		}) // }}}
		
		it('extract w/global', func() { // {{{
			expect('miss white'.extract(/\w+/g)).to.eql(['miss', 'white'])
		}) // }}}
		
		it('extract wo/global', func() { // {{{
			expect('miss white'.extract(/\w+/)).to.eql('miss')
		}) // }}}
		
		it('extract :alt', func() { // {{{
			expect('miss white'.extract(/e([^e]*)/g, 1)).to.eql([''])
			
			expect('miss white'.extract(/e([^e]*)/, 1)).to.eql('')
		}) // }}}
		
		it('humanize', func() { // {{{
			expect('missWhite'.humanize()).to.equal('miss White')
			expect('miss white'.humanize()).to.equal('miss white')
			expect('miss_white'.humanize()).to.equal('miss white')
			expect('miss-white'.humanize()).to.equal('miss white')
		}) // }}}
		
		it('indexOfRegex :default', func() { // {{{
			expect('miss white'.indexOfRegex(/\s\w+/g)).to.equal(4)
		}) // }}}
		
		it('indexOfRegex :nf', func() { // {{{
			expect('miss white'.indexOfRegex(/MISS/g)).to.equal(-1)
		}) // }}}
		
		it('isBoolean', func() { // {{{
			expect('miss White'.isBoolean()).to.be.false
			
			expect('true'.isBoolean()).to.be.true
			expect('false'.isBoolean()).to.be.true
			expect('yes'.isBoolean()).to.be.true
			expect('no'.isBoolean()).to.be.true
			expect('1'.isBoolean()).to.be.true
			expect('0'.isBoolean()).to.be.true
			expect('on'.isBoolean()).to.be.true
			expect('off'.isBoolean()).to.be.true
		}) // }}}
		
		it('left', func() { // {{{
			expect('miss White'.left(4)).to.equal('miss')
			expect('miss White'.left(-5)).to.equal('miss ')
		}) // }}}
		
		it('lines', func() { // {{{
			expect('miss\nwhite'.lines()).to.eql(['miss', 'white'])
			
			expect('miss\n\n\nwhite'.lines()).to.eql(['miss', 'white'])
			
			expect('miss\n\n\nwhite'.lines(true)).to.eql(['miss', '', '', 'white'])
			
			expect(''.lines()).to.eql([])
		}) // }}}
		
		it('lowerFirst', func() { // {{{
			expect('Miss White'.lowerFirst()).to.equal('miss White')
		}) // }}}
		
		it('lpad', func() { // {{{
			expect('miss'.lpad(6)).to.equal('  miss')
			
			expect('10'.lpad(3, '0')).to.equal('010')
		}) // }}}
		
		it('ltrim', func() { // {{{
			expect('  miss'.ltrim()).to.equal('miss')
		}) // }}}
		
		it('matchPair :default', func() { // {{{
			expect('--((hello)(world))--'.matchPair('(', ')')).to.eql({
				before: '--',
				body: '(hello)(world)',
				after: '--',
				begin: 2,
				end: 17
			})
		}) // }}}
		
		it('matchPair :nf', func() { // {{{
			expect('--'.matchPair('(', ')')).to.be.false
		}) // }}}
		
		it('prepend wo/separator wo/null', func() { // {{{
			expect('foo'.prepend('bar')).to.equal('barfoo')
		}) // }}}
		
		it('prepend wo/separator w/null', func() { // {{{
			expect('foo'.prepend(null)).to.equal('foo')
		}) // }}}
		
		it('prepend w/separator wo/null', func() { // {{{
			expect('foo'.prepend('bar', '|')).to.equal('bar|foo')
		}) // }}}
		
		it('prepend w/separator w/null', func() { // {{{
			expect('foo'.prepend(null, '|')).to.equal('foo')
		}) // }}}
		
		it('prepend empty', func() { // {{{
			expect(''.prepend('bar')).to.equal('bar')
		}) // }}}
		
		it('quote :default', func() { // {{{
			expect('It\'s miss White'.quote()).to.equal('"It\'s miss White"')
		}) // }}}
		
		it('quote :single', func() { // {{{
			expect('It\'s miss White'.quote("'")).to.equal('\'It\'s miss White\'')
		}) // }}}
		
		it('quote :single,escape', func() { // {{{
			expect('It\'s miss White'.quote("'", '\\')).to.equal('\'It\\\'s miss White\'')
		}) // }}}
		
		it('quote :already', func() { // {{{
			expect('"It\'s miss White"'.quote()).to.equal('"It\'s miss White"')
		}) // }}}
		
		it('rdrop :default', func() { // {{{
			expect('miss White'.rdrop()).to.equal('miss Whit')
		}) // }}}
		
		it('rdrop :5', func() { // {{{
			expect('miss White'.rdrop(5)).to.equal('miss ')
		}) // }}}
		
		it('repeat', func() { // {{{
			expect('miss'.repeat(3)).to.equal('missmissmiss')
		}) // }}}
		
		it('replaceAll :default', func() { // {{{
			expect('miss White'.replaceAll('i', 'o')).to.equal('moss Whote')
		}) // }}}
		
		it('replaceAll :empty', func() { // {{{
			expect('miss White'.replaceAll('', '')).to.equal('miss White')
		}) // }}}
		
		it('replaceAll :long', func() { // {{{
			expect('miss White'.replaceAll('miss', 'mister')).to.equal('mister White')
		}) // }}}
		
		it('right', func() { // {{{
			expect('miss White'.right(5)).to.equal('White')
			expect('miss White'.right(-4)).to.equal(' White')
		}) // }}}
		
		it('rpad', func() { // {{{
			expect('miss'.rpad(6)).to.equal('miss  ')
			
			expect('10'.rpad(3, '0')).to.equal('100')
		}) // }}}
		
		it('rtake :default', func() { // {{{
			expect('miss White'.rtake()).to.equal('e')
		}) // }}}
		
		it('rtake :5', func() { // {{{
			expect('miss White'.rtake(5)).to.equal('White')
		}) // }}}
		
		it('rtrim', func() { // {{{
			expect('miss  '.rtrim()).to.equal('miss')
		}) // }}}
		
		it('substitute :default', func() { // {{{
			expect('{honorific} {name}'.substitute({
				honorific: 'miss',
				name: 'White'
			})).to.equal('miss White')
		}) // }}}
		
		it('substitute :escape', func() { // {{{
			expect('\\{honorific} {name}'.substitute({
				honorific: 'miss',
				name: 'White'
			})).to.equal('{honorific} White')
		}) // }}}
		
		it('substitute :missing', func() { // {{{
			expect('{honorific} {name}'.substitute({
				name: 'White'
			})).to.equal(' White')
		}) // }}}
		
		it('startsWith', func() { // {{{
			expect('miss White'.startsWith('mi')).to.be.true
			expect('miss White'.startsWith('ma')).to.be.false
		}) // }}}
		
		it('take :default', func() { // {{{
			expect('miss White'.take()).to.equal('m')
		}) // }}}
		
		it('take :5', func() { // {{{
			expect('miss White'.take(5)).to.equal('miss ')
		}) // }}}
		
		it('test', func() { // {{{
			expect('miss White'.test('\\w+')).to.be.true
			expect('miss White'.test('0-9+')).to.be.false
			
			expect('miss White'.test(/\w+/)).to.be.true
			expect('miss White'.test(/0-9+/)).to.be.false
		}) // }}}
		
		it('toBoolean', func() { // {{{
			expect('miss White'.toBoolean()).to.be.false
			
			expect('true'.toBoolean()).to.be.true
			expect('yes'.toBoolean()).to.be.true
			expect('1'.toBoolean()).to.be.true
			expect('on'.toBoolean()).to.be.true
		}) // }}}
		
		it('toFloat', func() { // {{{
			expect('3.14'.toFloat()).to.equal(3.14)
		}) // }}}
		
		it('toInt', func() { // {{{
			expect('3.14'.toInt()).to.equal(3)
			
			expect('16'.toInt(16)).to.equal(22)
		}) // }}}
		
		it('trim', func() { // {{{
			expect('  miss  '.trim()).to.equal('miss')
		}) // }}}
		
		it('underscorify', func() { // {{{
			expect('missWhite'.underscorify()).to.equal('miss_white')
			expect('miss white'.underscorify()).to.equal('miss_white')
			expect('miss_white'.underscorify()).to.equal('miss_white')
			expect('miss-white'.underscorify()).to.equal('miss_white')
		}) // }}}
		
		it('upperFirst', func() { // {{{
			expect('miss White'.upperFirst()).to.equal('Miss White')
		}) // }}}
		
		it('unquote :double', func() { // {{{
			expect('"miss White"'.unquote()).to.equal('miss White')
		}) // }}}
		
		it('unquote :single', func() { // {{{
			expect('\'miss White\''.unquote()).to.equal('miss White')
		}) // }}}
		
		it('unquote :escape', func() { // {{{
			expect('"miss \\"White\\""'.unquote(null, '\\')).to.equal('miss "White"')
		}) // }}}
		
		it('unquote :missing', func() { // {{{
			expect('miss White'.unquote()).to.equal('miss White')
		}) // }}}
		
		it('unquote :hash', func() { // {{{
			expect('#miss # White#'.unquote('#')).to.equal('miss # White')
		}) // }}}
	})
	
	describe('class', func() {
		it('quote', func() { // {{{
			expect(String.quote('It\'s miss White')).to.equal('"It\'s miss White"')
		}) // }}}
		
		it('unquote', func() { // {{{
			expect(String.unquote('"miss White"')).to.equal('miss White')
		}) // }}}
	})
})