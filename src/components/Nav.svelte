<script>
	export let segment;
</script>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
	<div class="sidebar-sticky pt-3">
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

	  <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		<span>Saved reports</span>
		<a class="d-flex align-items-center text-muted" href=" " aria-label="Add a new report">
		  <span data-feather="plus-circle"></span>
		</a>
	  </h6>
	  <ul class="nav flex-column mb-2">
		<li class="nav-item">
		  <a class="nav-link" href=" ">
			<span data-feather="file-text"></span>
			Current month
		  </a>
		</li>
	  </ul>
	</div>
</nav>

<style>
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 5rem;
  }
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

.sidebar-heading {
  font-size: .75rem;
  text-transform: uppercase;
}
</style>
