import db from '../mysql.js';

export function get(req, res) {
    if(req.query.area_code){
        db.query(`SELECT area_code,short_name FROM res_cn WHERE parent_code=?`,[req.query.area_code],(err,rst)=>{
            if(err) res.status(500).end() 
            else{
                // 北京，天津，上海，重庆
                if([110100000000,120100000000,310100000000,500100000000].indexOf(rst[0].area_code)<0)
                    res.json(rst)
                else                
                    db.query(`SELECT area_code,short_name FROM res_cn WHERE parent_code=?`,[rst[0].area_code],(err,rst2)=>{
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
    }
    else{
        db.query(`SELECT area_code,short_name FROM res_cn WHERE LEVEL=0`,(err,rst)=>{
            if(err){
                res.status(500).end()
            }
            //console.log(JSON.stringify(rst))
            //const mnv=rst.filter(r=>r.parent_id===0)
            //const snv=rst.filter(r=>r.parent_id>0)
            res.json(rst)
        });
    }
}