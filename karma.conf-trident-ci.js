module.exports = function(config) {
	if(!process.env.SAUCE_USERNAME || !process.env.SAUCE_ACCESS_KEY) {
		console.error('Make sure the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables are set.');
		process.exit(1);
	}
	
	const customLaunchers = {
		// Safari
		sl_safari_8_x10: {
			base: 'SauceLabs',
			browserName: 'safari',
			platform: 'OS X 10.10',
			version: '8.0'
		},
		// Internet Explorer
		sl_ie_11_w10: {
			base: 'SauceLabs',
			browserName: 'internet explorer',
			platform: 'Windows 10',
			version: '11.103'
		},
		sl_ie_11_w8: {
			base: 'SauceLabs',
			browserName: 'internet explorer',
			platform: 'Windows 8.1',
			version: '11.0'
		},
		sl_ie_9_w7: {
			base: 'SauceLabs',
			browserName: 'internet explorer',
			platform: 'Windows 7',
			version: '9.0'
		},
		// iOS
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
							loader: '@kaoscript/webpack-loader?target=trident-v5&register=@kaoscript/target-commons'
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