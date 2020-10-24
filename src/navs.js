const nav=(path)=>{
    console.log(JSON.stringify(path),'11111111111111111111111')
    let cr=[]
    for(let i in path){
        let nv=navs.find(n=>n.link==path[i])
        if(nv===undefined)
            nv=subNavs.find(n=>n.link==path[i])
        if(nv!==undefined)
            cr.push(nv)
    }
    return cr
}

const nav=(pb)=>{
    console.log(JSON.stringify(path),'22222222222222222222222')
    let sb=[]
    if(pb!==undefined)
        sb=subNavs.filter(n=>n.parent_id===pb.id)
    console.log(JSON.stringify({cr,sb}))
    return {cr,sb}
}



const current=(path)=>{
    console.log(JSON.stringify(path),'11111111111111111111111')
    let cr=[]
    for(let i in path){
        let nv=navs.mnv.find(n=>n.link==path[i])
        if(nv===undefined)
            nv=navs.snv.find(n=>n.link==path[i])
        if(nv!==undefined)
            cr.push(nv)
    }
    return cr
}

const sub=(path)=>{
    let sb=[],cr=[]
    for(let i in path){
        let nv=navs.find(n=>n.link==path[i])
        if(nv===undefined)
            nv=subNavs.find(n=>n.link==path[i])
        if(nv!==undefined)
            cr.push(nv)
    }
    let pb=cr[cr.length-1]
    if(pb!==undefined)
        sb=subNavs.filter(n=>n.parent_id===pb.id)
    console.log(JSON.stringify(sb))
    return sb
}