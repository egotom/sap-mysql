import db from '../mysql.js';
const jwt = require('jsonwebtoken');
const send = require('@polka/send-type');
const bcrypt = require('bcrypt');

const ACCESS_TOKEN_SECRET='7404C0014fdec4396807ab9e100fe307b9d8feE645f22703ee81d1a54af0b63938bd91587f1813';
const REFRESH_TOKEN_SECRET='01e96440e8b307c40228aa57a5edf3b7fb6a039D00b958aeb042ea2d757360a15cc273639587c1';

/**
 * You first need to create a formatting function to pad numbers to two digits…
 **/
const twoDigits=(d)=> {
    if(0 <= d && d < 10) return "0" + d.toString();
    if(-10 < d && d < 0) return "-0" + (-1*d).toString();
    return d.toString();
}

const now=(dt)=> dt.getFullYear() + "-" + 
				twoDigits(1 + dt.getMonth()) + "-" + 
				twoDigits(dt.getDate()) + " " + 
				twoDigits(dt.getHours()) + ":" + 
				twoDigits(dt.getMinutes()) + ":" + 
				twoDigits(dt.getSeconds())

export async function  post(req, res){
	if(req.query.login){
		const email = req.body.email
		const password = req.body.passwd
		const remember = req.body.remember
		db.query(`select name,email,passwd,avatar,active from user where email = ? `,[email], async(err,results)=>{
			if(err){
				return send(res, 500, {msg:"系统错误"})
			}
			if(results.length===0)
				return send(res, 404, {msg:"该邮箱还没有注册，请先注册。"})
			const {name,email,passwd,avatar,active} = results[0]			
			if(!active) return send(res, 401, {msg:"该账号还没有激活，请先激活。"})
			if(await bcrypt.compare(password, passwd)) {
				const accessToken = generateAccessToken({name, email})
				if(remember){
					const refreshToken = jwt.sign({name, email}, REFRESH_TOKEN_SECRET)
					db.query(`update user set refresh_token=?,login_at=? where email = ? `,[refreshToken,now(new Date()),email],(err,results)=>{
						if(err) console.log(JSON.stringify(err),JSON.stringify(results))
					})
					json(res, { accessToken: accessToken, refreshToken: refreshToken , avatar:avatar})
				}else{
					db.query(`update user set refresh_token=?,login_at=? where email = ? `,['',now(new Date()),email],(err,results)=>{
						if(err) console.log(JSON.stringify(err),JSON.stringify(results))
					})
					json(res, { accessToken: accessToken, avatar:avatar})
				}
				
			}else 
				return send(res, 404, {msg:"账号或密码错误。"})
		
		});
	}
	if(req.query.register){	
		const eamil = req.body.email
		const name = req.body.userName
		const salt=await bcrypt.genSalt()
		const passwd = await bcrypt.hash(req.body.passwd, salt)
		const reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/
		if(!reg.test(eamil)) 
			return send(res, 403, JSON.stringify({msg:"邮箱格式错误！"}))
		const user = { eamil: eamil, name:name }
		const accessToken = generateAccessToken(user)
		const refreshToken = jwt.sign(user, REFRESH_TOKEN_SECRET)
		db.query(`insert into user(name,email,passwd) value(?,?,?)`,[name,eamil,passwd],(err)=>{
			if(err){
				console.log(JSON.stringify(err))
				if(err.errno===1062)
					return send(res, 401, {msg:"该邮箱已经被注册"})
				else
					return send(res, 500, {msg:"系统错误"})
			}
			json(res,{ accessToken: accessToken, refreshToken: refreshToken })
		});
		
	}
	if(req.query.refresh){
		const rfToken = req.body.token
		if (rfToken == null) return send(res, 403, JSON.stringify({msg:"Need refresh token."}))
		jwt.verify(rfToken, REFRESH_TOKEN_SECRET, (err, user) => {
			if (err) 
				return send(res, 403, JSON.stringify({msg:"Refresh token Verify failure."}))
			else{
				db.query(`select name,email,avatar from user where refresh_token = ? and login_at>= DATE_SUB(CURDATE(), INTERVAL 6 DAY)`,[rfToken], async(er,results)=>{
					if (er) console.log(JSON.stringify(er))
					else{
						if(results.length==0)
							return send(res, 403, JSON.stringify({msg:"Invalid refresh token."}))
						else{
							const {name ,email,avatar}=results[0]
							const accessToken = generateAccessToken({ email: email, name:name})
							json(res,{accessToken: accessToken,avatar:avatar})
						}
					}
				})
			}
			
		})
	}
}


export function json(res,son){
	res.writeHead(200, {'Content-Type': 'application/json'});
	res.end(JSON.stringify(son));
}

export function authenticateToken(req, res, next) {
	const authHeader = req.headers['authorization']
	const token = authHeader && authHeader.split(' ')[1]
	if (token == null) 
		return send(res, 401, JSON.stringify({msg:"Need token."}))
	
	jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
		//console.log(err)
		if (err) 
			return send(res, 401, JSON.stringify({msg:"Token Verify failure."}))
		req.user = user
		next()
	})
}

export function refreshToken(req, res) {
	const rfToken = req.body.token
	if (rfToken == null) return send(res, 403, JSON.stringify({msg:"Need refresh token."}))
	if (!refreshTokens.includes(rfToken)) send(res, 403, JSON.stringify({msg:"Invalid refresh token."}))
	jwt.verify(rfToken, REFRESH_TOKEN_SECRET, (err, user) => {
	  if (err) return send(res, 403, JSON.stringify({msg:"Refresh token Verify failure."}))
	  const accessToken = generateAccessToken({ name: user.name })
	  json(res,{accessToken: accessToken })
	})
}

export function generateAccessToken(user) {
	return jwt.sign(user, ACCESS_TOKEN_SECRET, { expiresIn: '15s' })
}