
const mysql=require('mysql');
const pool=mysql.createPool({
	connectionLimit:10,
	password:'v',
	user:'root',
	database:'air_compressor',
	host:'localhost',
	port:'3306'
});
module.exports=pool;