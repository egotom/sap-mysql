import db from '../mysql.js';

export function get(req, res) {
    if(req.query.area_code){
        db.query(`SELECT area_code,short_name FROM res_addr WHERE parent_code=?`,[req.query.area_code],(err,rst)=>{
            if(err) res.status(500).end() 
            else{
                // 北京，天津，上海，重庆
                if([110100000000,120100000000,310100000000,500100000000].indexOf(rst[0].area_code)<0)
                    res.json(rst)
                else                
                    db.query(`SELECT area_code,short_name FROM res_addr WHERE parent_code=?`,[rst[0].area_code],(err,rst2)=>{
                        if(err){
                            res.status(500).end()
                        }
                        
                        res.json(rst2)
                    });
            }
        });
    }else if(req.query.industry){
        db.query(`SELECT id,parent_id,name FROM res_industry`,(err,rst)=>{
            if(err)
                res.status(500).end()
            else
                res.json(rst)
        });
    }else if(req.query.job){
		db.query(`SELECT id ,parent_id, title as name from res_job`, (err,results)=>{
			if(err){
				console.log(err);
				res.status(500).end()
			}else{
				res.json(results);
			}
		})
	}else if(req.query.ijt){
        db.query(`SELECT 0 as s,id ,parent_id, title as name from res_job union 
        SELECT 1 as s, id,parent_id,name FROM res_industry UNION 
        SELECT 2,id,0,title FROM tags WHERE id IN (
                    SELECT tid FROM catalog_tag WHERE cid=2)`, (err,results)=>{
			if(err){
				console.log(err);
				res.status(500).end()
			}else{
                let jobs=[], idt=[], tags=[]
                for(let i in results){
                    if(results[i].s===0)
                        jobs.push({id:results[i].id, parent_id:results[i].parent_id, name:results[i].name})
                    if(results[i].s===1)
                        idt.push({id:results[i].id, parent_id:results[i].parent_id, name:results[i].name})
                    if(results[i].s===2)
                    tags.push({id:results[i].id, title:results[i].name})
                }
				res.json({jobs:jobs, idt:idt, tags:tags});
			}
		})
	}else{
        db.query(`SELECT area_code,short_name FROM res_addr WHERE LEVEL=0`,(err,rst)=>{
            if(err){
                res.status(500).end()
            }
            res.json(rst)
        });
    }
}