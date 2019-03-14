[@zokugun/lang](https://github.com/ZokugunKS/lang)
==================================================

[![kaoscript](https://img.shields.io/badge/language-kaoscript-orange.svg)](https://github.com/kaoscript/kaoscript)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)
[![NPM Version](https://img.shields.io/npm/v/@zokugun/lang.svg?colorB=green)](https://www.npmjs.com/package/@zokugun/lang)
[![Dependency Status](https://badges.depfu.com/badges/3350e21c435f047f87443424851a772b/overview.svg)](https://depfu.com/github/ZokugunKS/lang)
[![Build Status](https://travis-ci.org/ZokugunKS/lang.svg?branch=master)](https://travis-ci.org/ZokugunKS/lang)
[![CircleCI](https://circleci.com/gh/ZokugunKS/lang/tree/master.svg?style=shield)](https://circleci.com/gh/ZokugunKS/lang/tree/master)
[![Coverage Status](https://img.shields.io/coveralls/ZokugunKS/lang/master.svg)](https://coveralls.io/github/ZokugunKS/lang)
[![Waffle.io](https://img.shields.io/badge/kanban-waffle.io-blue.svg)](https://waffle.io/ZokugunKS/lang)

Provide basics methods for Array, Function, Number, Object and String

Compatibility
-------------

| ![Chrome][chrome]      | ![Edge][edge]          | ![Firefox][firefox]    | ![IE][ie]              | ![Safari][safari]      | ![Android][android]      | ![iOS][ios]               | ![Node.js][nodejs]        |
|------------------------|------------------------|------------------------|------------------------|------------------------|--------------------------|---------------------------|---------------------------|
| :heavy_check_mark: 72  | :heavy_check_mark: 16  | :heavy_check_mark: 65  | :heavy_check_mark: 11  | :heavy_check_mark: 12  | :heavy_check_mark: 8.0  | :heavy_check_mark: 12     | :heavy_check_mark: 11      |
| :heavy_check_mark: 40  | :heavy_check_mark: 13  | :heavy_check_mark: 47  | :heavy_check_mark: 9*   | :heavy_check_mark: 8   | :heavy_check_mark: 4.4   | :heavy_check_mark: 9      | :heavy_check_mark: 4.5*      |

\* tested manually due to limitation of automated testing tools


Polyfill
--------

Here an example how a polyfill is defined:

```kaoscript
#[if(any(lt(chakra-v1.3), lt(ecma-v8), lt(jsc-v10), lt(monkey-v48), trident, lt(v8-v5.7)))]
impl String {
	padStart(targetLength: Number, pad: String = ' '): String => pad.repeat(targetLength - this.length) + this
}

#[else]
disclose String {
	padStart(targetLength: Number, pad: String = ' '): String
}
```

License
-------

Copyright &copy; 2016 Baptiste Augrain

Licensed under the [MIT license](http://www.opensource.org/licenses/mit-license.php).

[chrome]: https://github.com/daiyam/assets/raw/master/icons/48/browser_chrome.png "Chrome"
[edge]: https://github.com/daiyam/assets/raw/master/icons/48/browser_edge.png "Edge"
[firefox]: https://github.com/daiyam/assets/raw/master/icons/48/browser_firefox.png "Firefox"
[ie]: https://github.com/daiyam/assets/raw/master/icons/48/browser_ie.png "IE"
[safari]: https://github.com/daiyam/assets/raw/master/icons/48/browser_safari.png "Safari"
[android]: https://github.com/daiyam/assets/raw/master/icons/48/os_android.png "Android"
[ios]: https://github.com/daiyam/assets/raw/master/icons/48/os_ios.png "iOS"
[nodejs]: https://github.com/daiyam/assets/raw/master/icons/48/runtime_nodejs.png "Node.js"