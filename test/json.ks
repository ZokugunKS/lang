#![bin]

extern {
	describe:	func
	it:			func
}

import {
	expect 		from 'chai'
	*			from '../index.ks'
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
})