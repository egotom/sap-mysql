<script>
    export let pgn
    let p1=1,p2=2,p3=3
    
</script>

<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
            {#if pgn.previous}
            <li class="page-item" ><a class="page-link" href=" " aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            {/if}
			<li class="page-item" class:active={p1==pgn.cp}><a class="page-link" href=" ">{p1}</a></li>
			<li class="page-item" class:active={p2==pgn.cp}><a class="page-link" href=" ">{p2}</a></li>
            <li class="page-item" class:active={p3==pgn.cp}><a class="page-link" href=" ">{p3}</a></li>
            {#if pgn.next}
            <li class="page-item"><a class="page-link" href=" " aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            {/if}
		</ul>
	</nav>
</div>

<style>

</style>