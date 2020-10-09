<script>
	export let segment;
</script>
<nav class="bg-white collapse navbar-collapse d-flex flex-column flex-lg-row flex-xl-row justify-content-lg-start mobileMenu">
	<div class="pt-md-2 pt-lg-2 pt-sm-5">
	  <ul class="nav flex-column">
		<li class="nav-item">
			<a class="nav-link" aria-current="{segment === undefined ? 'page' : undefined}" href=".">home</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" aria-current="{segment === 'about' ? 'page' : undefined}" href="about">about</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" rel=prefetch aria-current="{segment === 'blog' ? 'page' : undefined}" href="blog">blog</a>
		</li>
	  </ul>
	</div>
</nav>
<style>

</style>
