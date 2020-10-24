import db from '../mysql.js';

export function get(req, res) {
	db.query(`select id,parent_id,name,link from catalog where owner_id=0 order by rank desc`,(err,rst)=>{
		if(err){
            res.status(500).end()
        }
        //console.log(JSON.stringify(rst))
        //const mnv=rst.filter(r=>r.parent_id===0)
        //const snv=rst.filter(r=>r.parent_id>0)
        res.json(rst)
	});
}