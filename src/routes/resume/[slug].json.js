import db from '../../mysql.js';

const related = async(pid)=>{
	const rows = await query('select * from im_user')
}
export function get(req, res) {	
	const { slug } = req.params;
	if(req.query.attr){
		db.query(`SELECT an.id AS aid,an.name, av.id AS vid, av.val from attribute_value av  
		LEFT JOIN attribute_name an ON an.id=av.nid 
		WHERE av.id IN (SELECT vid FROM product_attribute WHERE pid=?)
		UNION
		SELECT 0 AS aid, ' ' AS name, t.id AS vid, t.title AS val  
		FROM product_tag pt LEFT JOIN tags t ON t.id=pt.tid WHERE pt.pid=?
		UNION
		(SELECT -1 AS aid, ' ' AS name , p.id+105 AS vid,  p.title AS val   FROM product p 
		inner JOIN product pp ON p.pub_catalog=pp.pub_catalog 
		WHERE  pp.id=? AND p.owner_id=pp.owner_id AND p.id != ? limit 10);`, [slug-105, slug-105, slug-105, slug-105], (err,results)=>{
			if(err){
				console.log(err);
				res.status(500).end()
			}else{
				if(results.length){
					res.json(results);
				}else{			
					res.status(404).end()
				}
			}
		})
	}else if(req.query.rel){
		db.query(`SELECT an.id AS aid,an.name, av.id AS vid, av.val from attribute_value av  
		LEFT JOIN attribute_name an ON an.id=av.nid 
		WHERE av.id IN (SELECT vid FROM product_attribute WHERE pid=?)
		UNION
		SELECT 0 AS aid, '职位福利' AS name, t.id AS vid, t.title AS val  
		FROM product_tag pt LEFT JOIN tags t ON t.id=pt.tid WHERE pt.pid=?;`, [slug-105, slug-105], (err,results)=>{
			if(err){
				console.log(err);
				res.status(500).end()
			}else{
				if(results.length){
					res.json(results);
				}else{			
					res.status(404).end()
				}
			}
		})
	}else{
		db.query(`SELECT p.id, p.owner_id, u.NAME AS owner, p.pub_catalog, p.prv_catalog, p.title,p.html, 
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
}