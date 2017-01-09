module.exports = function(config) {
	if(!process.env.SAUCE_USERNAME || !process.env.SAUCE_ACCESS_KEY) {
		console.error('Make sure the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables are set.');
		process.exit(1);
	}
	
	const customLaunchers = {
		sl_ie_11_w8: {
			base: 'SauceLabs',
			browserName: 'internet explorer',
			platform: 'Windows 8.1',
			version: '11.0'
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