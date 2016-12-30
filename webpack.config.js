/* const config = [
	{
		module: {
			loaders: [
				{
					test: /\.ks$/,
					loader: '@kaoscript/webpack-loader'
				}
			]
		},
		resolve: {
			extensions: ['', '.js', '.ks']
		}
	}
];

if(process.env.WEBPACK_ENV === 'dev') {
	var host = '0.0.0.0';
	var port = '9000';
	
	new require('webpack-dev-server')(require('webpack')(config), {
		contentBase: './test',
		hot: true,
		debug: true
	}).listen(port, host, function(err, result) {
		if(err) {
			console.log(err);
		}
	});
	
	console.log('-------------------------');
	console.log('Local web server runs at http://' + host + ':' + port);
	console.log('-------------------------');
}

module.exports = config */

module.exports = [
	{
		module: {
			loaders: [
				{
					test: /\.ks$/,
					loader: '@kaoscript/webpack-loader'
				}
			]
		},
		resolve: {
			extensions: ['', '.js', '.ks']
		}
	}
];