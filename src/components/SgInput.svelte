<script>
	export let sug,val
	let adv=true
	const suggest=(value)=>{
		val=value
		adv=true
	}

</script>

<div class="input-group">        
	<input class="form-control border-right-0"  type="text"
		on:focus={()=>adv=!adv}
		bind:value={val} />
	<div class="input-group-append">
		<button class="btn border-left-0 border " type="button" on:click="{()=>adv=!adv}">
		{#if adv}
			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
			</svg>
		{:else}
			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
			</svg>
		{/if}
		</button>
	</div>
	<div class:show="{adv}" class="dropmenu border shadow-sm rounded">
		<div class="list-group border-0">
			{#each sug as {id,title}}
			<a href="#{id}" on:click|preventDefault="{()=>suggest(title)}" class="border-0 list-group-item list-group-item-action">{title}</a>	
			{/each}	
		</div>
	</div>
</div>
<style>
.show{display: none;}
.dropmenu{
	width: 100%;
	position: absolute;
	z-index: 5;
	margin-top:38px;
}
</style>
