#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('regexp', func() {
	it('length', func() {
		let regex := /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/i

		expect(regex.length()).to.equal(2)
	})
})