#![bin]

extern {
	sealed class Error
	
	describe:	func
	it:			func
	setTimeout:	func
}

import {
	'@kaoscript/runtime'	for Type
	'chai'					for expect
	'../index.ks'
}

describe('function', func() {
	describe('instance', func() {
		it('async', func(done) { // {{{
			let flag = false
			(func() {
				flag = true
			}).async()
			
			let flags = {
				foo: 0
			}
			(func(flags) {
				++flags.foo
			}).async(null, flags)
			
			setTimeout(func() {
				expect(flag).to.be.true
				expect(flags.foo).to.be.equal(1)
				
				done()
			}, 10)
		}) // }}}
		
		it('bind :wa', func() { // {{{
			let o = {
				name: 'White'
			}
			
			func fff(prefix) {
				return prefix + this.name
			}
			let f = fff^$(o, 'Hello ')
			
			expect(f()).to.equal('Hello White')
		}) // }}}
		
		it('bind :na', func() { // {{{
			let o = {
				name: 'White'
			}
			
			func fff(prefix) {
				return prefix + this.name
			}
			let f = fff^$(o)
			
			expect(f('Hello ')).to.equal('Hello White')
		}) // }}}
		
		it('curry', func() { // {{{
			let f = ((prefix, name) => prefix + name)^^('Hello ')
			
			expect(f('White')).to.equal('Hello White')
		}) // }}}
		
		it('debounce', func(done) { // {{{
			let first = true
			
			let f = (func() {
				expect(first).to.be.true
				
				first = false
				
				done()
			}).debounce(20)
			
			f()
			f()
			f()
			f()
			f()
		}) // }}}
		
		it('delay :na', func(done) { // {{{
			let start = Date.now()
			
			(func() {
				expect(Date.now() - start).to.gte(20)
				
				done()
			}).delay(50)
		}) // }}}
		
		it('delay :wa', func(done) { // {{{
			let start = Date.now()
			
			(func(name) {
				expect(name).to.equal('foobar')
				expect(Date.now() - start).to.gte(20)
				
				done()
			}).delay(50, null, 'foobar')
		}) // }}}
		
		it('enclose', func() { // {{{
			let f = ((prefix, name) => prefix + name).enclose((fn, name) => fn('Hello ', name))
			
			expect(f('White')).to.equal('Hello White')
		}) // }}}
		
		it('filter', func() { // {{{
			let f = ((prefix, name) => prefix + name).filter((prefix = null, name = null) => prefix != null && name != null)
			
			expect(f('Hello ', 'White')).to.equal('Hello White')
			
			expect(f('White')).to.equal(null)
		}) // }}}
		
		it('memoize :nh', func() { // {{{
			let count = 0
			
			let fn = (func(name) {
				++count
				
				return 'Hello ' + name
			}).memoize()
			
			expect(fn('White')).to.equal('Hello White')
			expect(fn('White')).to.equal('Hello White')
			expect(count).to.equal(1)
		}) // }}}
		
		it('memoize :wh', func() { // {{{
			let count = 0
			
			let fn = (func(name) {
				++count
				
				return 'Hello ' + name
			}).memoize(name => name.toLowerCase().replace(/\s/g, ''))
			
			expect(fn('White')).to.equal('Hello White')
			expect(fn('White')).to.equal('Hello White')
			expect(count).to.equal(1)
		}) // }}}
		
		it('once', func() { // {{{
			let count = 0
			
			let f = (func() {
				++count
			}).once()
			
			f()
			f()
			f()
			f()
			f()
			
			expect(count).to.equal(1)
		}) // }}}
		
		it('pass', func() { // {{{
			let fn = ((prefix, name) => prefix + name)^^('Hello ', 'White')
			
			expect(fn()).to.equal('Hello White')
		}) // }}}
		
		it('periodical :na', func(done) { // {{{
			let count = 0
			let fn = (func() {
				++count
			}).periodical(1)
			
			setTimeout(func() {
				expect(count).to.be.gt(0)
				
				done()
			}, 10)
		}) // }}}
		
		it('periodical :wa', func(done) { // {{{
			let count = 0
			let fn = (func(name) {
				++count
				
				expect(name).to.equal('White')
			}).periodical(1, null, 'White')
			
			setTimeout(func() {
				expect(count).to.be.gt(0)
				
				done()
			}, 10)
		}) // }}}
		
		it('since', func() { // {{{
			let fn = (name => 'Hello ' + name).since(2)
			
			expect(fn('White')).to.equal(null)
			expect(fn('White')).to.equal(null)
			expect(fn('White')).to.equal('Hello White')
		}) // }}}
		
		it('temporize :na', func(done) { // {{{
			let count = 0
			let fn = (func() {
				++count
			}).temporize(3)
			
			fn()
			expect(count).to.be.equal(0)
			
			setTimeout(func() {
				expect(count).to.be.equal(1)
				
				fn()
			}, 50)
			
			setTimeout(func() {
				expect(count).to.be.equal(2)
				
				done()
			}, 100)
		}) // }}}
		
		it('temporize :wa', func(done) { // {{{
			let count = 0
			let fn = (func(name) {
				++count
				
				expect(name).to.equal('White')
			}).temporize(3, null, 'White')
			
			fn()
			expect(count).to.be.equal(0)
			
			setTimeout(func() {
				expect(count).to.be.equal(1)
				
				fn()
			}, 50)
			
			setTimeout(func() {
				expect(count).to.be.equal(2)
				
				done()
			}, 100)
		}) // }}}
		
		it('throttle', func(done) { // {{{
			let count = 0
			let fn = (func() {
				++count
			}).throttle(5)
			
			fn()
			expect(count).to.be.equal(1)
			fn()
			expect(count).to.be.equal(1)
			
			setTimeout(func() {
				fn()
				expect(count).to.be.equal(2)
				fn()
			}, 50)
			
			setTimeout(func() {
				expect(count).to.be.equal(2)
				
				done()
			}, 100)
		}) // }}}
		
		it('toSource', func() { // {{{
			let source = Type.isFunction:Function.toSource().replace(/[\t\r\n]/g, '')
			let uncover = source.replace(/__cov_\$\w+_\w+\.\w\['\d+'\]\+\+/g, '')
			
			if(source.length == uncover.length) {
				expect(uncover).to.equal('function(item) { // {{{return typeof item === \'function\';}') // }}}
			}
			else {
				expect(uncover).to.equal('function(item){return typeof item===\'function\'}')
			}
		}) // }}}
		
		it('try', func() { // {{{
			expect((func() {
				return 'hello'
			}).try()).to.equal('hello')
			
			expect((func() {
				throw new Error()
			}).try()).to.equal(null)
		}) // }}}
		
		it('until', func() { // {{{
			let count = 0
			let fn = (() => ++count).until(5)
			
			expect(fn()).to.be.equal(1)
			expect(fn()).to.be.equal(2)
			expect(fn()).to.be.equal(3)
			expect(fn()).to.be.equal(4)
			expect(fn()).to.be.equal(5)
			expect(fn()).to.be.equal(5)
			expect(fn()).to.be.equal(5)
			expect(fn()).to.be.equal(5)
		}) // }}}
		
		it('wrap', func() { // {{{
			func fn(prefix) => prefix + this._name
			
			let o = {
				_name: 'White',
				name: fn.wrap('Hello ')
			}
			
			expect(o.name()).to.equal('Hello White')
		}) // }}}
	})
	
	describe('class', func() {
		it('curry', func() { // {{{
			let f = func(prefix, name) {
				return prefix + name
			}
			
			f = Function.curry(f, 'Hello ')
			
			expect(f('White')).to.equal('Hello White')
		}) // }}}
		
		it('repeat', func() { // {{{
			let c = 0
			
			Function.repeat(func() {
				c++
			}, 8)
			
			expect(c).to.equal(8)
		}) // }}}
		
		it('try :val', func() { // {{{
			expect(Function.try(func() {
				throw new Error()
			}, func() {
				return 'hello'
			})).to.equal('hello')
		}) // }}}
		
		it('try :null', func() { // {{{
			expect(Function.try(func() {
				throw new Error()
			})).to.equal(null)
		}) // }}}
	})
})