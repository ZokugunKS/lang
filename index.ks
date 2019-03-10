/**
 * index.ks
 * Version 0.4.0
 * November 12th, 2016
 *
 * Copyright (c) 2016 Baptiste Augrain
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 **/
include {
	'./src/inc/array'
	'./src/inc/boolean'
	'./src/inc/date'
	'./src/inc/function'
	'./src/inc/json'
	'./src/inc/number'
	'./src/inc/object'
	'./src/inc/regexp'
	'./src/inc/string'
	'./src/inc/math'

	'./src/clone'
	'./src/copy'
	'./src/equals'
	'./src/toSource'

	'./src/array/any'
	'./src/array/append'
	'./src/array/appendUniq'
	'./src/array/associate'
	'./src/array/clear'
	'./src/array/clone'
	'./src/array/commonPrefix'
	'./src/array/compact'
	'./src/array/contains'
	'./src/array/containsAny'
	'./src/array/copy'
	'./src/array/count'
	'./src/array/detect'
	'./src/array/difference'
	'./src/array/drop'
	'./src/array/each'
	'./src/array/equals'
	'./src/array/fill'
	'./src/array/filter'
	'./src/array/first'
	'./src/array/flatten'
	'./src/array/from'
	'./src/array/group'
	'./src/array/injectAt'
	'./src/array/insertAt'
	'./src/array/intersection'
	'./src/array/invoke'
	'./src/array/isInsideIndex'
	'./src/array/isOutsideIndex'
	'./src/array/join'
	'./src/array/last'
	'./src/array/link'
	'./src/array/map'
	'./src/array/none'
	'./src/array/pad'
	'./src/array/pick'
	'./src/array/pluck'
	'./src/array/prepend'
	'./src/array/prependUniq'
	'./src/array/pushUniq'
	'./src/array/random'
	'./src/array/range'
	'./src/array/rdrop'
	'./src/array/reject'
	'./src/array/remove'
	'./src/array/removeAt'
	'./src/array/removeFirstOf'
	'./src/array/removeLastOf'
	'./src/array/replace'
	'./src/array/retain'
	'./src/array/rtake'
	'./src/array/take'
	'./src/array/toSource'
	'./src/array/uniq'
	'./src/array/unshiftUniq'
	'./src/array/unzip'
	'./src/array/without'
	'./src/array/zip'

	'./src/boolean/toBoolean'

	'./src/function/async'
	'./src/function/curry'
	'./src/function/debounce'
	'./src/function/delay'
	'./src/function/enclose'
	'./src/function/filter'
	'./src/function/memoize'
	'./src/function/once'
	'./src/function/periodical'
	'./src/function/repeat'
	'./src/function/since'
	'./src/function/temporize'
	'./src/function/throttle'
	'./src/function/toSource'
	'./src/function/try'
	'./src/function/until'
	'./src/function/wrap'

	'./src/json/stringifySafely'

	'./src/math/limit'

	'./src/number/between'
	'./src/number/beyond'
	'./src/number/ceil'
	'./src/number/floor'
	'./src/number/limit'
	'./src/number/mod'
	'./src/number/random'
	'./src/number/randomInt'
	'./src/number/round'
	'./src/number/repeat'
	'./src/number/toFloat'
	'./src/number/toInt'
	'./src/number/zeroPad'

	'./src/object/append'
	'./src/object/clone'
	'./src/object/copy'
	'./src/object/defaults'
	'./src/object/each'
	'./src/object/equals'
	'./src/object/every'
	'./src/object/filter'
	'./src/object/hasKey'
	'./src/object/hasValue'
	'./src/object/isEmpty'
	'./src/object/keyAt'
	'./src/object/keyOf'
	'./src/object/map'
	'./src/object/merge'
	'./src/object/size'
	'./src/object/some'
	'./src/object/subset'
	'./src/object/toSource'
	'./src/object/value'
	'./src/object/values'

	'./src/regexp/clone'
	'./src/regexp/length'

	'./src/string/after'
	'./src/string/append'
	'./src/string/before'
	'./src/string/camelize'
	'./src/string/capitalize'
	'./src/string/capitalizeSameAs'
	'./src/string/capitalizeWords'
	'./src/string/classify'
	'./src/string/clean'
	'./src/string/clip'
	'./src/string/contains'
	'./src/string/dasherize'
	'./src/string/drop'
	'./src/string/endsWith'
	'./src/string/escapeRegex'
	'./src/string/evaluate'
	'./src/string/extract'
	'./src/string/humanize'
	'./src/string/indexOfRegex'
	'./src/string/isBoolean'
	'./src/string/left'
	'./src/string/lines'
	'./src/string/lowerFirst'
	'./src/string/lpad'
	'./src/string/ltrim'
	'./src/string/matchPair'
	'./src/string/prepend'
	'./src/string/quote'
	'./src/string/rdrop'
	'./src/string/repeat'
	'./src/string/replaceAll'
	'./src/string/right'
	'./src/string/rpad'
	'./src/string/rtake'
	'./src/string/rtrim'
	'./src/string/startsWith'
	'./src/string/substitute'
	'./src/string/take'
	'./src/string/test'
	'./src/string/toBoolean'
	'./src/string/toFloat'
	'./src/string/toInt'
	'./src/string/underscorify'
	'./src/string/unquote'
	'./src/string/upperFirst'
}