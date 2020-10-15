import sirv from 'sirv';
import polka from 'polka';
import compression from 'compression';
import * as sapper from '@sapper/server';
const { json } = require('body-parser');
const { PORT, NODE_ENV } = process.env;
const dev = NODE_ENV === 'development';

polka() // You can also use Express
	.use(
		json(),
		compression({ threshold: 0 }),
		sirv('static', { dev }),
		sapper.middleware({
			session: req => ({
				accessToken:req.session && req.session.accessToken,
				name:req.session && req.session.name,
				email:req.session && req.session.email,
				avatar:req.session && req.session.avatar,
				erno:req.session && req.session.erno
			})
		})
		//sapper.middleware()
	)
	.listen(PORT, err => {
		if (err) console.log('error', err);
	});
