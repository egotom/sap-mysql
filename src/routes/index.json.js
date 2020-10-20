import db from '../mysql.js';

export function get(req, res) {
	db.query(`select parent_id,name,link from catalog where owner_id=0 order by rank desc`,(err,rst)=>{
		if(err){
            res.status(500).end()
        }
        //console.log(rst)
        const navs=rst.filter(r=>r.parent_id===0)
        const subNavs=rst.filter(r=>r.parent_id>0)
        res.status(200).json({navs:navs,subNavs:subNavs})
	});
}