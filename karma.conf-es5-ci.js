module.exports = function(config) {
	if(!process.env.SAUCE_USERNAME || !process.env.SAUCE_ACCESS_KEY) {
		console.error('Make sure the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables are set.');
		process.exit(1);
	}
	
	const customLaunchers = {
		// Chrome
		sl_chrome_45_w7: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'Windows 7',
			version: '45.0'
		},
		sl_chrome_45_x11: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'OS X 10.11',
			version: '45.0'
		},
		// Safari
		sl_safari_9_x11: {
			base: 'SauceLabs',
			browserName: 'safari',
			platform: 'OS X 10.11',
			version: '9.0'
		},
		// Edge
		sl_edge_13_w10: {
			base: 'SauceLabs',
			browserName: 'MicrosoftEdge',
			platform: 'Windows 10',
			version: '13.10586'
		},
		// Internet Explorer
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
		},
		// iOS
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
		webpack: [
			{
				module: {
					loaders: [
						{
							test: /\.ks$/,
							loader: '@kaoscript/webpack-loader?target=es5'
						}
					]
				},
				resolve: {
					extensions: ['', '.js', '.ks']
				}
			}
		],
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