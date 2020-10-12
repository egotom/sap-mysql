import db from '../mysql.js';

export function get(req, res) {
	db.query(`select * from posts`,(err,results)=>{
		if(err){
			res.sendStatus(500);
		}
		res.writeHead(200, {'Content-Type': 'application/json'});
		res.end(JSON.stringify(results));
	});
}