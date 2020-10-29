import db from '../../mysql.js';

export function get(req, res) {	
	const { slug } = req.params;
	db.query(`SELECT p.id, p.owner_id, u.NAME AS owner, p.pub_catalog, p.prv_catalog, p.title, p.html, 
	DATE_FORMAT(p.update_at,'%Y/%m/%d') as update_at, p.create_at 
	from product p LEFT JOIN user u ON p.owner_id=u.id
	WHERE p.id=?`, [slug-105], (err,results)=>{
		if(err){
			console.log(err);
			res.status(500).end()
		}else{
			if(results.length){
				res.json(results[0]);
			}else{			
				res.status(404).end()
			}
		}
	})
}