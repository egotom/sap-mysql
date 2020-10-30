<script>
    import {stores} from '@sapper/app'
    export let navs
    const { page } = stores()
    $: uri = $page.path.split('/')
    $: console.log($page)
    const current=(path)=>{
        let cr=[]
        for(let i in path){
            let nv=navs.find(n=>n.link===path[i])
            if(nv!==undefined && (nv.parent_id===0 || nv.parent_id===cr[cr.length-1].id))
                cr.push(nv)
        }
        return cr
    }

    const sub=(path)=>{
        let sb=[],cr=current(path)
        let pb=cr[cr.length-1]
        if(pb!==undefined)
            sb=navs.filter(n=>n.parent_id===pb.id)
        return sb
    }
</script>
<nav aria-label="breadcrumb ">
    <ol class="breadcrumb border mb-0">
        {#each current(uri) as {name,link}}
        <li class="breadcrumb-item"><a href="{$page.hsot}/{$page.path}/{link}"> {name} </a></li>
        {/each}
    </ol>
</nav>
{#if sub(uri).length>0 }
<div class="border rounded-lg shadow-sm p-3 mb-4 mt-0 bg-light">
    {#each sub(uri) as {name,link}}
        <a class:active="{1 === 2}" class="snl text-dark d-inline-block  mb-4 ml-3 pb-2" href="{$page.path}/{link} ">{name} </a>
    {/each}
</div>
{/if}
<style>
	.active{color: #007bff!important; border-bottom:1px solid #007bff;}
	.snl{font-size: 1.1em; font-weight: 500;border-bottom:1px solid #a7a7a7;}
	.snl:hover{text-decoration:none;color:#007bff!important;border-bottom:1px solid #007bff;}
</style>