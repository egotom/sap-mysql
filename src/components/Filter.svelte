<script>
	let caret=true
	const op_caret=()=>caret=!caret
</script>
<div class="d-flex justify-content-between px-3 mb-3">
	<h4> </h4>
	<a href="#focus" on:click="{op_caret}" data-toggle="collapse">我的关注
		{#if caret}
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
		</svg>
		{:else}
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
		</svg>
		{/if}
	</a>
</div>
<div class="collapse row mb-3" id="focus">
	<div class="card card-body bg-white">
		<div class="custom-control custom-checkbox py-3 pl-5 pr-3 mb-2 d-flex justify-content-end">
			<input type="checkbox" class="custom-control-input cros" id="customCheck3">
			<label  class="custom-control-label text-warning cros" for="customCheck3">关注本目录</label>
        </div>
        <slot><em>no content was provided</em></slot>
	</div>
</div>