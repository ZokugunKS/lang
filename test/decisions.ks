#![bin]

extern {
	describe:	func
	it:			func
	Type
}

import {
	'chai'			for expect
	'..'
}

describe('decisions', func() {
	func foo() {
	}

	class Foo {
		hello() => 'hello world'
	}

	it('isArray', func() { // {{{
		let v

		// true
		expect((v = []) is Array).to.be.true
		expect((v = [1, 2, 3]) is Array).to.be.true

		// false
		expect((v = null) is Array).to.be.false
		expect((v = false) is Array).to.be.false
		expect((v = true) is Array).to.be.false
		expect((v = '') is Array).to.be.false
		expect((v = 'hello world') is Array).to.be.false
		expect((v = 42) is Array).to.be.false
		expect((v = '42') is Array).to.be.false
		expect((v = {}) is Array).to.be.false
		expect((v = {
			hello: 'world'
		}) is Array).to.be.false
		expect((v = foo) is Array).to.be.false
		expect((v = Foo) is Array).to.be.false
		expect((v = /hello/) is Array).to.be.false
		expect((v = 'http://www.zokugun.org') is Array).to.be.false
		expect((v = new Date()) is Array).to.be.false
		expect((v = Date) is Array).to.be.false
	}) // }}}

	it('isBoolean', func() { // {{{
		let v

		// true
		expect((v = false) is Boolean).to.be.true
		expect((v = true) is Boolean).to.be.true

		// false
		expect((v = []) is Boolean).to.be.false
		expect((v = [1, 2, 3]) is Boolean).to.be.false
		expect((v = null) is Boolean).to.be.false
		expect((v = '') is Boolean).to.be.false
		expect((v = 'hello world') is Boolean).to.be.false
		expect((v = 42) is Boolean).to.be.false
		expect((v = '42') is Boolean).to.be.false
		expect((v = {}) is Boolean).to.be.false
		expect((v = {
			hello: 'world'
		}) is Boolean).to.be.false
		expect((v = foo) is Boolean).to.be.false
		expect((v = Foo) is Boolean).to.be.false
		expect((v = /hello/) is Boolean).to.be.false
		expect((v = 'http://www.zokugun.org') is Boolean).to.be.false
		expect((v = new Date()) is Boolean).to.be.false
		expect((v = Date) is Boolean).to.be.false
	}) // }}}

	it('isConstructor', func() { // {{{
		// true
		expect(Type.isConstructor(Foo)).to.be.true
		expect(Type.isConstructor(Date)).to.be.true

		// false
		expect(Type.isConstructor([])).to.be.false
		expect(Type.isConstructor([1, 2, 3])).to.be.false
		expect(Type.isConstructor(null)).to.be.false
		expect(Type.isConstructor(false)).to.be.false
		expect(Type.isConstructor(true)).to.be.false
		expect(Type.isConstructor('')).to.be.false
		expect(Type.isConstructor('hello world')).to.be.false
		expect(Type.isConstructor(42)).to.be.false
		expect(Type.isConstructor('42')).to.be.false
		expect(Type.isConstructor({})).to.be.false
		expect(Type.isConstructor({
			hello: 'world'
		})).to.be.false
		expect(Type.isConstructor(foo)).to.be.false
		expect(Type.isConstructor(/hello/)).to.be.false
		expect(Type.isConstructor('http://www.Type.org')).to.be.false
		expect(Type.isConstructor(new Date())).to.be.false
	}) // }}}

	it('isDate', func() { // {{{
		let v

		// true
		expect((v = new Date()) is Date).to.be.true

		// false
		expect((v = []) is Date).to.be.false
		expect((v = [1, 2, 3]) is Date).to.be.false
		expect((v = null) is Date).to.be.false
		expect((v = false) is Date).to.be.false
		expect((v = true) is Date).to.be.false
		expect((v = '') is Date).to.be.false
		expect((v = 'hello world') is Date).to.be.false
		expect((v = 42) is Date).to.be.false
		expect((v = '42') is Date).to.be.false
		expect((v = {}) is Date).to.be.false
		expect((v = {
			hello: 'world'
		}) is Date).to.be.false
		expect((v = foo) is Date).to.be.false
		expect((v = Foo) is Date).to.be.false
		expect((v = /hello/) is Date).to.be.false
		expect((v = 'http://www.zokugun.org') is Date).to.be.false
		expect((v = Date) is Date).to.be.false
	}) // }}}

	it('isEmptyObject', func() { // {{{
		// true
		expect(Type.isEmptyObject({})).to.be.true

		// false
		expect(Type.isEmptyObject([])).to.be.false
		expect(Type.isEmptyObject([1, 2, 3])).to.be.false
		expect(Type.isEmptyObject(null)).to.be.false
		expect(Type.isEmptyObject(false)).to.be.false
		expect(Type.isEmptyObject(true)).to.be.false
		expect(Type.isEmptyObject('')).to.be.false
		expect(Type.isEmptyObject('hello world')).to.be.false
		expect(Type.isEmptyObject(42)).to.be.false
		expect(Type.isEmptyObject('42')).to.be.false
		expect(Type.isEmptyObject({
			hello: 'world'
		})).to.be.false
		expect(Type.isEmptyObject(foo)).to.be.false
		expect(Type.isEmptyObject(Foo)).to.be.false
		expect(Type.isEmptyObject(/hello/)).to.be.false
		expect(Type.isEmptyObject('http://www.Type.org')).to.be.false
		expect(Type.isEmptyObject(new Date())).to.be.false
		expect(Type.isEmptyObject(Date)).to.be.false
	}) // }}}

	it('isFunction', func() { // {{{
		let v

		// true
		expect((v = foo) is Function).to.be.true

		// false
		expect((v = []) is Function).to.be.false
		expect((v = [1, 2, 3]) is Function).to.be.false
		expect((v = null) is Function).to.be.false
		expect((v = false) is Function).to.be.false
		expect((v = true) is Function).to.be.false
		expect((v = '') is Function).to.be.false
		expect((v = 'hello world') is Function).to.be.false
		expect((v = 42) is Function).to.be.false
		expect((v = '42') is Function).to.be.false
		expect((v = {}) is Function).to.be.false
		expect((v = {
			hello: 'world'
		}) is Function).to.be.false
		expect((v = /hello/) is Function).to.be.false
		expect((v = 'http://www.zokugun.org') is Function).to.be.false
		expect((v = new Date()) is Function).to.be.false
	}) // }}}

	it('isNumber', func() { // {{{
		let v

		// true
		expect((v = 42) is Number).to.be.true

		// false
		expect((v = []) is Number).to.be.false
		expect((v = [1, 2, 3]) is Number).to.be.false
		expect((v = null) is Number).to.be.false
		expect((v = false) is Number).to.be.false
		expect((v = true) is Number).to.be.false
		expect((v = '') is Number).to.be.false
		expect((v = 'hello world') is Number).to.be.false
		expect((v = '42') is Number).to.be.false
		expect((v = {}) is Number).to.be.false
		expect((v = {
			hello: 'world'
		}) is Number).to.be.false
		expect((v = foo) is Number).to.be.false
		expect((v = Foo) is Number).to.be.false
		expect((v = /hello/) is Number).to.be.false
		expect((v = 'http://www.zokugun.org') is Number).to.be.false
		expect((v = new Date()) is Number).to.be.false
		expect((v = Date) is Number).to.be.false
	}) // }}}

	it('isNumeric', func() { // {{{
		// true
		expect(Type.isNumeric(42)).to.be.true
		expect(Type.isNumeric('42')).to.be.true

		// false
		expect(Type.isNumeric([])).to.be.false
		expect(Type.isNumeric([1, 2, 3])).to.be.false
		expect(Type.isNumeric(null)).to.be.false
		expect(Type.isNumeric(false)).to.be.false
		expect(Type.isNumeric(true)).to.be.false
		expect(Type.isNumeric('')).to.be.false
		expect(Type.isNumeric('hello world')).to.be.false
		expect(Type.isNumeric({})).to.be.false
		expect(Type.isNumeric({
			hello: 'world'
		})).to.be.false
		expect(Type.isNumeric(foo)).to.be.false
		expect(Type.isNumeric(/hello/)).to.be.false
		expect(Type.isNumeric('http://www.Type.org')).to.be.false
		expect(Type.isNumeric(new Date())).to.be.false
	}) // }}}

	it('isObject', func() { // {{{
		let v

		// true
		expect((v = {}) is Object).to.be.true
		expect((v = {
			hello: 'world'
		}) is Object).to.be.true
		expect((v = new Date()) is Object).to.be.true
		expect((v = /hello/) is Object).to.be.true

		// false
		expect((v = []) is Object).to.be.false
		expect((v = [1, 2, 3]) is Object).to.be.false
		expect((v = null) is Object).to.be.false
		expect((v = false) is Object).to.be.false
		expect((v = true) is Object).to.be.false
		expect((v = '') is Object).to.be.false
		expect((v = 'hello world') is Object).to.be.false
		expect((v = 42) is Object).to.be.false
		expect((v = '42') is Object).to.be.false
		expect((v = foo) is Object).to.be.false
		expect((v = Foo) is Object).to.be.false
		expect((v = 'http://www.zokugun.org') is Object).to.be.false
		expect((v = Date) is Object).to.be.false
	}) // }}}

	it('isPrimitive', func() { // {{{
		// true
		expect(Type.isPrimitive(false)).to.be.true
		expect(Type.isPrimitive(true)).to.be.true
		expect(Type.isPrimitive('')).to.be.true
		expect(Type.isPrimitive('hello world')).to.be.true
		expect(Type.isPrimitive(42)).to.be.true
		expect(Type.isPrimitive('42')).to.be.true
		expect(Type.isPrimitive('http://www.Type.org')).to.be.true

		// false
		expect(Type.isPrimitive([])).to.be.false
		expect(Type.isPrimitive([1, 2, 3])).to.be.false
		expect(Type.isPrimitive(null)).to.be.false
		expect(Type.isPrimitive({})).to.be.false
		expect(Type.isPrimitive({
			hello: 'world'
		})).to.be.false
		expect(Type.isPrimitive(foo)).to.be.false
		expect(Type.isPrimitive(Foo)).to.be.false
		expect(Type.isPrimitive(/hello/)).to.be.false
		expect(Type.isPrimitive(new Date())).to.be.false
		expect(Type.isPrimitive(Date)).to.be.false
	}) // }}}

	it('isString', func() { // {{{
		let v

		// true
		expect((v = '') is String).to.be.true
		expect((v = 'hello world') is String).to.be.true
		expect((v = '42') is String).to.be.true
		expect((v = 'http://www.zokugun.org') is String).to.be.true

		// false
		expect((v = []) is String).to.be.false
		expect((v = [1, 2, 3]) is String).to.be.false
		expect((v = null) is String).to.be.false
		expect((v = false) is String).to.be.false
		expect((v = true) is String).to.be.false
		expect((v = 42) is String).to.be.false
		expect((v = {}) is String).to.be.false
		expect((v = {
			hello: 'world'
		}) is String).to.be.false
		expect((v = foo) is String).to.be.false
		expect((v = Foo) is String).to.be.false
		expect((v = /hello/) is String).to.be.false
		expect((v = new Date()) is String).to.be.false
		expect((v = Date) is String).to.be.false
	}) // }}}

	it('isRegex', func() { // {{{
		let v

		// true
		expect((v = /hello/) is RegExp).to.be.true

		// false
		expect((v = []) is RegExp).to.be.false
		expect((v = [1, 2, 3]) is RegExp).to.be.false
		expect((v = null) is RegExp).to.be.false
		expect((v = false) is RegExp).to.be.false
		expect((v = true) is RegExp).to.be.false
		expect((v = '') is RegExp).to.be.false
		expect((v = 'hello world') is RegExp).to.be.false
		expect((v = 42) is RegExp).to.be.false
		expect((v = '42') is RegExp).to.be.false
		expect((v = {}) is RegExp).to.be.false
		expect((v = {
			hello: 'world'
		}) is RegExp).to.be.false
		expect((v = foo) is RegExp).to.be.false
		expect((v = Foo) is RegExp).to.be.false
		expect((v = 'http://www.zokugun.org') is RegExp).to.be.false
		expect((v = new Date()) is RegExp).to.be.false
		expect((v = Date) is RegExp).to.be.false
	}) // }}}

	it('isValue', func() { // {{{
		// true
		expect(Type.isValue([])).to.be.true
		expect(Type.isValue([1, 2, 3])).to.be.true
		expect(Type.isValue(false)).to.be.true
		expect(Type.isValue(true)).to.be.true
		expect(Type.isValue('')).to.be.true
		expect(Type.isValue('hello world')).to.be.true
		expect(Type.isValue(42)).to.be.true
		expect(Type.isValue('42')).to.be.true
		expect(Type.isValue({})).to.be.true
		expect(Type.isValue({
			hello: 'world'
		})).to.be.true
		expect(Type.isValue(foo)).to.be.true
		expect(Type.isValue(/hello/)).to.be.true
		expect(Type.isValue('http://www.Type.org')).to.be.true
		expect(Type.isValue(new Date())).to.be.true

		// false
		expect(Type.isValue(null)).to.be.false
	}) // }}}

	it('typeOf', func() { // {{{
		expect(Type.typeOf([])).to.equal('array')
		expect(Type.typeOf([1, 2, 3])).to.equal('array')
		expect(Type.typeOf(null)).to.equal('null')
		expect(Type.typeOf(false)).to.equal('boolean')
		expect(Type.typeOf(true)).to.equal('boolean')
		expect(Type.typeOf('')).to.equal('string')
		expect(Type.typeOf('hello world')).to.equal('string')
		expect(Type.typeOf(42)).to.equal('number')
		expect(Type.typeOf('42')).to.equal('string')
		expect(Type.typeOf({})).to.equal('object')
		expect(Type.typeOf({
			hello: 'world'
		})).to.equal('object')
		expect(Type.typeOf(foo)).to.equal('function')
		expect(Type.typeOf(Foo)).to.equal('constructor')
		expect(Type.typeOf(/hello/)).to.equal('regex')
		expect(Type.typeOf('http://www.Type.org')).to.equal('string')
		expect(Type.typeOf(new Date())).to.equal('date')
	}) // }}}
})