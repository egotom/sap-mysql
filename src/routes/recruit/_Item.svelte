<script>
	export let it
</script>
<div class="border rounded-lg shadow-sm p-3 mb-4 mx-0">
	<div class="d-flex justify-content-between pt-3">
		<a class=" " href="recruit/{it.pid}"><h5>{it.title}</h5></a>
		<a class=" " href="recruit/{it.pid}"><h5>{it.owner}</h5></a>
	</div>
	<div class="d-flex justify-content-between pt-3">
		<p>12K-18K 上海-松江区 3-5年 本科</p>
		<div>
			<button type="submit" class="btn btn-primary btn-sm mb-2">收藏</button>
			<button type="submit" class="btn btn-primary btn-sm mb-2">申请职位</button>
		</div>
	</div>
	<div class="d-flex justify-content-between pt-3">
		<div>
			{#each it.tags as tag}
			<p class="p-1 mx-1 font-weight-light d-inline-block font-sm bg-light">{tag}</p>
			{/each}
		</div>
		<div>
			<p class="font-sm text-warning py-1">最新</p>
		</div>
	</div>
</div>

<style>
	
</style>

