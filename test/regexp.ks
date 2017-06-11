#![bin]

extern {
	describe:	func
	it:			func
}

import {
	expect 		from 'chai'
	*			from '../index.ks'
}

describe('regexp', func() {
	it('length', func() {
		let regex := /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/i
		
		expect(regex.length()).to.equal(2)
	})
	
	it('clone wo/flag', func() {
		let o = /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/
		
		let d = RegExp.clone(o)
		
		expect(o == d).to.be.false
		expect(o.toString()).to.equal(d.toString())
	})
	
	it('clone w/flag:i', func() {
		let o = /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/i
		
		let d = RegExp.clone(o)
		
		expect(o == d).to.be.false
		expect(o.toString()).to.equal(d.toString())
	})
	
	it('clone w/flag:g', func() {
		let o = /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/g
		
		let d = RegExp.clone(o)
		
		expect(o == d).to.be.false
		expect(o.toString()).to.equal(d.toString())
	})
})