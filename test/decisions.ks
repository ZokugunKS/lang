#![bin]

extern {
	describe:	func
	it:			func
	Type
}

import {
	expect 		from 'chai'
	*			from '../index.ks'
}

describe('decisions', func() {
	func foo() {
	}
	
	class Foo {
		hello() => 'hello world'
	}
	
	it('isArray', func() { // {{{
		// true
		expect([] is Array).to.be.true
		expect([1, 2, 3] is Array).to.be.true
		
		// false
		expect(null is Array).to.be.false
		expect(false is Array).to.be.false
		expect(true is Array).to.be.false
		expect('' is Array).to.be.false
		expect('hello world' is Array).to.be.false
		expect(42 is Array).to.be.false
		expect('42' is Array).to.be.false
		expect({} is Array).to.be.false
		expect({
			hello: 'world'
		} is Array).to.be.false
		expect(foo is Array).to.be.false
		expect(Foo is Array).to.be.false
		expect(/hello/ is Array).to.be.false
		expect('http://www.zokugun.org' is Array).to.be.false
		expect(new Date() is Array).to.be.false
		expect(Date is Array).to.be.false
	}) // }}}
	
	it('isBoolean', func() { // {{{
		// true
		expect(false is Boolean).to.be.true
		expect(true is Boolean).to.be.true
		
		// false
		expect([] is Boolean).to.be.false
		expect([1, 2, 3] is Boolean).to.be.false
		expect(null is Boolean).to.be.false
		expect('' is Boolean).to.be.false
		expect('hello world' is Boolean).to.be.false
		expect(42 is Boolean).to.be.false
		expect('42' is Boolean).to.be.false
		expect({} is Boolean).to.be.false
		expect({
			hello: 'world'
		} is Boolean).to.be.false
		expect(foo is Boolean).to.be.false
		expect(Foo is Boolean).to.be.false
		expect(/hello/ is Boolean).to.be.false
		expect('http://www.zokugun.org' is Boolean).to.be.false
		expect(new Date() is Boolean).to.be.false
		expect(Date is Boolean).to.be.false
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
		// true
		expect(new Date() is Date).to.be.true
		
		// false
		expect([] is Date).to.be.false
		expect([1, 2, 3] is Date).to.be.false
		expect(null is Date).to.be.false
		expect(false is Date).to.be.false
		expect(true is Date).to.be.false
		expect('' is Date).to.be.false
		expect('hello world' is Date).to.be.false
		expect(42 is Date).to.be.false
		expect('42' is Date).to.be.false
		expect({} is Date).to.be.false
		expect({
			hello: 'world'
		} is Date).to.be.false
		expect(foo is Date).to.be.false
		expect(Foo is Date).to.be.false
		expect(/hello/ is Date).to.be.false
		expect('http://www.zokugun.org' is Date).to.be.false
		expect(Date is Date).to.be.false
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
		// true
		expect(foo is Function).to.be.true
		
		// false
		expect([] is Function).to.be.false
		expect([1, 2, 3] is Function).to.be.false
		expect(null is Function).to.be.false
		expect(false is Function).to.be.false
		expect(true is Function).to.be.false
		expect('' is Function).to.be.false
		expect('hello world' is Function).to.be.false
		expect(42 is Function).to.be.false
		expect('42' is Function).to.be.false
		expect({} is Function).to.be.false
		expect({
			hello: 'world'
		} is Function).to.be.false
		expect(/hello/ is Function).to.be.false
		expect('http://www.zokugun.org' is Function).to.be.false
		expect(new Date() is Function).to.be.false
	}) // }}}
	
	it('isNumber', func() { // {{{
		// true
		expect(42 is Number).to.be.true
		
		// false
		expect([] is Number).to.be.false
		expect([1, 2, 3] is Number).to.be.false
		expect(null is Number).to.be.false
		expect(false is Number).to.be.false
		expect(true is Number).to.be.false
		expect('' is Number).to.be.false
		expect('hello world' is Number).to.be.false
		expect('42' is Number).to.be.false
		expect({} is Number).to.be.false
		expect({
			hello: 'world'
		} is Number).to.be.false
		expect(foo is Number).to.be.false
		expect(/hello/ is Number).to.be.false
		expect('http://www.zokugun.org' is Number).to.be.false
		expect(new Date() is Number).to.be.false
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
		// true
		expect({} is Object).to.be.true
		expect({
			hello: 'world'
		} is Object).to.be.true
		expect(new Date() is Object).to.be.true
		expect(/hello/ is Object).to.be.true
		
		// false
		expect([] is Object).to.be.false
		expect([1, 2, 3] is Object).to.be.false
		expect(null is Object).to.be.false
		expect(false is Object).to.be.false
		expect(true is Object).to.be.false
		expect('' is Object).to.be.false
		expect('hello world' is Object).to.be.false
		expect(42 is Object).to.be.false
		expect('42' is Object).to.be.false
		expect(foo is Object).to.be.false
		expect('http://www.zokugun.org' is Object).to.be.false
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
		// true
		expect('' is String).to.be.true
		expect('hello world' is String).to.be.true
		expect('http://www.zokugun.org' is String).to.be.true
		expect('42' is String).to.be.true
		
		// false
		expect([] is String).to.be.false
		expect([1, 2, 3] is String).to.be.false
		expect(null is String).to.be.false
		expect(false is String).to.be.false
		expect(true is String).to.be.false
		expect(42 is String).to.be.false
		expect({} is String).to.be.false
		expect({
			hello: 'world'
		} is String).to.be.false
		expect(foo is String).to.be.false
		expect(/hello/ is String).to.be.false
		expect(new Date() is String).to.be.false
	}) // }}}
	
	it('isRegex', func() { // {{{
		// true
		expect(/hello/ is RegExp).to.be.true
		
		// false
		expect([] is RegExp).to.be.false
		expect([1, 2, 3] is RegExp).to.be.false
		expect(null is RegExp).to.be.false
		expect(false is RegExp).to.be.false
		expect(true is RegExp).to.be.false
		expect('' is RegExp).to.be.false
		expect('hello world' is RegExp).to.be.false
		expect(42 is RegExp).to.be.false
		expect('42' is RegExp).to.be.false
		expect({} is RegExp).to.be.false
		expect({
			hello: 'world'
		} is RegExp).to.be.false
		expect(foo is RegExp).to.be.false
		expect('http://www.zokugun.org' is RegExp).to.be.false
		expect(new Date() is RegExp).to.be.false
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