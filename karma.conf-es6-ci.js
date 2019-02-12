module.exports = function(config) {
	if(!process.env.SAUCE_USERNAME || !process.env.SAUCE_ACCESS_KEY) {
		console.error('Make sure the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables are set.');
		process.exit(1);
	}

	const customLaunchers = {
		// Chrome
		sl_chrome_72_w10: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'Windows 10',
			version: '72.0'
		},
		sl_chrome_72_x12: {
			base: 'SauceLabs',
			browserName: 'chrome',
			platform: 'macOS 10.12',
			version: '72.0'
		},
		// Firefox
		sl_firefox_65_w10: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'Windows 10',
			version: '65.0'
		},
		sl_firefox_47_w7: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'Windows 7',
			version: '47.0'
		},
		sl_firefox_65_x12: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'macOS 10.12',
			version: '65.0'
		},
		sl_firefox_47_x11: {
			base: 'SauceLabs',
			browserName: 'firefox',
			platform: 'OS X 10.11',
			version: '47.0'
		},
		// Safari
		sl_safari_12_x13: {
			base: 'SauceLabs',
			browserName: 'safari',
			platform: 'macOS 10.13',
			version: '12.0'
		},
		// Edge
		sl_edge_16_w10: {
			base: 'SauceLabs',
			browserName: 'microsoftedge',
			platform: 'Windows 10',
			version: '16.16299'
		},
		// iOS
		sl_ios_12: {
			base: 'SauceLabs',
			browserName: 'Safari',
			platform: 'iOS',
			version: '12.0',
			deviceName: 'iPhone XS',
			deviceOrientation: 'portrait'
		},
		// Android
		sl_android_8: {
			base: 'SauceLabs',
			browserName: 'Browser',
			platform: 'Android',
			version: '8.0',
			deviceName: 'Android Emulator',
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
									loader: '@kaoscript/webpack-loader?target=ecma-v6&register=@kaoscript/target-commons'
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
				port: 5757
			},
			public: 'public'
		}
	});
};