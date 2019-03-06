#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('number', func() {
	describe('instance', func() {
		it('between', func() { // {{{
			let d: Number = 1
			expect(d.between(0, 2)).to.be.true

			d = -1
			expect(d.between(0, 2)).to.be.false
		}) // }}}

		it('beyond', func() { // {{{
			let d: Number = 1
			expect(d.beyond(0, 2)).to.be.false

			d = -1
			expect(d.beyond(0, 2)).to.be.true
		}) // }}}

		it('ceil', func() { // {{{
			let d: Number = 3.1415926535
			expect(d.ceil(0)).to.be.equal(4)
			expect(d.ceil(2)).to.be.equal(3.15)

			expect(Math.PI.ceil(0)).to.be.equal(4)
			expect(Math.PI.ceil(2)).to.be.equal(3.15)

			expect(Math.E.ceil(0)).to.be.equal(3)
			expect(Math.E.ceil(2)).to.be.equal(2.72)
		}) // }}}

		it('floor', func() { // {{{
			expect(Math.PI.floor(0)).to.be.equal(3)
			expect(Math.PI.floor(2)).to.be.equal(3.14)

			expect(Math.E.floor(0)).to.be.equal(2)
			expect(Math.E.floor(2)).to.be.equal(2.71)
		}) // }}}

		it('limit', func() { // {{{
			let d: Number = 1
			expect(d.limit(0, 2)).to.be.equal(1)
			d = -1
			expect(d.limit(0, 2)).to.be.equal(0)
			d = 5
			expect(d.limit(0, 2)).to.be.equal(2)
			d = NaN
			expect(d.limit(0, 2)).to.be.equal(0)
		}) // }}}

		it('mod', func() { // {{{
			let d: Number = 1
			expect(d.mod(2)).to.be.equal(1)
			d = -1
			expect(d.mod(2)).to.be.equal(1)
			d = 5
			expect(d.mod(2)).to.be.equal(1)
			d = NaN
			expect(d.mod(2)).to.be.equal(0)
			d = 0
			expect(d.mod(2)).to.be.equal(0)
			d = 8
			expect(d.mod(2)).to.be.equal(0)
		}) // }}}

		it('round', func() { // {{{
			expect(Math.PI.round(0)).to.be.equal(3)
			expect(Math.PI.round(2)).to.be.equal(3.14)

			expect(Math.E.round(0)).to.be.equal(3)
			expect(Math.E.round(2)).to.be.equal(2.72)
		}) // }}}

		it('repeat', func() { // {{{
			let sum = 0
			let d: Number = 4
			d.repeat(func(i) {
				sum += i
			})

			expect(sum).to.equal(6)
		}) // }}}

		it('toFloat', func() { // {{{
			let d: Number = 1
			expect(d.toFloat()).to.be.equal(1.0)
			d = Math.PI
			expect(d.toFloat()).to.be.equal(Math.PI)
		}) // }}}

		it('toInt', func() { // {{{
			let d: Number = 1
			expect(d.toInt()).to.be.equal(1)
			d = Math.PI
			expect(d.toInt()).to.be.equal(3)

			d = 16
			expect(d.toInt(16)).to.be.equal(22)
		}) // }}}

		it('zeroPad', func() { // {{{
			expect(1.zeroPad(3)).to.equal('001')

			expect(1.zeroPad(3, true)).to.equal('100')
		}) // }}}
	})

	describe('class', func() {
		it('random', func() { // {{{
			expect(Number.random()).to.be.gte(0).and.lte(1)

			expect(Number.random(10, 12.5)).to.be.gte(10).and.lte(12.5)
		}) // }}}

		it('randomInt', func() { // {{{
			expect(Number.randomInt(10, 100)).to.be.gte(10).and.lte(100)
		}) // }}}
	})
})