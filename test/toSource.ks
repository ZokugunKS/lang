#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('toSource', func() {
	it('toSource', func() { // {{{
		expect(toSource([])).to.equal('[]')
		expect(toSource([1, 2, 3])).to.equal('[1,2,3]')
		expect(toSource(null)).to.equal('null')
		expect(toSource(false)).to.equal('false')
		expect(toSource(true)).to.equal('true')
		expect(toSource('')).to.equal('\'\'')
		expect(toSource('hello world')).to.equal('\'hello world\'')
		expect(toSource(42)).to.equal('42')
		expect(toSource('42')).to.equal('\'42\'')
		expect(toSource({})).to.equal('{}')
		expect(toSource({
			hello: 'world'
		})).to.equal('{"hello":\'world\'}')

		expect(toSource('http://www.zokugun.org')).to.equal('\'http://www.zokugun.org\'')
	}) // }}}
})