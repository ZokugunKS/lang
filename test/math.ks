#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'../index.ks'
}

describe('math', func() {
	it('limit', func() { // {{{
		expect(Math.limit(5, 1, 10)).to.equal(5)
		expect(Math.limit(0, 1, 10)).to.equal(1)
		expect(Math.limit(20, 1, 10)).to.equal(10)
	}) // }}}
})