import db from '../../mysql.js';

const get_ids = async(startIndex,limit)=>{
	try{
		const rows = await new Promise((res, rej) => {
            db.query('SELECT id FROM product WHERE pub_catalog =2 ORDER BY update_at DESC LIMIT ?,?',[startIndex,3*limit], (err, row) => {
                if (err) return rej(err);
                res(row);
            })
        })
		//console.log(rows,'-----------------------')
		return rows
	}catch (e) {
      console.log(JSON.stringify(e),'++++++++++++++++++')
    }
	
}
export function get(req, res) {
	const page = parseInt(req.query.page)
    const limit = parseInt(req.query.limit)

    const startIndex = (page - 1) * limit
    const endIndex = page * limit
	get_ids(startIndex,limit).then((ids)=>{
		console.log(ids,'-----------------------')
	})
	
    const results = {}
	db.query(`SELECT p.id+105 AS pid ,0 AS nid, p.title, p.owner_id as vid, u.name FROM product p LEFT JOIN user u ON u.id=p.owner_id  
	WHERE p.pub_catalog=2
	UNION
	
	SELECT pv.pid+105, pv.nid, an.name,pv.vid,pv.val FROM attribute_name an right JOIN (
	SELECT pa.pid ,pa.vid,av.nid,av.val from  product_attribute pa LEFT JOIN  attribute_value av ON pa.vid=av.id
	WHERE pa.pid IN(SELECT id FROM product WHERE pub_catalog=2) 
	) pv ON pv.nid=an.id
	UNION 
	
	SELECT pt.pid+105 ,-1 AS nid, '' AS name, pt.tid, t.title from  product_tag pt LEFT JOIN tags t ON t.id=pt.tid
	WHERE pt.pid IN(
	SELECT id FROM product WHERE pub_catalog=2);`,  (err,rst)=>{
		if(err){
			console.log(err);
			res.status(500).end()
		}else{
			if(rst.length){
				let ret=[], rs=rst, done=[]
				for(let i in rst){					
					if(done.indexOf(rst[i].pid)>-1) continue
					let it={pid:rst[i].pid,title:"",tags:[],attr:[]}
					for(let j in rs){
						if(rst[i].pid===rs[j].pid){
							if(rs[j].nid===0) {
								it.title=rs[j].title
								it.owner=rs[j].name
								it.owner_id=rs[j].vid
							}
							else if(rs[j].nid===-1) it.tags.push(rs[j].name)
							else it.attr.push({nid:rs[j].nid, n:rs[j].title,v:rs[j].name,vid:rs[j].vid})
						}
					}
					done.push(rst[i].pid)
					ret.push(it)
				}
				res.json(ret);
			}else{			
				res.status(404).end()
			}
		}
	})
}