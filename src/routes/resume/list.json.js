import db from '../../mysql.js';

const get_ids = async(startIndex,limit)=>{
	try{
		const rows = await new Promise((res, rej) => {
			//  todo: 添加输出限制，防止爬虫
            db.query('SELECT id FROM product WHERE pub_catalog =2 ORDER BY update_at DESC LIMIT ?,?',[startIndex,3*limit+1], (err, row) => {
                if (err) return rej(err);
                res(row);
            })
        })
		return rows
	}catch (e) {
      console.log(JSON.stringify(e),'++++++++++++++++++')
    }
	
}
export function get(req, res) {
	const page = parseInt(req.query.page)
    const limit = 10
	//console.log(page, '++++++++++++++++++')
    const startIndex = (page - 1) * limit
	get_ids(startIndex,limit).then((ids)=>{
		let idx=[]
		for(let i in ids){
			idx.push(ids[i].id)
		}
		db.query(`SELECT p.id+105 AS pid ,0 AS nid, p.title, p.owner_id as vid, u.name FROM product p LEFT JOIN user u ON u.id=p.owner_id  
		WHERE p.id in (?)
		UNION
		
		SELECT pv.pid+105, pv.nid, an.name,pv.vid,pv.val FROM attribute_name an right JOIN (
		SELECT pa.pid ,pa.vid,av.nid,av.val from  product_attribute pa LEFT JOIN  attribute_value av ON pa.vid=av.id
		WHERE pa.pid IN (?)
		) pv ON pv.nid=an.id
		UNION 
		
		SELECT pt.pid+105 ,-1 AS nid, '' AS name, pt.tid, t.title from  product_tag pt LEFT JOIN tags t ON t.id=pt.tid
		WHERE pt.pid IN (?)`,[idx.slice(0,10),idx.slice(0,10),idx.slice(0,10)],  (err,rst)=>{
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
					res.json({its:ret,pgn:idx.length});
				}else{			
					res.status(404).end()
				}
			}
		})
	})
}