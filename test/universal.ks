#![bin]

extern {
	describe:	func
	it:			func
}

import {
	expect 		from 'chai'
	*			from '../index.ks'
}
describe('universal', func() {
	it('clone', func() { // {{{
		let a1 = [1, 2, 3]
		let a2 = clone(a1)
		expect(a1 == a2).to.be.false
		expect(a1).to.eql(a2)
		
		let o1 = {
			name: 'White'
		}
		let o2 = clone(o1)
		expect(o1 == o2).to.be.false
		expect(o1).to.eql(o2)
		
		expect(clone(null)).to.equal(null)
	}) // }}}
	
	it('copy', func() { // {{{
		a = null
		b = copy(a)
		expect(a == b).to.be.true
		
		a = 1
		b = copy(a)
		expect(a == b).to.be.true
		
		a = [1, 2, 3]
		b = copy(a)
		expect(a == b).to.be.false
		expect(a).to.eql(b)
		
		a = {
			name: 'White'
		}
		b = copy(a)
		expect(a == b).to.be.false
		expect(a).to.eql(b)
	}) // }}}
	
	it('equals', func() { // {{{
		// true
		expect(equals([1, 2, 3], [1, 2, 3])).to.be.true
		expect(equals({
			name: 'White'
		}, {
			name: 'White'
		})).to.be.true
		
		// false
		expect(equals([1, 2, 3], [1, 2, 3, 4])).to.be.false
		expect(equals({
			name: 'White'
		}, {
			name: 'White',
			honorific: 'miss'
		})).to.be.false
		expect(equals(1, 2)).to.be.false
	}) // }}}
	
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