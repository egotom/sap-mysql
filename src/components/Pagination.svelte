<script>
    import { onMount } from 'svelte';
    export let pgn,handler
    $: p1=0
    $: p2=0
    $: p3=0
    $: cp=0

    onMount(() => {
		if(cp===0){
            if(pgn<11 && pgn>0){
                cp=1;p1=1;p2=0;p3=0
            }
            if(pgn<21 && pgn>10){
                cp=1;p1=1;p2=2;p3=0
            }
            if(pgn>21){
                cp=1;p1=1;p2=2;p3=3
            }
        }         
        
    })
    
    const pgnv=(pg)=>{   
        cp=pg        
        handler(pg)
        if(p3>0 && cp > p3 && pgn>0){    
            if(pgn<10){
                p1=cp;p2=0;p3=0
            }        
            if(pgn<21 && pgn>10){
                p1=cp;p2=cp+1;p3=0
            }
            if(pgn>21){
                p1=cp;p2=cp+1;p3=cp+2;                
            }
        }
        if(p1>3 && cp < p1){            
            p1=cp-2;p2=cp-1;p3=cp
        }
        if(p1<4 && cp < p1){
            p1=1;p2=2;p3=3
        }
        //console.log(p1, p2, p3,cp,pgn,'--------------------')
    }

</script>

<div class="d-flex justify-content-center">
<nav aria-label="Page navigation example">
    <ul class="pagination">
        {#if cp>1}
        <li class="page-item" ><a class="page-link" href=" " on:click|preventDefault="{()=>pgnv(cp-1)}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
        {/if}
        {#if p1>0}
        <li class="page-item" class:active={p1==cp}><a class="page-link" href=" " on:click|preventDefault="{()=>pgnv(p1)}">{p1}</a></li>
        {/if}
        {#if p2>0}
        <li class="page-item" class:active={p2==cp}><a class="page-link" href=" " on:click|preventDefault="{()=>pgnv(p2)}">{p2}</a></li>
        {/if}
        {#if p3>0}
        <li class="page-item" class:active={p3==cp}><a class="page-link" href=" " on:click|preventDefault="{()=>pgnv(p3)}">{p3}</a></li>
        {/if}
        {#if cp<p3 || (pgn>0 && cp==p3)}
        <li class="page-item"><a class="page-link" href=" " on:click|preventDefault="{()=>pgnv(cp+1)}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
        {/if}
    </ul>
</nav>
</div>

<style>

</style>