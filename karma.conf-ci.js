module.exports = function(config) {
	if(!process.env.SAUCE_USERNAME || !process.env.SAUCE_ACCESS_KEY) {
		console.error('Make sure the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables are set.');
		process.exit(1);
	}
	
	const customLaunchers = {
		// Chrome
		sl_chrome_55_w10: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'Windows 10',
			version: '55.0'
		},
		/*
		sl_chrome_45_w7: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'Windows 7',
			version: '45.0'
		},
		*/
		sl_chrome_55_x12: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'macOS 10.12',
			version: '55.0'
		},
		/*
		sl_chrome_45_x11: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'OS X 10.11',
			version: '45.0'
		},
		*/
		// Firefox
		sl_firefox_50_w10: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'Windows 10',
			version: '50.0'
		},
		sl_firefox_47_w7: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'Windows 7',
			version: '47.0'
		},
		sl_firefox_50_x12: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'macOS 10.12',
			version: '50.0'
		},
		sl_firefox_47_x11: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'OS X 10.11',
			version: '47.0'
		},
		// Safari
		sl_safari_10_x12: {
			base: 'SauceLabs',
			browserName: 'safari',
			platform: 'macOS 10.12',
			version: '10.0'
		},
		/*
		sl_safari_9_x11: {
			base: 'SauceLabs',
			browserName: 'safari',
			platform: 'OS X 10.11',
			version: '9.0'
		},
		*/
		// Edge
		sl_edge_14_w10: {
			base: 'SauceLabs',
			browserName: 'MicrosoftEdge',
			platform: 'Windows 10',
			version: '14.14393'
		},
		/*
		sl_edge_13_w10: {
			base: 'SauceLabs',
			browserName: 'MicrosoftEdge',
			platform: 'Windows 10',
			version: '13.10586'
		},
		*/
		// Internet Explorer
		/*
		sl_ie_11_w10: {
			base: 'SauceLabs',
			browserName: 'internet explorer',
			platform: 'Windows 10',
			version: '11.103'
		},
		sl_ie_9_w7: {
			base: 'SauceLabs',
			browserName: 'internet explorer',
			platform: 'Windows 7',
			version: '9.0'
		}
		*/
		// iOS
		sl_ios_10: {
			base: 'SauceLabs',
			browserName: 'iphone',
			platform: 'OS X 10.11',
			version: '10.0',
			deviceName: 'iPhone 7',
			deviceOrientation: 'portrait'
		},
		/*
		sl_ios_9: {
			base: 'SauceLabs',
			browserName: 'iphone',
			platform: 'OS X 10.11',
			version: '9.3',
			deviceName: 'iPhone 6S',
			deviceOrientation: 'portrait'
		},
		sl_ios_8: {
			base: 'SauceLabs',
			browserName: 'iphone',
			platform: 'OS X 10.11',
			version: '8.4',
			deviceName: 'iPhone 6',
			deviceOrientation: 'portrait'
		},
		*/
		// Android
	};
	
	config.set({
		customLaunchers: customLaunchers,
		browsers: Object.keys(customLaunchers),
		frameworks: [ 'mocha', 'chai' ],
		files: [
			'test/*.ks'
		],
		plugins: [
			'karma-sauce-launcher',
			'karma-chai',
			'karma-mocha',
			'karma-webpack',
			'karma-mocha-reporter',
		],
		preprocessors: {
			'test/*.ks': [ 'webpack' ]
		},
		reporters: [ 'mocha', 'saucelabs' ],
		webpack: require('./webpack.config'),
		webpackServer: {
			noInfo: true
		},
		singleRun: true,
		autoWatch: false,
		logLevel: config.LOG_INFO,
		colors: true,
		port: 9876,
		concurrency: 1,
		captureTimeout: 300000,
		browserNoActivityTimeout: 60000,
		sauceLabs: {
			testName: '@zokugun/lang',
			recordScreenshots: false,
			connectOptions: {
				port: 5757,
				logfile: 'sauce_connect.log'
			},
			public: 'public'
		}
	});
};