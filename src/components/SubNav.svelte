<script>
    export let uri, navs, subNavs
    console.log(JSON.stringify(subNavs),'++++++++++++++++++')

    const bread=new Map(
        [["", "热门"], ["hr", "人力资源"], ["rental", "出租-招租"], ["sale", "出售"], ["want", "求购"], ["others", "其它"], 
        ["resume", "简历"], ["hr", "人力资源"]]);
    let m =[]
    if(uri !== undefined) {m=uri.path.split('/');}
</script>

{#if uri!==undefined}
<nav aria-label="breadcrumb ">
    <ol class="breadcrumb border mb-0">
        {#each m as key}
        <li class="breadcrumb-item"><a href="{uri.path.split(key)[0]+key}">{bread.get(key)}</a></li>
        {/each}
    </ol>
</nav>
<div class="border rounded-lg shadow-sm p-3 mb-4 mt-0 bg-light">
    <span class="d-inline-block border-bottom mb-4"> 
        <a class:active="{1 === 2}" class="snl text-dark d-inline-block ml-3 pb-2" href="{uri.path}/resume">简历</a> </span>
</div>
{/if}
<style>
	.active{color: #007bff!important; border-bottom:2px solid #007bff;}
	.snl{font-size: 1.1em; font-weight: 500;}
	.snl:hover{text-decoration:none;color:#007bff!important;border-bottom:2px solid #007bff;}
</style>