import sirv from 'sirv'
import express from "express"
import compression from 'compression'
import * as sapper from '@sapper/server'
import cookieParser from 'cookie-parser'
import {auth} from './routes/auth'

const { json } = require('body-parser');
const { PORT, NODE_ENV } = process.env;
const dev = NODE_ENV === 'development';

var app = express();
app.use(
		json(),
		compression({ threshold: 0 }),
		sirv('static', { dev }),
		cookieParser(),
		async (req, res, next) => {
			const token = req.cookies['auth']
			if(token){			
				let profile=auth(token)
				return sapper.middleware({session: () => ({authenticated: !!profile,profile:profile})})(req, res, next)
			}else
				return sapper.middleware({session: () => ({authenticated: false})})(req, res, next)
		}
		//sapper.middleware({session: req => ({})})
		//sapper.middleware()
	)
	.listen(PORT, err => {
		if (err) console.log('error', err);
	});
