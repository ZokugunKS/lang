#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('copy', func() {
	it('null', func() { // {{{
		a = null
		b = copy(a)
		expect(a).to.equal(b)
	}) // }}}

	it('number', func() { // {{{
		a = 1
		b = copy(a)
		expect(a).to.equal(b)
	}) // }}}

	it('array', func() { // {{{
		a = [1, 2, 3]
		b = copy(a)
		expect(a).to.not.equal(b)
		expect(a).to.eql(b)
	}) // }}}

	it('dictionary', func() { // {{{
		a = {
			name: 'White'
		}
		b = copy(a)
		expect(a).to.not.equal(b)
		expect(a).to.eql(b)
	}) // }}}
})