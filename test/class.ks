#![bin]
#![error(ignore(Error))]

extern {
	sealed class Error

	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('class', func() {
	it('basics', func() { // {{{
		class Greetings {
			public message: String
			constructor(message) {
				this.message = message
			}
			greet(name) {
				return this.message + '\nIt\'s nice to meet you, ' + name + '.'
			}
		}

		let hello = new Greetings('Hello world!')

		expect(hello.greet('miss White')).to.equal('Hello world!\nIt\'s nice to meet you, miss White.')
	}) // }}}

	it('subtyping', func() { // {{{
		class Shape {
			private {
				color: String
			}
			constructor(@color)
			draw() {
				throw new Error('Not Implemented')
			}
		}

		class Rectangle extends Shape {
			constructor(color) {
				super(color)
			}
			draw() {
				return 'I\'m drawing a ' + this.color + ' rectangle.'
			}
		}

		let r = new Rectangle('black')

		expect(r.draw()).to.equal('I\'m drawing a black rectangle.')
	}) // }}}

	it('subtyping :nocreate', func() { // {{{
		class Shape {
			private {
				color: String
			}
			constructor(@color)
			draw() {
				throw new Error('Not Implemented')
			}
		}

		class Rectangle extends Shape {
			draw() {
				return 'I\'m drawing a ' + this.color + ' rectangle.'
			}
		}

		let r = new Rectangle('black')

		expect(r.draw()).to.equal('I\'m drawing a black rectangle.')
	}) // }}}

	it('static', func() { // {{{
		class Shape {
			public {
				type
				color
			}
			static {
				makeRectangle(color) => new Shape('rectangle', color)
			}
			constructor(type, color) {
				this.type = type
				this.color = color
			}
		}

		let r = Shape.makeRectangle('black')

		expect(r.type).to.equal('rectangle')
		expect(r.color).to.equal('black')
	}) // }}}
})