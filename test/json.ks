#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('json', func() {
	it('stringifySafely :default', func() { // {{{
		let o = {
			name: 'White'
		}
		o.root = o

		expect(JSON.stringifySafely(o)).to.equal('{"name":"White","root":"[Circular ~]"}')
	}) // }}}

	it('stringifySafely :null', func() { // {{{
		let o = {
			name: null
		}
		o.root = o

		expect(JSON.stringifySafely(o)).to.equal('{"name":null,"root":"[Circular ~]"}')
	}) // }}}

	it('stringifySafely :children', func() { // {{{
		let o = {
			name: 'White',
			children: [
				{
					name: 'John'
				},
				{
					name: 'Jane'
				}
			]
		}
		o.children[0].parent = o
		o.children[0].sister = o.children[1]
		o.children[1].parent = o
		o.children[1].brother = o.children[0]

		expect(JSON.stringifySafely(o)).to.equal('{"name":"White","children":[{"name":"John","parent":"[Circular ~]","sister":{"name":"Jane","parent":"[Circular ~]","brother":"[Circular ~.children.0]"}},"[Circular ~.children.0.sister]"]}')
	}) // }}}

	it('stringifySafely :replacer:default', func() { // {{{
		let o = {
			name: 'White'
		}
		o.root = o

		expect(JSON.stringifySafely(o, func(key, value) {
			return value is String ? value.toLowerCase() : value
		})).to.equal('{"name":"white","root":"[circular ~]"}')
	}) // }}}

	it('stringifySafely :replacer:null', func() { // {{{
		let o = {
			name: null
		}
		o.root = o

		expect(JSON.stringifySafely(o, func(key, value) {
			return value is String ? value.toLowerCase() : value
		})).to.equal('{"name":null,"root":"[circular ~]"}')
	}) // }}}

	it('stringifySafely :object:default', func() { // {{{
		class Person {
			private {
				@honorific: String
				@name: String
			}
			constructor(@name, @honorific)
			print() => `\(@honorific) \(@name)`
		}

		const w = new Person('White', 'miss')

		expect(JSON.stringifySafely(w)).to.equal('{"_name":"White","_honorific":"miss"}')
	}) // }}}

	it('stringifySafely :object:cycle', func() { // {{{
		class Person {
			private {
				@honorific: String
				@name: String
				@spouse: Person?
			}
			constructor(@name, @honorific)
			print() => `\(@honorific) \(@name)`
			spouse() => @spouse
			spouse(@spouse) => this
		}

		const w = new Person('White', 'madam')
		const d = new Person('Doe', 'mister')

		w.spouse(d)
		d.spouse(w)

		expect(JSON.stringifySafely([w, d])).to.equal('[{"_name":"White","_honorific":"madam","_spouse":{"_name":"Doe","_honorific":"mister","_spouse":"[Circular ~.0]"}},"[Circular ~.0._spouse]"]')
	}) // }}}
})