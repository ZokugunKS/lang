module.exports = [
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
];