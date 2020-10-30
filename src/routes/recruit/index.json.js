import db from '../../mysql.js';

const related = async(pid)=>{
	const rows = await query('select * from im_user')
}
export function get(req, res) {	
	db.query(`SELECT p.id, p.owner_id,p.title,p.addr, u.name, pa.name AS attribute,pa.val FROM product p LEFT JOIN user u ON u.id=p.owner_id
	right JOIN (SELECT pa.pid,ab.name ,ab.val from product_attribute pa LEFT JOIN (
	SELECT av.id,av.val ,an.name from attribute_value av LEFT JOIN attribute_name an ON av.nid =an.id
	) AS ab ON ab.id=pa.vid ) AS pa ON pa.pid=p.id
	WHERE p.pub_catalog=?
	ORDER BY p.update_at desc`, [slug-105], (err,results)=>{
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