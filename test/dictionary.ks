#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'			for expect
	'..'
}

describe('dictionary', func() {
	it('append :default', func() { // {{{
		expect(Dictionary.append({
			name: 'White'
		}, {
			honorific: 'miss'
		})).to.eql({
			name: 'White',
			honorific: 'miss'
		})

		expect(Dictionary.append({
			name: 'White'
		}, {
			honorific: 'mister'
		}, {
			honorific: 'miss'
		})).to.eql({
			name: 'White',
			honorific: 'miss'
		})
	}) // }}}

	it('append w/null', func() { // {{{
		expect(Dictionary.append({
			name: 'White'
		}, null, {
			honorific: 'miss'
		})).to.eql({
			name: 'White',
			honorific: 'miss'
		})
	}) // }}}

	it('copy', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss',
			location: {
				name: 'forest'
			}
		}

		let d = Dictionary.copy(o)

		expect(o == d).to.be.false

		expect(d).to.eql({
			name: 'White',
			honorific: 'miss',
			location: {
				name: 'forest'
			}
		})

		expect(o.forest == d.forest).to.be.true
	}) // }}}

	it('defaults', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		let d = Dictionary.defaults(o, {
			color: 'yellow'
		})

		expect(o).to.eql({
			name: 'White',
			honorific: 'miss'
		})

		expect(d).to.eql({
			name: 'White',
			honorific: 'miss',
			color: 'yellow'
		})
	}) // }}}

	it('each', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		let s = []
		Dictionary.each(o, func(value, key) {
			s.push(key + ': ' + value)
		})

		expect(s).to.eql(['name: White', 'honorific: miss'])
	}) // }}}

	it('equals :default', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.equals(o, {
			name: 'White',
			honorific: 'miss'
		})).to.be.true

		expect(Dictionary.equals(o, {
			name: 'White',
			honorific: 'miss',
			color: 'yellow'
		})).to.be.false
	}) // }}}

	it('equals :id', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.equals(o, o)).to.be.true
	}) // }}}

	it('equals :null', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.equals(o, null)).to.be.false
	}) // }}}

	it('every', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.every(o, func(value, key) {
			return key == 'name' || key == 'honorific'
		})).to.be.true

		expect(Dictionary.every(o, func(value, key) {
			return key == 'name'
		})).to.be.false
	}) // }}}

	it('filter', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.filter(o, func(value, key) {
			return key == 'name'
		})).to.eql({
			name: 'White'
		})
	}) // }}}

	it('hasKey', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.hasKey(o, 'name')).to.be.true
		expect(Dictionary.hasKey(o, 'nami')).to.be.false
	}) // }}}

	it('hasValue', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.hasValue(o, 'White')).to.be.true
		expect(Dictionary.hasValue(o, 'Black')).to.be.false
	}) // }}}

	it('isEmpty', func() { // {{{
		expect(Dictionary.isEmpty({})).to.be.true

		expect(Dictionary.isEmpty({
			name: 'White'
		})).to.be.false
	}) // }}}

	it('keyAt', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.keyAt(o, 0)).to.equal('name')

		expect(Dictionary.keyAt(o, 1)).to.equal('honorific')

		expect(Dictionary.keyAt(o, 2)).to.equal(null)
	}) // }}}

	it('keyOf', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.keyOf(o, 'miss')).to.equal('honorific')

		expect(Dictionary.keyOf(o, 'mister')).to.equal(null)
	}) // }}}

	it('keys', func() { // {{{
		expect(Dictionary.keys({
			name: 'White',
			honorific: 'miss'
		})).to.eql(['name', 'honorific'])
	}) // }}}

	it('map', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.map(o, func(value) {
			return value.toUpperCase()
		})).to.eql({
			name: 'WHITE',
			honorific: 'MISS'
		})
	}) // }}}

	it('merge :default', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		let d = Dictionary.merge(o, {
			color: 'yellow'
		})

		expect(o == d).to.be.true

		expect(o).to.eql({
			name: 'White',
			honorific: 'miss',
			color: 'yellow'
		})
	}) // }}}

	it('merge :array', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		let d = Dictionary.merge(o, {
			colors: ['yellow', 'blue']
		})

		expect(o == d).to.be.true

		expect(o).to.eql({
			name: 'White',
			honorific: 'miss',
			colors: ['yellow', 'blue']
		})
	}) // }}}

	it('merge :object wo/overwrite', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		let d = Dictionary.merge(o, {
			location: {
				name: 'forest'
			}
		})

		expect(o == d).to.be.true

		expect(o).to.eql({
			name: 'White',
			honorific: 'miss',
			location: {
				name: 'forest'
			}
		})
	}) // }}}

	it('merge :object w/overwrite', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss',
			location: {
				name: 'castle',
				foo: 'bar'
			}
		}

		let d = Dictionary.merge(o, {
			location: {
				name: 'forest',
				hello: 'world'
			}
		})

		expect(o == d).to.be.true

		expect(o).to.eql({
			name: 'White',
			honorific: 'miss',
			location: {
				name: 'forest',
				foo: 'bar',
				hello: 'world'
			}
		})
	}) // }}}

	it('merge :skip-null', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		let d = Dictionary.merge(null, o, {
			colors: ['yellow', 'blue']
		}, {
			location: {
				name: 'forest'
			}
		})

		expect(o == d).to.be.true

		expect(o).to.eql({
			name: 'White',
			honorific: 'miss',
			colors: ['yellow', 'blue'],
			location: {
				name: 'forest'
			}
		})
	}) // }}}

	it('size', func() { // {{{
		expect(Dictionary.size({
			name: 'White',
			honorific: 'miss'
		})).to.equal(2)
	}) // }}}

	it('some', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.some(o, func(value, key) {
			return key == 'name'
		})).to.be.true

		expect(Dictionary.some(o, func(value, key) {
			return key == 'color'
		})).to.be.false
	}) // }}}

	it('subset', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.subset(o, ['name'])).to.eql({
			name: 'White'
		})
	}) // }}}

	it('toSource', func() { // {{{
		expect(Dictionary.toSource({
			name: 'White',
			honorific: 'miss'
		})).to.equal('{"name":\'White\',"honorific":\'miss\'}')
	}) // }}}

	it('value', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}

		expect(Dictionary.value(o, 0)).to.equal('White')

		expect(Dictionary.value(o, 1)).to.equal('miss')

		expect(Dictionary.value(o, 2)).to.equal(null)
	}) // }}}

	it('values', func() { // {{{
		expect(Dictionary.values({
			name: 'White',
			honorific: 'miss'
		})).to.eql(['White', 'miss'])
	}) // }}}
})