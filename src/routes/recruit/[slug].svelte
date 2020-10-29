<script context="module">
	export async function preload({ params }) {
		// the `slug` parameter is available because
		// this file is called [slug].svelte
		//console.log(JSON.stringify(params))
		const res = await this.fetch(`recruit/${params.slug}.json`);
		console.log(JSON.stringify(res))
		const data = await res.json();
		if (res.status === 200) {
			return { post: data };
		} else {
			this.error(res.status, data.message);
		}
	}
</script>

<script>
	export let post;
</script>


<svelte:head>
	<title>{post.title}</title>
</svelte:head>

<div class="pt-4 ">		
	<h3 class="text-center">{post.title}</h3>
	<p class="text-center pb-4 text-info"><span class="d-inline-block pr-3"> 更新于：{post.update_at}</span> 发布者：<a href=" ">{post.owner}</a> </p>
</div>
<div class="row my-2">
	<div class="col-6">
		<h3 class="text-danger font-weight-bold">1万-1.5万</h3>
		<p>上海松江区.车墩 | 经验不限 | 本科 | 全职 | 招1人</p>
	</div>
	<div class="col-6 align-self-end text-right">
		<button type="submit" class="btn btn-primary mb-2">收藏</button>
		<button type="submit" class="btn btn-primary mb-2">申请职位</button>
	</div>
</div>
<div class="py-4 px-2 bg-light rounded">
	<!--p class="font-weight-light text-info ml-2 ">该作者发布的其他职位：</p-->
	<a href=" " class="d-inline-block mx-2">项目经理</a>
	<a href=" " class="d-inline-block mx-2">Java资深开发</a>
	<a href=" " class="d-inline-block mx-2">项目经理</a>
	<a href=" " class="d-inline-block mx-2">Java资深开发</a>
	<a href=" " class="d-inline-block mx-2">项目经理</a>
	<a href=" " class="d-inline-block mx-2">Java资深开发</a>
</div>
<h5 class="pt-4 mb-0 pb-0 text-info">职位描述：</h5>
<hr class="mt-2 pt-0">
<div class="pt-1">
	{@html post.html}
</div>
<h5 class="pt-4 mb-0 pb-0 text-info">职位福利：</h5>
<hr class="mt-2 pt-0">

<h5 class="pt-4 mb-0 pb-0 text-info">工作地点：</h5>
<hr class="mt-2 pt-0">

<h5 class="pt-4 mb-0 pb-0 text-info">相似职位：</h5>
<hr class="mt-2 pt-0">
<style>

</style>
