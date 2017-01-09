module.exports = [
	{
		module: {
			loaders: [
				{
					test: /\.ks$/,
					loader: '@kaoscript/webpack-loader?target=trident-v5'
				}
			]
		},
		resolve: {
			extensions: ['', '.js', '.ks']
		}
	}
];