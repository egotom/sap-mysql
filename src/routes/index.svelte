<script>
	let caret=true
	const op_caret=()=>caret=!caret
</script>

<svelte:head>
	<title>贝拉-热门</title>
</svelte:head>

<div class="d-flex justify-content-between px-3 ">
	<h4 class='mb-4'>即时 | 热门</h4>
	<a href="#focus" on:click="{op_caret}" data-toggle="collapse" >我的关注
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
		<div class="custom-control custom-checkbox py-3 pl-5 pr-3 bg-light mb-2 d-flex justify-content-between">
			<input type="checkbox" class="custom-control-input" id="customCheck3">
			<label  class="custom-control-label text-primary " for="customCheck3">党纪国法的两个劳动法日机构热特热给你大幅拉升放假啦空手道大师傅但是</label>
			<a href=" " class="text-warning font-weight-bold d-inline-block pl-2 cros " data-toggle="tooltip" data-placement="top" title="不再关注此目录">&#10005</a>
		</div>
	</div>
</div>
<div class="row border rounded-lg shadow-sm p-3 mb-4">
	<div class="col-9">
		<h2>Heading</h2>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
		<p><a class=" " href=" " role="button">View details &raquo;</a></p>
	</div>
	<div class="col-3 text-center">
		<svg class="bd-placeholder-img rounded-lg mt-3 img-fluid" width="150" height="150" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
	</div>				
</div>
<div class="row border rounded-lg shadow-sm p-3 mb-4">
	<div class="col-9">
		<h2>Heading</h2>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
		<p><a class=" " href=" " role="button">View details &raquo;</a></p>
	</div>
	<div class="col-3 text-center">
		<svg class="bd-placeholder-img rounded-lg mt-3 img-fluid" width="150" height="150" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
	</div>				
</div>
<div class="row border rounded-lg shadow-sm p-3 mb-4 ">
	<div class="col-9">
		<h2>Heading</h2>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
		<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
		<p><a class=" " href=" " role="button">View details &raquo;</a></p>
	</div>
	<div class="col-3 text-center">
		<svg class="bd-placeholder-img rounded-lg mt-3 img-fluid" width="150" height="150" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
	</div>				
</div>

<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">
			<a class="page-link" href=" " aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
			</li>
			<li class="page-item"><a class="page-link" href=" ">1</a></li>
			<li class="page-item"><a class="page-link" href=" ">2</a></li>
			<li class="page-item"><a class="page-link" href=" ">3</a></li>
			<li class="page-item">
			<a class="page-link" href=" " aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
			</li>
		</ul>
	</nav>
</div>
<style>
	.cros{font-size: large;}
</style>

