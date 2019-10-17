#![bin]

extern {
	describe:	func
	it:			func
	console
}

import {
	'chai'			for expect
	'..'
}

describe('array', func() {
	describe('instance', func() {
		it('any', func() { // {{{
			expect([1, 2, -3].any(func(item) {
				return item < 0
			})).to.be.true

			expect([1, 2, 3].any(func(item) {
				return item < 0
			})).to.be.false
		}) // }}}

		it('append :one', func() { // {{{
			expect([1, 2, 3].append([4, 5, 6])).to.eql([1, 2, 3, 4, 5, 6])
		}) // }}}

		it('append :many', func() { // {{{
			expect([1, 2, 3].append([4, 5, 6], [7, 8, 9], 10, 11, [12, 13, 14])).to.eql([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14])
		}) // }}}

		it('appendUniq :one', func() { // {{{
			expect([1, 2, 3].appendUniq([4, 5, 6, 1, 3])).to.eql([1, 2, 3, 4, 5, 6])
		}) // }}}

		it('appendUniq :many', func() { // {{{
			expect([1, 2, 3].appendUniq([4, 5, 6, 1, 3], 7, 8, 3, 1, 4, 9)).to.eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
		}) // }}}

		it('associate', func() { // {{{
			expect([1, 2, 3].associate(['a', 'b', 'c'])).to.eql({
				a: 1,
				b: 2,
				c: 3
			})
		}) // }}}

		it('clear', func() { // {{{
			let a: array = [1, 2, 3]

			expect(a.length).to.equal(3)

			a.clear()

			expect(a.length).to.equal(0)
		}) // }}}

		it('clone', func() { // {{{
			let a: array = [1, 2, {}]
			let b = a.clone()

			expect(a == b).to.be.false
			expect(a[2] == b[2]).to.be.false
		}) // }}}

		it('compact', func() { // {{{
			expect([1, null, 2, null, 3].compact()).to.eql([1, 2, 3])
		}) // }}}

		it('contains', func() { // {{{
			expect([1, 2, 3].contains(1)).to.be.true
			expect([1, 2, 3].contains(9)).to.be.false
		}) // }}}

		it('containsAny', func() { // {{{
			expect([1, 2, 3].containsAny([1, 9, 7])).to.be.true
			expect([1, 2, 3].containsAny([9, 7])).to.be.false
		}) // }}}

		it('copy', func() { // {{{
			let a: array = [1, 2, {}]
			let b = a.copy()

			expect(a == b).to.be.false
			expect(a[2] == b[2]).to.be.true
		}) // }}}

		it('count', func() { // {{{
			expect([1, 2, 3, 4, 5, 6, 7].count(func(item) {
				return item % 2 == 0
			})).to.eql(3)
		}) // }}}

		it('detect :true', func() { // {{{
			expect([1, 2, 3, 4, 5, 6, 7].detect(func(item) {
				return item > 5
			})).to.eql(6)
		}) // }}}

		it('detect :false', func() { // {{{
			expect([1, 2, 3, 4, 5, 6, 7].detect(func(item) {
				return item > 10
			})).to.eql(null)
		}) // }}}

		it('difference', func() { // {{{
			expect([1, 2, 3, 4, 5, 6, 7].difference([2, 6, 7])).to.eql([1, 3, 4, 5])
		}) // }}}

		it('drop', func() { // {{{
			expect([1, 2, -3].drop()).to.eql([2, -3])
		}) // }}}

		it('each', func() { // {{{
			let sum = 0

			[1, 2, 3].each(func(item) {
				sum += item
			})

			expect(sum).to.equal(6)
		}) // }}}

		it('equals :true', func() { // {{{
			expect([1, 2, 3].equals([1, 2, 3])).to.be.true
			expect([1, 2, 3] == [1, 2, 3]).to.be.false
		}) // }}}

		it('equals :false', func() { // {{{
			expect([1, 2, 3].equals([1, 2])).to.be.false
			expect([1, 2, 3].equals([1, 2, 4])).to.be.false
		}) // }}}

		it('equals :this', func() { // {{{
			let a := [1, 2, 3]
			expect(a.equals(a)).to.be.true
		}) // }}}

		it('equals :array', func() { // {{{
			expect([1].equals([[1, 2, 3]])).to.be.false
			expect([[1, 2, 3]].equals([1])).to.be.false
			expect([[1, 2, 3]].equals([[1, 2, 4]])).to.be.false
			expect([[1, 2, 3]].equals([[1, 2, 3]])).to.be.true
		}) // }}}

		it('equals :object', func() { // {{{
			expect([1].equals([{}])).to.be.false
			expect([{}].equals([1])).to.be.false

			expect([{
				foo: 'bar'
			}].equals([{
				bar: 'foo'
			}])).to.be.false

			expect([{
				foo: 'bar'
			}].equals([{
				foo: 'bar'
			}])).to.be.true
		}) // }}}

		it('every', func() { // {{{
			expect([1, 2, 3].every(func(item) {
				return item > 0
			})).to.be.true

			expect([1, 2, -3].every(func(item) {
				return item > 0
			})).to.be.false
		}) // }}}

		it('filter', func() { // {{{
			expect([1, 2, -3].filter(func(item) {
				return item > 0
			})).to.eql([1, 2])
		}) // }}}

		it('first', func() { // {{{
			expect([1, 2, -3].first()).to.equal(1)
			expect([].first()).to.equal(null)
		}) // }}}

		it('flatten', func() { // {{{
			expect([1, 2, -3, [4, 5], [[6], 7]].flatten()).to.eql([1, 2, -3, 4, 5, 6, 7])
		}) // }}}

		it('forEach', func() { // {{{
			let sum = 0

			[1, 2, 3].forEach(func(item) {
				sum += item
			})

			expect(sum).to.equal(6)
		}) // }}}

		it('group', func() { // {{{
			expect([1, 2, 3, 4].group((item, index) => item % 2 != 0 ? 'odd' : 'even')).to.eql({
				even: [2, 4],
				odd: [1, 3]
			})
		}) // }}}

		it('indexOf', func() { // {{{
			expect([1, 2, -3].indexOf(-3)).to.equal(2)
		}) // }}}

		it('injectAt :3:1:a', func() { // {{{
			expect([1, 2, 3].injectAt(1, [4, 5, 6])).to.eql([1, 4, 5, 6, 2, 3])
		}) // }}}

		it('injectAt :3:1:l', func() { // {{{
			expect([1, 2, 3].injectAt(1, [4, 5], 6)).to.eql([1, 4, 5, 6, 2, 3])
		}) // }}}

		it('injectAt :3:0:a', func() { // {{{
			expect([1, 2, 3].injectAt(0, [4, 5, 6])).to.eql([4, 5, 6, 1, 2, 3])
		}) // }}}

		it('injectAt :3:0:l', func() { // {{{
			expect([1, 2, 3].injectAt(0, [4, 5], 6)).to.eql([4, 5, 6, 1, 2, 3])
		}) // }}}

		it('injectAt :0:1:a', func() { // {{{
			expect([].injectAt(1, [4, 5, 6])).to.eql([4, 5, 6])
		}) // }}}

		it('injectAt :0:1:l', func() { // {{{
			expect([].injectAt(1, [4, 5], 6)).to.eql([4, 5, 6])
		}) // }}}

		it('injectAt :0:0:a', func() { // {{{
			expect([].injectAt(0, [4, 5, 6])).to.eql([4, 5, 6])
		}) // }}}

		it('injectAt :0:0:l', func() { // {{{
			expect([].injectAt(0, [4, 5], 6)).to.eql([4, 5, 6])
		}) // }}}

		it('injectAt :3:-1:a', func() { // {{{
			expect([1, 2, 3].injectAt(-1, [4, 5, 6])).to.eql([1, 2, 3, 4, 5, 6])
		}) // }}}

		it('injectAt :3:-1:l', func() { // {{{
			expect([1, 2, 3].injectAt(-1, [4, 5], 6)).to.eql([1, 2, 3, 4, 5, 6])
		}) // }}}

		it('injectAt :3:-2:a', func() { // {{{
			expect([1, 2, 3].injectAt(-2, [4, 5, 6])).to.eql([1, 2, 4, 5, 6, 3])
		}) // }}}

		it('injectAt :3:-2:l', func() { // {{{
			expect([1, 2, 3].injectAt(-2, [4, 5], 6)).to.eql([1, 2, 4, 5, 6, 3])
		}) // }}}

		it('insertAt :3:1:1', func() { // {{{
			expect([1, 2, 3].insertAt(1, 7)).to.eql([1, 7, 2, 3])
		}) // }}}

		it('insertAt :3:0:1', func() { // {{{
			expect([1, 2, 3].insertAt(0, 7)).to.eql([7, 1, 2, 3])
		}) // }}}

		it('insertAt :3:4:1', func() { // {{{
			expect([1, 2, 3].insertAt(4, 7)).to.eql([1, 2, 3, 7])
		}) // }}}

		it('insertAt :3:-1:1', func() { // {{{
			expect([1, 2, 3].insertAt(-1, 7)).to.eql([1, 2, 3, 7])
		}) // }}}

		it('insertAt :3:-2:1', func() { // {{{
			expect([1, 2, 3].insertAt(-2, 7)).to.eql([1, 2, 7, 3])
		}) // }}}

		it('insertAt :3:1:3', func() { // {{{
			expect([1, 2, 3].insertAt(1, 7, [8, 9])).to.eql([1, 7, [8, 9], 2, 3])
		}) // }}}

		it('insertAt :3:0:3', func() { // {{{
			expect([1, 2, 3].insertAt(0, 7, [8, 9])).to.eql([7, [8, 9], 1, 2, 3])
		}) // }}}

		it('insertAt :3:4:3', func() { // {{{
			expect([1, 2, 3].insertAt(4, 7, [8, 9])).to.eql([1, 2, 3, 7, [8, 9]])
		}) // }}}

		it('intersection', func() { // {{{
			expect([1, 2, 3, 4, 5, 6, 7].intersection([2, 7])).to.eql([2, 7])
		}) // }}}

		it('invoke', func() { // {{{
			expect(['one', 'two', 'three'].invoke('toUpperCase')).to.eql(['ONE', 'TWO', 'THREE'])
		}) // }}}

		it('isInsideIndex', func() { // {{{
			expect([1, 2, -3].isInsideIndex(2)).to.be.true
			expect([1, 2, -3].isInsideIndex(10)).to.be.false
		}) // }}}

		it('isOutsideIndex', func() { // {{{
			expect([1, 2, -3].isOutsideIndex(2)).to.be.false
			expect([1, 2, -3].isOutsideIndex(10)).to.be.true
		}) // }}}

		it('map', func() { // {{{
			expect(['one', 'two', 'three'].map(func(item) {
				return item.toUpperCase()
			})).to.eql(['ONE', 'TWO', 'THREE'])
		}) // }}}

		it('none', func() { // {{{
			expect([1, 2, -3].none(func(item) {
				return item < 0
			})).to.be.false

			expect([1, 2, 3].none(func(item) {
				return item < 0
			})).to.be.true
		}) // }}}

		it('last', func() { // {{{
			expect([1, 2, -3].last()).to.equal(-3)
			expect([].last()).to.equal(null)
		}) // }}}

		it('link', func() { // {{{
			expect(['age', 21, 1950].link({
				key(item) {
					return item is String
				},
				value(item) {
					return item is Number
				},
				year() {
					return true
				}
			})).to.eql({
				key: 'age',
				value: 21,
				year: 1950
			})
		}) // }}}

		it('pad', func() { // {{{
			expect([1, 2, 3].pad(6, 0)).to.eql([1, 2, 3, 0, 0, 0])
			expect([1, 2, 3].pad(2, 0)).to.eql([1, 2, 3])
			expect([1, 2, 3].pad(-6, 0)).to.eql([0, 0, 0, 1, 2, 3])
		}) // }}}

		it('pick', func() { // {{{
			expect([null, null, 1, 2, -3].pick()).to.equal(1)
			expect([null, null].pick()).to.equal(null)
			expect([].pick()).to.equal(null)
		}) // }}}

		it('pluck :scalar', func() { // {{{
			expect([{
				name: 'john',
				age: 42
			}, {
				name: 'white',
				age: 24
			}].pluck('name')).to.eql(['john', 'white'])
		}) // }}}

		it('pluck :fn', func() { // {{{
			expect([{
				name: func() {
					return 'john'
				},
				age: func() {
					return 42
				}
			}, {
				name: func() {
					return 'white'
				},
				age: func() {
					return 24
				}
			}].pluck('name')).to.eql(['john', 'white'])
		}) // }}}

		it('prepend :one', func() { // {{{
			expect([1, 2, 3].prepend([4, 5, 6, 2, 3])).to.eql([4, 5, 6, 2, 3, 1, 2, 3])
		}) // }}}

		it('prepend :many', func() { // {{{
			expect([1, 2, 3].prepend([4, 5, 6], [7, 8, 9])).to.eql([4, 5, 6, 7, 8, 9, 1, 2, 3])
		}) // }}}

		it('prependUniq :one', func() { // {{{
			expect([1, 2, 3].prependUniq([4, 5, 6, 2, 3])).to.eql([4, 5, 6, 1, 2, 3])
		}) // }}}

		it('prependUniq :many', func() { // {{{
			expect([1, 2, 3].prependUniq([4, 5, 6, 2, 3], 2, 3, [6, 7, 8])).to.eql([4, 5, 6, 7, 8, 1, 2, 3])
		}) // }}}

		it('pushUniq', func() { // {{{
			expect([1, 2, -3].pushUniq(1)).to.eql([1, 2, -3])

			expect([1, 2, -3].pushUniq(4)).to.eql([1, 2, -3, 4])
		}) // }}}

		it('random :3', func() { // {{{
			let count = 0

			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0
			[1, 2, 3].random() == [1, 2, 3].random() && ++count != 0

			expect(count).to.not.equal(10)
		}) // }}}

		it('random :0', func() { // {{{
			expect([].random()).to.equal(null)
		}) // }}}

		it('rdrop', func() { // {{{
			expect([1, 2, -3].rdrop()).to.eql([1, 2])
		}) // }}}

		it('reject', func() { // {{{
			expect([1, 2, -3].reject(func(item) {
				return item > 0
			})).to.eql([-3])
		}) // }}}

		it('remove :one', func() { // {{{
			expect([1, 2, 1, 3, 4, 1].remove(1)).to.eql([2, 3, 4])
		}) // }}}

		it('remove :many', func() { // {{{
			expect([1, 2, 1, 3, 4, 1].remove(1, 2)).to.eql([3, 4])
		}) // }}}

		it('removeAt :1', func() { // {{{
			expect([1, 2, 3].removeAt(1)).to.eql([1, 3])
		}) // }}}

		it('removeAt :-1', func() { // {{{
			expect([1, 2, 3].removeAt(-1)).to.eql([1, 2])
		}) // }}}

		it('removeFirstOf :f', func() { // {{{
			expect([1, 2, 3, 1].removeFirstOf(1)).to.eql([2, 3, 1])
		}) // }}}

		it('removeFirstOf :nf', func() { // {{{
			expect([1, 2, 3, 1].removeFirstOf(7)).to.eql([1, 2, 3, 1])
		}) // }}}

		it('removeLastOf :f', func() { // {{{
			expect([1, 2, 3, 1].removeLastOf(1)).to.eql([1, 2, 3])
		}) // }}}

		it('removeLastOf :nf', func() { // {{{
			expect([1, 2, 3, 1].removeLastOf(7)).to.eql([1, 2, 3, 1])
		}) // }}}

		it('replace', func() { // {{{
			expect([1, 2, 3, 1].replace(1, 4)).to.eql([4, 2, 3, 1])

			expect([1, 2, 3, 1].replace(1, 4, true)).to.eql([4, 2, 3, 4])
		}) // }}}

		it('retain :one', func() { // {{{
			expect([1, 2, 3, 1].retain([1, 2])).to.eql([1, 2, 1])
		}) // }}}

		it('retain :many', func() { // {{{
			expect([1, 2, 3, 1].retain(1, [2])).to.eql([1, 2, 1])
		}) // }}}

		it('rtake :d', func() { // {{{
			expect([1, 2, 3, 1].rtake()).to.eql([1])
		}) // }}}

		it('rtake :2', func() { // {{{
			expect([1, 2, 3, 1].rtake(2)).to.eql([3, 1])
		}) // }}}

		it('take :d', func() { // {{{
			expect([1, 2, 3, 1].take()).to.eql([1])
		}) // }}}

		it('take :2', func() { // {{{
			expect([1, 2, 3, 1].take(2)).to.eql([1, 2])
		}) // }}}

		it('toSource', func() { // {{{
			expect([1, 2, -3].toSource()).to.equal('[1,2,-3]')
		}) // }}}

		it('uniq :false:nf', func() { // {{{
			expect([4, 5, 1, 2, 3, 1, -5].uniq()).to.eql([4, 5, 1, 2, 3, -5])
		}) // }}}

		it('uniq :true:nf', func() { // {{{
			expect([-5, 1, 1, 2, 3, 4, 5].uniq(true)).to.eql([-5, 1, 2, 3, 4, 5])
		}) // }}}

		it('uniq :false:fn', func() { // {{{
			expect([{
				name: 'john'
			}, {
				name: 'white'
			}, {
				name: 'john'
			}].uniq(false, func(item, index) {
				return item.name
			})).to.eql([{
				name: 'john'
			}, {
				name: 'white'
			}])
		}) // }}}

		it('uniq :true:fn', func() { // {{{
			expect([{
				name: 'john'
			}, {
				name: 'john'
			}, {
				name: 'white'
			}].uniq(true, (item, index) => item.name)).to.eql([{
				name: 'john'
			}, {
				name: 'white'
			}])
		}) // }}}

		it('unshiftUniq', func() { // {{{
			expect([1, 2, -3].unshiftUniq(1)).to.eql([1, 2, -3])

			expect([1, 2, -3].unshiftUniq(4)).to.eql([4, 1, 2, -3])
		}) // }}}

		it('unzip', func() { // {{{
			expect([[1, 2, 3, 1], [2, 3], [4, 5, 6]].unzip()).to.eql([[1, 2, 4], [2, 3, 5], [3, 6], [1]])
		}) // }}}

		it('without :one', func() { // {{{
			expect([1, 2, 1, 3, 4, 1].without([1, 2])).to.eql([3, 4])
		}) // }}}

		it('without :many', func() { // {{{
			expect([1, 2, 1, 3, 4, 1].without([1, 2], 3)).to.eql([4])
		}) // }}}
	})

	describe('class', func() {
		it('fill', func() { // {{{
			expect(Array.fill(5, 4)).to.eql([4, 4, 4, 4, 4])

			expect(Array.fill(2, 'hello')).to.eql(['hello', 'hello'])
		}) // }}}

		it('from :def', func() { // {{{
			let args = Array.from(1)

			expect(args is Array).to.be.true
		}) // }}}

		it('from :null', func() { // {{{
			let args = Array.from(null)

			expect(args is Array).to.be.true
			expect(args.length).to.equal(0)
		}) // }}}

		it('join', func() { // {{{
			expect(Array.join([1, 2], 3, [4, 5])).to.eql([1, 2, 3, 4, 5])
		}) // }}}

		it('range ::', func() { // {{{
			expect(Array.range()).to.eql([])
		}) // }}}

		it('range :4', func() { // {{{
			expect(Array.range(4)).to.eql([0, 1, 2, 3])
		}) // }}}

		it('range :0:4', func() { // {{{
			expect(Array.range(0, 4)).to.eql([0, 1, 2, 3])
		}) // }}}

		it('range :0:4:2', func() { // {{{
			expect(Array.range(0, 4, 2)).to.eql([0, 2])
		}) // }}}

		it('toSource', func() { // {{{
			expect(Array.toSource([1, 2, -3])).to.equal('[1,2,-3]')

			expect(Array.toSource([])).to.equal('[]')
		}) // }}}

		it('zip', func() { // {{{
			expect(Array.zip([1, 2, 3, 1], [2, 3], [4, 5, 6])).to.eql([[1, 2, 4], [2, 3, 5], [3, 6], [1]])
		}) // }}}
	})

	describe('string', func() {
		it('commonPrefix :empty', func() { // {{{
			expect(([] as Array<String>).commonPrefix()).to.equal('')
		}) // }}}

		it('commonPrefix :one', func() { // {{{
			expect((['foo'] as Array<String>).commonPrefix()).to.equal('foo')
		}) // }}}

		it('commonPrefix :many:first', func() { // {{{
			expect((['foo', 'foobar', 'fooz', 'foobarqux'] as Array<String>).commonPrefix()).to.equal('foo')
		}) // }}}

		it('commonPrefix :many:last', func() { // {{{
			expect((['foo', 'foobar', 'fooz', 'foobarqux', 'fox'] as Array<String>).commonPrefix()).to.equal('fo')
		}) // }}}
	})
})