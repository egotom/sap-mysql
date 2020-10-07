import db from '../../mysql.js';

export function get(req, res) {
	const { slug } = req.params;
	db.query(`select * from posts where slug= ?`, slug, (err,results)=>{
		if(err){
			console.log(err);
			res.sendStatus(500);
		}
		//console.log(results.length);
		if(results.length){
			res.writeHead(200, {'Content-Type': 'application/json'});
			res.end(JSON.stringify(results[0]));

		}else{			
			//console.log(JSON.stringify(results[0]));
			res.writeHead(404, {'Content-Type': 'application/json'});
			res.end(JSON.stringify({message: `Not found`}));
		}
	});
}