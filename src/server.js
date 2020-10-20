import sirv from 'sirv'
import express from "express"
import compression from 'compression'
import * as sapper from '@sapper/server'
import cookieParser from 'cookie-parser'
import {auth,refreshToken} from './routes/auth'

const { json } = require('body-parser');
const { PORT, NODE_ENV } = process.env;
const dev = NODE_ENV === 'development';

var app = express();
app.use(
		json(),
		compression({ threshold: 0 }),
		sirv('static', { dev }),
		cookieParser(),
		(req, res, next) => {
			const token = req.cookies['auth']
			const refresh = req.cookies['refresh']
			let ctn=true
			if(token){
				ctn=false			
				let profile=auth(token)
				if(!!profile){
					return sapper.middleware({session: () => ({authenticated: true,profile:profile})})(req, res, next)
				}
				ctn=true
			}
			if(refresh && ctn){
				let {auth,name,email,avatar}= refreshToken(refresh)
				//console.log(name,email,avatar)
				res.cookie('auth',auth,{secure:false }).cookie('name',name,{secure:false })
					.cookie('email',email,{secure:false }).cookie('avatar',avatar,{secure:false })
				return sapper.middleware({session: () => ({authenticated: !!name,profile:{name,email,avatar}})})(req, res, next)
			}
			return sapper.middleware({session: () => ({authenticated: false})})(req, res, next)
		}
		//sapper.middleware({session: req => ({})})
		//sapper.middleware()
	)
	.listen(PORT, err => {
		if (err) console.log('error', err);
	});
