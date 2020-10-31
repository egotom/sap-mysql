<script>
    export let tnvs, onSelect,label
    let pnv=tnvs.filter(i=>i.parent_id===0)
    //console.log(JSON.stringify(pnv[0].name))
    let sub=[],s2=[],s3=[],s4=[],s5=[]
    let ni, si, i2, i3, i4, i5
    const onNext=(l,id)=>{
        onSelect(id)        
        if(l===1) {
            s2=[],s3=[],s4=[],s5=[],s6=[]
            si=undefined, i2=undefined, i3=undefined, i4=undefined, i5=undefined
            sub=tnvs.filter(n=>n.parent_id===id)
            ni=id
        }
        if(l===2) {
            s3=[],s4=[],s5=[],s6=[]
            i2=undefined, i3=undefined, i4=undefined, i5=undefined
            s2=tnvs.filter(n=>n.parent_id===id)
            si=id
        }
        if(l===3) {
            s4=[],s5=[],s6=[]
            i3=undefined, i4=undefined, i5=undefined
            s3=tnvs.filter(n=>n.parent_id===id)
            i2=id
        }
        if(l===4) {
            s5=[],s6=[]
            i4=undefined, i5=undefined
            s4=tnvs.filter(n=>n.parent_id===id)
            i3=id
        }
        if(l===5) {
            s6=[]
            i5=undefined
            s5=tnvs.filter(n=>n.parent_id===id)
            i4=id
        }
        if(l===6) {
            s6=tnvs.filter(n=>n.parent_id===id)
            i5=id
        }
    }
</script>

{#if pnv.length>0}
<div class="bg-light p-3 rounded mt-3" >
    <span class="mt-1 font-weight-bold">{label}：</span>
    <a href=" " class:active="{ni == undefined}" class="text-dark d-inline-block py-1 pr-5 mnv">不限</a>
    {#each pnv as  {id,name}  }
    <a href=" " on:click|preventDefault="{()=>onNext(1, id)}" class:active="{si == id}" class="text-dark d-inline-block py-1 pr-3 mnv ">{name}</a>	
    {/each}

    {#if sub.length>0}
    <div class="border-top border-warning pt-2">
        <a href=" " class:active="{si == undefined}" class="text-dark d-inline-block py-1 pr-3 mnv">不限</a>
        {#each  sub as {id,name}}
        <a href=" " class:active="{si == id}" class="text-dark d-inline-block py-1 pr-3 mnv" on:click|preventDefault="{()=>onNext(2,id)}" >{name}</a>
        {/each}
    </div>
    {/if}

    {#if s2.length>0}
    <div class="border-top border-warning pt-2">
        <a href=" " class:active="{i2 == undefined}" class="text-dark d-inline-block py-1 pr-3 mnv">不限</a>
        {#each  s2 as {id,name}}
        <a href=" " class:active="{i2 == id}" class="text-dark d-inline-block py-1 pr-3 mnv" on:click|preventDefault="{()=>onNext(3,id)}" >{name}</a>
        {/each}
    </div>
    {/if}

    {#if s3.length>0}
    <div class="border-top border-warning pt-2">
        <a href=" " class:active="{i3 == undefined}" class="text-dark d-inline-block py-1 pr-3 mnv">不限</a>
        {#each  s3 as {id,name}}
        <a href=" " class:active="{i3 == id}" class="text-dark d-inline-block py-1 pr-3 mnv" on:click|preventDefault="{()=>onNext(4,id)}" >{name}</a>
        {/each}
    </div>
    {/if}


    {#if s4.length>0}
    <div class="border-top border-warning pt-2">
        <a href=" " class:active="{i4 == undefined}" class="text-dark d-inline-block py-1 pr-3 mnv">不限</a>
        {#each  s4 as {id,name}}
        <a href=" " class:active="{i4 == id}" class="text-dark d-inline-block py-1 pr-3 mnv" on:click|preventDefault="{()=>onNext(5,id)}" >{name}</a>
        {/each}
    </div>
    {/if}

    {#if s5.length>0}
    <div class="border-top border-warning pt-2">
        <a href=" " class:active="{i5 == undefined}" class="text-dark d-inline-block py-1 pr-3 mnv">不限</a>
        {#each  s5 as {id,name}}
        <a href=" " class:active="{i5 == id}" class="text-dark d-inline-block py-1 pr-3 mnv" on:click|preventDefault="{()=>onNext(6,id)}" >{name}</a>
        {/each}
    </div>
    {/if}

</div>
{/if}

<style>
    .mnv:hover{text-decoration:none; color:#007bff!important;}
	.active{color:#007bff!important;}
</style>