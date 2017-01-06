module.exports = [
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
];