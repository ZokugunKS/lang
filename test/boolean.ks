#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('boolean', func() {
	it('should do toBoolean', func() { // {{{
		expect(new Boolean(true).toBoolean()).to.equal(true)
		expect(new Boolean(false).toBoolean()).to.equal(false)
	}) // }}}
})