module.exports = function(config) {
	if(!process.env.SAUCE_USERNAME || !process.env.SAUCE_ACCESS_KEY) {
		console.error('Make sure the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables are set.');
		process.exit(1);
	}

	const customLaunchers = {
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
			'test/decisions.ks'
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
		logLevel: config.LOG_DEBUG,
		colors: true,
		port: 9876,
		concurrency: 1,
		captureTimeout: 300000,
		browserNoActivityTimeout: 60000,
		sauceLabs: {
			testName: '@zokugun/lang',
			recordScreenshots: true,
			connectOptions: {
				port: 5757
			},
			public: 'public'
		}
	});
};