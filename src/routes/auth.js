import db from '../mysql.js'
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')
const nodemailer = require("nodemailer")

const transporter = nodemailer.createTransport({
	server:'',
	port: 587,
    secure: false,
	auth:{user:'',pass:''}
});

export const ACCESS_TOKEN_SECRET='7404C0014fdec4396807ab9e100fe307b9d8feE645f22703ee81d1a54af0b63938bd91587f1813'
export const REFRESH_TOKEN_SECRET='01e96440e8b307c40228aa57a5edf3b7fb6a039D00b958aeb042ea2d757360a15cc273639587c1'

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

const reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/

export async function  post(req, res){
	if(req.query.login){
		const email = req.body.email
		const password = req.body.passwd
		const remember = req.body.remember
		db.query(`select name,email,passwd,avatar,active from user where email = ? `,[email], async(err,results)=>{
			if(err){
				return res.status(500).send({erno:100})
			}
			if(results.length===0)
				return send(res, 404, {erno:1})
			const {name,email,passwd,avatar,active} = results[0]			
			if(!active) return res.status(401).send({erno:2})
			if(await bcrypt.compare(password, passwd)) {
				const accessToken = generateAccessToken({name, email,avatar})
				if(remember){
					const refreshToken = jwt.sign({name, email,avatar}, REFRESH_TOKEN_SECRET,{ expiresIn: '7d'})// will expired after 7 days
					//db.query(`update user set refresh_token=?,login_at=? where email = ? `,[refreshToken,now(new Date()),email],(err,results)=>{
					//	if(err) console.log(JSON.stringify(err),JSON.stringify(results))
					//})
					res.cookie('refresh',refreshToken, {
						expires: new Date(Date.now() + 7 * 86400000) ,secure:false // cookie will be removed after 7 days
					}).cookie('auth',accessToken,{secure:false })
					json(res, { accessToken: accessToken, name:name, email:email, avatar:avatar,erno:0})
				}else{
					//res.cookie('auth',JSON.stringify({accessToken:'Bearer ' +accessToken, name:name,email:email,avatar:avatar }))
					res.cookie('auth',accessToken,{secure:false })
					json(res, { accessToken: accessToken, name:name, email:email, avatar:avatar,erno:0})
				}
				
			}else
				return res.status(404).send({erno:3})
		
		});
	}
	if(req.query.register){	
		const email = req.body.email
		const name = req.body.userName
		const salt=await bcrypt.genSalt()
		const passwd = await bcrypt.hash(req.body.passwd, salt)
		
		if(!reg.test(email)) 
			return res.status(403).send({erno:3})

		db.query(`insert into user(name,email,passwd) value(?,?,?)`, [name, email, passwd], async (err) => {
			if (err) {
				console.log(JSON.stringify(err))
				if (err.errno === 1062)
					return res.status(401).send({erno:5})
				else
					return res.status(500).send({erno:100})
			}
			return  res.status(200).send({erno:6})
		});	
	}
	if(req.query.active){
		let email = req.query.email
		Console.log(email)
		if (email == null) return send(res, 403, JSON.stringify({erno:100}))
		db.query(`select name,email,avatar from user where email = ? and active=1`, [email], (er,results)=>{
			if (er) console.log(JSON.stringify(er))
			else{
				if(results.length==0)
					return send(res, 403, JSON.stringify({erno:100}))
				else{
					let {name ,email,avatar}=results[0]
					let refresh = jwt.sign({name, email,avatar}, REFRESH_TOKEN_SECRET, { expiresIn: '5m' })
					let uri='http://sibelly.org/auth?reset='+refresh
					let opt={
						from:'info@sibelly.org', to:email, 
						subject:'激活你的贝拉网账号，请在收到5分钟内完成操作',
						text:'亲爱的 '+email+'! <br>请点击下面链接激活你的账号<br> '+
						'<a href="'+ uri +'">激活账号</a> 或复制下面链接到浏览器完成激活操作<br>'+uri
					}
					transporter.sendMail(opt, function(error,info){
						if(error){
							console.log(error);
							return res.status(403).send({erno:100})
						}else{
							console.log('email sent:'+info.response)
							return res.status(200).send({erno:11})
						}
					});
				}
			}
		})
	}

	if(req.query.refresh){
		let refresh = req.query.refresh
		Console.log(refresh)
		if (refresh == null) return send(res, 403, JSON.stringify({erno:100}))
		jwt.verify(refresh, REFRESH_TOKEN_SECRET,(err, result)=>{
			if(err)	{
				console.log(err)
				return  res.status(200).send({erno:12})
			}
			db.query(`update user set active=1 where email = ?`, [email], (erro)=>{
				if(erro)
					return res.status(200).send({erno:100})
				else
					return res.status(200).send({erno:13})
			})
		})
	}

	if(req.query.reset){
		console.log(req.query.reset)
		if(req.query.reset=="1"){
			const email = req.body.email
			if (email == null) return send(res, 403, JSON.stringify({erno:100}))
			if(!reg.test(email)) 
				return send(res, 403, JSON.stringify({erno:4}))
			db.query(`select name, email, avatar from user where email = ? `,[email], async(er,results)=>{
				if (er) console.log(JSON.stringify(er))
				else{
					if(results.length==0)
						return res.status(403).send({erno:7})
					else{
						return res.status(403).send({erno:8})
					}
				}
			})
		}else{
			const passwd = req.body.passwd
			const token = req.body.token
			if (passwd == null || token==null) return  res.status(500).send({erno:100})
			jwt.verify(token, ACCESS_TOKEN_SECRET, async(err, user) => {
				if (err) 
					return  res.status(403).send({erno:9})
				else{
					const salt=await bcrypt.genSalt()
					const hspasswd = await bcrypt.hash(passwd, salt)
					db.query(`update user set passwd=? where email = ?`,[hspasswd, user.email], async(er,results)=>{
						if (er) res.status(500).send({erno:100})
						else return res.status(200).send({erno:10})
					})
				}
				
			})
		}		
	}
}

export function json(res,son){
	res.writeHead(200, {'Content-Type': 'application/json'});
	res.end(JSON.stringify(son));
}

export function generateAccessToken(user) {
	return jwt.sign(user, ACCESS_TOKEN_SECRET, { expiresIn: '45m' })
}

export const auth= (token) => {
	let result
	try {
		result=jwt.verify(token, ACCESS_TOKEN_SECRET) // FIXME: Get secret key from configuration
	} catch (err) {
		return null
	}
	if(result)
		return {name:result.name,email:result.email,avatar:result.avatar}
}

export const refreshToken= (refresh)=>{
	try{
		const {name, email,avatar}= jwt.verify(refresh, REFRESH_TOKEN_SECRET)
		const accessToken = generateAccessToken({name, email,avatar})
		return {name:name,email:email,avatar:avatar,auth:accessToken}
	}catch(err){
		return null		
	}
}