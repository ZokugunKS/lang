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
			version: '11.285'
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
		// Android
		sl_android_51: {
			base: 'SauceLabs',
			browserName: 'Browser',
			platform: 'Android',
			version: '5.1',
			deviceName: 'Android Emulator',
		},
		sl_android_44: {
			base: 'SauceLabs',
			browserName: 'Browser',
			platform: 'Android',
			version: '4.4',
			deviceName: 'Android Emulator',
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
			'@mocha/karma-sauce-launcher',
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
				mode: 'production',
				module: {
					rules: [
						{
							test: /\.ks$/,
							use: [
								{
									loader: '@kaoscript/webpack-loader?target=trident-v5&register=@kaoscript/target-commons'
								}
							]
						}
					]
				},
				performance: {
					hints: false
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
		browserNoActivityTimeout: 10000,
		sauceLabs: {
			testName: '@zokugun/lang',
			recordVideo: false,
			recordScreenshots: false,
			connectOptions: {
				'no-ssl-bump-domains': 'all',
				port: 5757
			},
			public: 'public'
		}
	});
};