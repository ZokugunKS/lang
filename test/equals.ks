#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('equals', func() {
	it('array', func() { // {{{
		// true
		expect(equals([1, 2, 3], [1, 2, 3])).to.be.true

		// false
		expect(equals([1, 2, 3], [1, 2, 3, 4])).to.be.false
	}) // }}}

	it('date', func() { // {{{
		const a = new Date()
		const b = new Date()
		const c = new Date(1995, 11, 17, 3, 24, 0)
		const d = new Date(1995, 11, 17)

		expect(equals(a, b)).to.be.true
		expect(equals(a, c)).to.be.false
		expect(equals(d, c)).to.be.false
	}) // }}}

	it('dictionary', func() { // {{{
		// true
		expect(equals({
			name: 'White'
		}, {
			name: 'White'
		})).to.be.true

		// false
		expect(equals({
			name: 'White'
		}, {
			name: 'White',
			honorific: 'miss'
		})).to.be.false
		expect(equals(1, 2)).to.be.false
	}) // }}}

	it('number', func() { // {{{
		// true

		// false
		expect(equals(1, 2)).to.be.false
	}) // }}}

	it('object :default', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
		}

		const a = new Person('White', 'miss')
		const b = new Person('White', 'mister')
		const c = new Person('Doe', 'mister')
		const d = new Person('White', 'miss')

		expect(equals(a, b)).to.be.false
		expect(equals(a, c)).to.be.false
		expect(equals(a, d)).to.be.true
	}) // }}}

	it('object :class', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			static {
				equals(a: Person, b: Person) => a._name == b._name
				equals(a?, b?) => false
			}
		}

		const a = new Person('White', 'miss')
		const b = new Person('White', 'mister')
		const c = new Person('Doe', 'mister')

		expect(equals(a, b)).to.be.true
		expect(equals(a, c)).to.be.false
	}) // }}}

	it('object :instance', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			equals(b: Person) => @name == b._name
			equals(b?) => false
		}

		const a = new Person('White', 'miss')
		const b = new Person('White', 'mister')
		const c = new Person('Doe', 'mister')

		expect(equals(a, b)).to.be.true
		expect(equals(a, c)).to.be.false
	}) // }}}

	it('regex', func() { // {{{
		const a = /foobar/ig
		const b = /foobar/ig
		const c = /foobar/g
		const d = /quxbaz/ig

		expect(equals(a, b)).to.be.true
		expect(equals(a, c)).to.be.false
		expect(equals(a, d)).to.be.false
	}) // }}}
})