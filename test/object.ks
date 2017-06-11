#![bin]

extern {
	describe:	func
	it:			func
}

import {
	expect 		from 'chai'
	*			from '../index.ks'
}

describe('object', func() {
	it('append :default', func() { // {{{
		expect(Object.append({
			name: 'White'
		}, {
			honorific: 'miss'
		})).to.eql({
			name: 'White',
			honorific: 'miss'
		})
		
		expect(Object.append({
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
		expect(Object.append({
			name: 'White'
		}, null, {
			honorific: 'miss'
		})).to.eql({
			name: 'White',
			honorific: 'miss'
		})
	}) // }}}
	
	it('clone :object', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		let c = Object.clone(o)
		
		expect(c == o).to.be.false
		
		expect(c).to.eql({
			name: 'White',
			honorific: 'miss'
		})
	}) // }}}
	
	it('clone :class', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			static clone(value: Person) => new Person(value._name, value._honorific)
		}
		
		let o = new Person('White', 'miss')
		
		expect(o._name).to.equal('White')
		expect(o._honorific).to.equal('miss')
		
		let c = Object.clone(o)
		
		expect(c == o).to.be.false
		
		expect(c._name).to.equal('White')
		expect(c._honorific).to.equal('miss')
	}) // }}}
	
	it('clone :instance', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			clone() => new Person(this._name, this._honorific)
		}
		
		let o = new Person('White', 'miss')
		
		let c = Object.clone(o)
		
		expect(c == o).to.be.false
		
		expect(JSON.stringify(c)).to.equal(JSON.stringify({
			_name: 'White',
			_honorific: 'miss'
		}))
	}) // }}}
	
	it('copy', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss',
			location: {
				name: 'forest'
			}
		}
		
		let d = Object.copy(o)
		
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
		
		let d = Object.defaults(o, {
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
		Object.each(o, func(value, key) {
			s.push(key + ': ' + value)
		})
		
		expect(s).to.eql(['name: White', 'honorific: miss'])
	}) // }}}
	
	it('equals :default', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.equals(o, {
			name: 'White',
			honorific: 'miss'
		})).to.be.true
		
		expect(Object.equals(o, {
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
		
		expect(Object.equals(o, o)).to.be.true
	}) // }}}
	
	it('equals :null', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.equals(o, null)).to.be.false
	}) // }}}
	
	it('equals :!constructor', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.equals(o, 'Hello')).to.be.false
	}) // }}}
	
	it('equals :class', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			static equals(itemA, itemB) => itemA._name == itemB._name && itemA._honorific == itemB._honorific
		}
		
		expect(Object.equals(new Person('White', 'miss'), new Person('White', 'miss'))).to.be.true
	}) // }}}
	
	it('equals :instance', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			equals(item) => this._name == item._name && this._honorific == item._honorific
		}
		
		expect(Object.equals(new Person('White', 'miss'), new Person('White', 'miss'))).to.be.true
	}) // }}}
	
	it('equals :member w/ownProperty', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			print() => this._honorific + ' ' + this._name
		}
		
		expect(Object.equals(new Person('White', 'miss'), new Person('White', 'miss'))).to.be.true
	}) // }}}
	
	it('equals :member wo/ownProperty', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(name, honorific = null) {
				this._name = name
				this._honorific = honorific if honorific != null
			}
		}
		
		expect(Object.equals(new Person('White', 'miss'), new Person('White'))).to.be.false
	}) // }}}
	
	it('equals :member:ne', func() { // {{{
		class Person {
			private {
				_honorific: String
				_name: String
			}
			constructor(@name, @honorific)
			print() => this._honorific + ' ' + this._name
		}
		
		expect(Object.equals(new Person('White', 'miss'), new Person('White', 'mister'))).to.be.false
	}) // }}}
	
	it('every', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.every(o, func(value, key) {
			return key == 'name' || key == 'honorific'
		})).to.be.true
			
		expect(Object.every(o, func(value, key) {
			return key == 'name'
		})).to.be.false
	}) // }}}
	
	it('filter', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.filter(o, func(value, key) {
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
		
		expect(Object.hasKey(o, 'name')).to.be.true
		expect(Object.hasKey(o, 'nami')).to.be.false
	}) // }}}
	
	it('hasValue', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.hasValue(o, 'White')).to.be.true
		expect(Object.hasValue(o, 'Black')).to.be.false
	}) // }}}
	
	it('isEmpty', func() { // {{{
		expect(Object.isEmpty({})).to.be.true
		
		expect(Object.isEmpty({
			name: 'White'
		})).to.be.false
	}) // }}}
	
	it('keyAt', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.keyAt(o, 0)).to.equal('name')
		
		expect(Object.keyAt(o, 1)).to.equal('honorific')
		
		expect(Object.keyAt(o, 2)).to.equal(null)
	}) // }}}
	
	it('keyOf', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.keyOf(o, 'miss')).to.equal('honorific')
		
		expect(Object.keyOf(o, 'mister')).to.equal(null)
	}) // }}}
	
	it('keys', func() { // {{{
		expect(Object.keys({
			name: 'White',
			honorific: 'miss'
		})).to.eql(['name', 'honorific'])
	}) // }}}
	
	it('map', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.map(o, func(value) {
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
		
		let d = Object.merge(o, {
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
		
		let d = Object.merge(o, {
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
		
		let d = Object.merge(o, {
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
		
		let d = Object.merge(o, {
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
		
		let d = Object.merge(null, o, {
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
		expect(Object.size({
			name: 'White',
			honorific: 'miss'
		})).to.equal(2)
	}) // }}}
	
	it('some', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.some(o, func(value, key) {
			return key == 'name'
		})).to.be.true
		
		expect(Object.some(o, func(value, key) {
			return key == 'color'
		})).to.be.false
	}) // }}}
	
	it('subset', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.subset(o, ['name'])).to.eql({
			name: 'White'
		})
	}) // }}}
	
	it('toSource', func() { // {{{
		expect(Object.toSource({
			name: 'White',
			honorific: 'miss'
		})).to.equal('{"name":\'White\',"honorific":\'miss\'}')
	}) // }}}
	
	it('value', func() { // {{{
		let o = {
			name: 'White',
			honorific: 'miss'
		}
		
		expect(Object.value(o, 0)).to.equal('White')
		
		expect(Object.value(o, 1)).to.equal('miss')
		
		expect(Object.value(o, 2)).to.equal(null)
	}) // }}}
	
	it('values', func() { // {{{
		expect(Object.values({
			name: 'White',
			honorific: 'miss'
		})).to.eql(['White', 'miss'])
	}) // }}}
})