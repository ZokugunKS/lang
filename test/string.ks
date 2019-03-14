#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('string', func() {
	describe('instance', func() {
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

		it('camelize', func() { // {{{
			expect('miss white'.camelize()).to.equal('missWhite')
			expect('miss_white'.camelize()).to.equal('missWhite')
			expect('-miss-white'.camelize()).to.equal('MissWhite')
		}) // }}}

		it('capitalize', func() { // {{{
			expect('miss White'.capitalize()).to.equal('Miss white')
		}) // }}}

		it('capitalizeLike', func() { // {{{
			expect('he'.capitalizeLike('she')).to.equal('he')
			expect('he'.capitalizeLike('She')).to.equal('He')
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

			const str = 'To be, or not to be, that is the question.'

			expect(str.endsWith('question.')).to.be.true
			expect(str.endsWith('to be')).to.be.false
			expect(str.endsWith('to be', 19)).to.be.true
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

		it('includes', func() { // {{{
			const str = 'To be, or not to be, that is the question.'

			expect(str.includes('To be')).to.be.true
			expect(str.includes('question')).to.be.true
			expect(str.includes('nonexistent')).to.be.false
			expect(str.includes('To be', 1)).to.be.false
			expect(str.includes('TO BE')).to.be.false
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

		it('padEnd', func() { // {{{
			expect('miss'.padEnd(6)).to.equal('miss  ')

			expect('10'.padEnd(3, '0')).to.equal('100')
		}) // }}}

		it('padStart', func() { // {{{
			expect('miss'.padStart(6)).to.equal('  miss')

			expect('10'.padStart(3, '0')).to.equal('010')
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

		it('rtake :default', func() { // {{{
			expect('miss White'.rtake()).to.equal('e')
		}) // }}}

		it('rtake :5', func() { // {{{
			expect('miss White'.rtake(5)).to.equal('White')
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

		it('substringAfter w/string:default', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(' ')).to.equal('are you doing miss White?')
		}) // }}}

		it('substringAfter w/string:true', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(' ', true)).to.equal('White?')
		}) // }}}

		it('substringAfter w/string:3', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(' ', 3)).to.equal('doing miss White?')
		}) // }}}

		it('substringAfter w/string:-2', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(' ', -2)).to.equal('miss White?')
		}) // }}}

		it('substringAfter w/string:break', func() { // {{{
			expect('miss White?'.substringAfter(' ', -3)).to.equal('')
		}) // }}}

		it('substringAfter w/string:10', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(' ', 10)).to.equal('')
		}) // }}}

		it('substringAfter w/regex:default', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(/\s+/)).to.equal('are you doing miss White?')
		}) // }}}

		it('substringAfter w/regex:true', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(/\s+/, true)).to.equal('White?')
		}) // }}}

		it('substringAfter w/regex:3', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(/\s+/, 3)).to.equal('doing miss White?')
		}) // }}}

		it('substringAfter w/regex:-2', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(/\s+/, -2)).to.equal('miss White?')
		}) // }}}

		it('substringAfter w/regex:10', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(/\s+/, 10)).to.equal('')
		}) // }}}

		it('substringAfter w/regex:g', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(/\s+/g, 3)).to.equal('doing miss White?')
		}) // }}}

		it('substringAfter w/regex:im', func() { // {{{
			expect('How are you doing miss White?'.substringAfter(/\s+/im, 3)).to.equal('doing miss White?')
		}) // }}}

		it('substringBefore w/string:default', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(' ')).to.equal('How')
		}) // }}}

		it('substringBefore w/string:true', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(' ', true)).to.equal('How are you doing miss')
		}) // }}}

		it('substringBefore w/string:3', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(' ', 3)).to.equal('How are you')
		}) // }}}

		it('substringBefore w/string:-2', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(' ', -2)).to.equal('How are you doing')
		}) // }}}

		it('substringBefore w/string:break', func() { // {{{
			expect('miss White?'.substringBefore(' ', -3)).to.equal('')
		}) // }}}

		it('substringBefore w/string:10', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(' ', 10)).to.equal('')
		}) // }}}

		it('substringBefore w/regex:default', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(/\s+/)).to.equal('How')
		}) // }}}

		it('substringBefore w/regex:true', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(/\s+/, true)).to.equal('How are you doing miss')
		}) // }}}

		it('substringBefore w/regex:3', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(/\s+/, 3)).to.equal('How are you')
		}) // }}}

		it('substringBefore w/regex:-2', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(/\s+/, -2)).to.equal('How are you doing')
		}) // }}}

		it('substringBefore w/regex:10', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(/\s+/, 10)).to.equal('')
		}) // }}}

		it('substringBefore w/regex:g', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(/\s+/g, 3)).to.equal('How are you')
		}) // }}}

		it('substringBefore w/regex:im', func() { // {{{
			expect('How are you doing miss White?'.substringBefore(/\s+/im, 3)).to.equal('How are you')
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

		it('toFirstLowerCase', func() { // {{{
			expect('Miss White'.toFirstLowerCase()).to.equal('miss White')
		}) // }}}

		it('toFirstUpperCase', func() { // {{{
			expect('miss White'.toFirstUpperCase()).to.equal('Miss White')
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

		it('trimEnd', func() { // {{{
			expect('miss  '.trimEnd()).to.equal('miss')
		}) // }}}

		it('trimStart', func() { // {{{
			expect('  miss'.trimStart()).to.equal('miss')
		}) // }}}

		it('underscorify', func() { // {{{
			expect('missWhite'.underscorify()).to.equal('miss_white')
			expect('miss white'.underscorify()).to.equal('miss_white')
			expect('miss_white'.underscorify()).to.equal('miss_white')
			expect('miss-white'.underscorify()).to.equal('miss_white')
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