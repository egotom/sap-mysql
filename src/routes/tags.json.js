import db from '../mysql.js';

export function get(req, res) {
    if(req.query.cid){
        db.query(`SELECT id,title FROM tags WHERE id IN (
            SELECT tid FROM catalog_tag WHERE cid=?)`,[req.query.cid],(err,rst)=>{
            if(err) res.status(500).end() 
            else res.json(rst)
        })
    }else if(req.query.pid){
        db.query(`SELECT id,parent_id,name FROM res_industry`,(err,rst)=>{
            if(err)
                res.status(500).end()
            else
                res.json(rst)
        });
    }
    else{
        res.status(500).end()
    }
}