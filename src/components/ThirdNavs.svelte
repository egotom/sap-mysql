<script>
    export let tnvs, onSelect,label
    let pnv=tnvs.filter(i=>i.parent_id===0)
    //console.log(JSON.stringify(pnv[0].name))
    let sub=[],s2=[],s3=[],s4=[],s5=[]
    let ni, si, i2, i3, i4, i5
    let container
    const onNext=(l,id)=>{
        onSelect(id)  
        const child = document.createElement('div');
		child.textContent = 'child';
        child.className = "border-top";
        child.className = "border-warning";
        child.className = "pt-2";
		console.log(child.getAttribute('class'))
		container.appendChild(child);
        //s2=[],s3=[],s4=[],s5=[],s6=[]
        //si=undefined, i2=undefined, i3=undefined, i4=undefined, i5=undefined
        //sub=tnvs.filter(n=>n.parent_id===id)
        //ni=id
//
    }
</script>

{#if pnv.length>0}
<div class="bg-light p-3 rounded mt-3" bind:this={container}>
    <span class="mt-1 font-weight-bold">{label}：</span>
    <a href=" " class:active="{ni == undefined}" class="text-dark d-inline-block py-1 pr-5 mnv">不限</a>
    {#each pnv as  {id,name}  }
    <a href=" " on:click|preventDefault="{()=>onNext(1, id)}" class:active="{si == id}" class="text-dark d-inline-block py-1 pr-3 mnv ">{name}</a>	
    {/each}

    <div class="border-top border-warning pt-2">
        <a href=" " class:active="{si == undefined}" class="text-dark d-inline-block py-1 pr-3 mnv">不限</a>
        {#each  sub as {id,name}}
        <a href=" " class:active="{si == id}" class="text-dark d-inline-block py-1 pr-3 mnv" on:click|preventDefault="{()=>onNext(2,id)}" >{name}</a>
        {/each}
    </div>

</div>
{/if}

<style>
    .mnv:hover{text-decoration:none; color:#007bff!important;}
	.active{color:#007bff!important;}
</style>