<script>
	import Profile from '../../components/Profile.svelte';
	import SubNav from '../../components/SubNav.svelte';
	import { stores } from "@sapper/app";
    const {page} = stores();
	
</script>

<svelte:head>
	<title>热门</title>
</svelte:head>
<div class="row pt-3">
	<div class="col-lg-8 col-md-8 col-sm-12 px-md-2 px-sm-3 order-md-0 order-sm-1">
		<div class="d-flex justify-content-between px-3 mb-3">
			<h4>热门</h4>
			<a href=" ">更多热门</a>
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

	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 pt-md-5 pt-sm-0 px-md-5 px-sm-3 order-md-1 order-sm-0 mb-5">
		<div class="border rounded-lg shadow-sm p-3 mb-4 mt-md-1 mt-sm-0">
			<Profile />
		</div>
		<div><SubNav uri={$page}/></div>		

		<div class="border rounded-lg shadow-sm p-3 mb-4 mt-md-1 mt-sm-0 bg-light">
			<div class="d-flex justify-content-center">
				<div class="col-3 text-center">
					<h2 class="text-warning">这里应该有广告</h2>
				</div>	
			</div>
		</div>
	</div>
</div>

<style>

</style>

