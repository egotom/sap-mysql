<script>
	export let segment;
</script>
<nav class="col-md-3 col-lg-2 col-sm-6 d-md-block bg-white sidebar pt-5 pl-0">
	<div class="sidebar-sticky pt-md-3 pt-sm-5">
		<ul class="position-absolute nav flex-column pt-4">
			<li><a class:active="{segment === undefined}" class="nav-link active pl-4 py-3"  href=".">热门</a></li>
			<li><a class:active="{segment === 'about'}" class="nav-link pl-4 py-3" href="about">关于我们</a></li>
			<li><a class:active="{segment === 'blog'}" class="nav-link pl-4 py-3" rel=prefetch href="blog">博客</a></li>
		</ul>
	</div>
</nav>
<style>
	.active{
		background-color: rgb(227, 225, 252);
		color:rgb(5, 5, 202)!important;
		min-width: 200px;
		border-top-right-radius: 3em 3em;
		border-bottom-right-radius: 3em 3em;
		font-weight: 800;
	}
	.nav-link{font-size: 1em;}
	.sidebar {
		position: fixed;
		top: 0;
		bottom: 0;
		left: 0;
		z-index: 200; /* Behind the navbar */
	}

	.sidebar-sticky {
		position: relative;
		top: 0;
		height: calc(100vh - 48px);
		padding-top: .5rem;
		overflow-x: hidden;
		overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
	}
	@supports ((position: -webkit-sticky) or (position: sticky)) {
	.sidebar-sticky {
		position: -webkit-sticky;
		position: sticky;
	}
	}
	.sidebar .nav-link {
		font-weight: 500;
		color: #333;
	}
</style>
