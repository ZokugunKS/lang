#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('clone', func() {
	it('array', func() { // {{{
		let a = [1, 2, 3]
		let b = clone(a)

		expect(a).to.not.equal(b)
		expect(a).to.eql(b)
	}) // }}}

	it('date', func() { // {{{
		const a = new Date()
		const b = clone(a)

		expect(a).to.not.equal(b)
		expect(a.getTime()).to.equal(b.getTime())
	}) // }}}

	it('dictionary', func() { // {{{
		let a = {
			name: 'White'
		}
		let b = clone(a)

		expect(a).to.not.equal(b)
		expect(a).to.eql(b)
	}) // }}}

	it('object :default', func() { // {{{
		class Person {
			private lateinit {
				_honorific: String
				_name: String
			}
			constructor()
			constructor(@name, @honorific)
		}

		let a = new Person('White', 'miss')

		let b = clone(a)

		expect(a).to.not.equal(b)

		expect(b._name).to.equal('White')
		expect(b._honorific).to.equal('miss')
	}) // }}}

	it('object :class', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			static clone(value: Person) => new Person(value._name, value._honorific)
		}

		let a = new Person('White', 'miss')

		expect(a._name).to.equal('White')
		expect(a._honorific).to.equal('miss')

		let b = clone(a)

		expect(a).to.not.equal(b)

		expect(b._name).to.equal('White')
		expect(b._honorific).to.equal('miss')
	}) // }}}

	it('object :instance', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			clone() => new Person(this._name, this._honorific)
		}

		let a = new Person('White', 'miss')

		let b = clone(a)

		expect(a).to.not.equal(b)

		expect(b._name).to.equal('White')
		expect(b._honorific).to.equal('miss')
	}) // }}}

	it('regexp wo/flag', func() {
		let a = /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/

		let b = RegExp.clone(a)

		expect(a).to.not.equal(b)
		expect(a.toString()).to.equal(b.toString())
	})

	it('regexp w/flag:i', func() {
		let a = /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/i

		let b = RegExp.clone(a)

		expect(a).to.not.equal(b)
		expect(a.toString()).to.equal(b.toString())
	})

	it('regexp w/flag:g', func() {
		let a = /<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)/g

		let b = RegExp.clone(a)

		expect(a).to.not.equal(b)
		expect(a.toString()).to.equal(b.toString())
	})

	it('null', func() { // {{{
		let a = null
		let b = clone(a)

		expect(a).to.equal(b)
	}) // }}}
})