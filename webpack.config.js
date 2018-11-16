module.exports = [
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
];