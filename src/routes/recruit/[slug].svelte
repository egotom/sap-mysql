<script context="module">
	export async function preload({ params }) {
		let exp='', edu='', count='', wages='', welfare=[], other=[],related=[]
		const res = await this.fetch(`recruit/${params.slug}.json`);
		const data = await res.json();
		const res2 = await this.fetch(`recruit/${params.slug}.json?attr=1`);
		const data2 = await res2.json();
		if (res.status === 200 && res2.status === 200) {
			for(let i in data2){
				if(data2[i].aid===5)
					count=' | 招'+data2[i].val
				if(data2[i].aid===2)
					exp=' | '+data2[i].val+'工作经验'
				if(data2[i].aid===1)
					wages=data2[i].val
				if(data2[i].aid===3)
					edu=' | '+data2[i].val+'学历'
				if(data2[i].aid===0)
					welfare.push(data2[i].val)
				if(data2[i].aid===-1)
					other.push({id:data2[i].vid, val:data2[i].val})
			}
			return { post: data , exp, edu, count, wages, welfare, other,related};
		} else {
			this.error(res.status, data.message);
		}
	}
</script>

<script>
	export let post, exp, edu, count, wages, welfare, other, related
	import Item from './_Item.svelte'
	let map=true
	let addr=JSON.parse(post.addr)
	const getAddr=(ad)=>{
		let ret=''
		for(let i in ad){
			ret+=ad[i].l+', '
		}
		return ret.substr(0,ret.length-2)
	}
</script>

<svelte:head>
	<title>{post.title}</title>
</svelte:head>

<div class="pl-sm-3 pl-md-0">
<div class="pt-4 ">		
	<h5 class="text-center">{post.title}</h5>
	<p class="text-center pb-4 text-warning font-sm"><span class="d-inline-block pr-3"> 更新于：{post.update_at}</span> 发布者：<a href=" ">{post.owner}</a> </p>
</div>
<div class="d-flex justify-content-between">
	<div>
		<h3 class="text-warning font-weight-bold">{wages}</h3>
		<p>{getAddr(addr)} {exp} {edu} {count}</p>
	</div>
	<div class="align-self-end text-right">
		<button type="submit" class="btn btn-primary btn-sm mb-2">收藏</button>
		<button type="submit" class="btn btn-primary btn-sm mb-2">申请职位</button>
	</div>
</div>
<div class="py-4 px-2 bg-light rounded">
	<!--p class="font-weight-light text-info ml-2 ">该作者发布的其他职位：</p-->
	{#each other as {id,val}}
	<a href="recruit/{id}" class="d-inline-block mx-2">{val}</a>
	{/each}
</div>
<p class="pt-5 mb-0 pb-0 font-weight-bold">职位描述：</p>
<hr class="mt-2 pt-0">
<div class="pt-1">
	{@html post.html}
</div>
<p class="pt-5 mb-0 pb-0 font-weight-bold">职位福利：</p>
<hr class="mt-2 pt-0">
<div class="py-4 px-2 bg-light rounded">
	{#each welfare as wf}
		<span class="d-inline-block mx-2 text-warning font-weight-bold">{wf}</span>
	{/each}
</div>
<p class="pt-5 mb-0 pb-0 font-weight-bold">工作地点：</p>
<hr class="mt-2 pt-0">
<div class="d-flex justify-content-between">
	<p>
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-map-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.502.502 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5V.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.498.498 0 0 0-.196 0L5 14.09zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1-.5-.1z"/>
		</svg>
	  	{getAddr(addr)}
	</p>

	<p>
		<a href=" " on:click|preventDefault="{()=>map=!map}">查看地图
		{#if map}
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
		</svg>
		{:else}
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
		</svg>
		{/if}
		</a>
	</p>
</div>

<p class="pt-5 mb-4 pb-0 font-weight-bold">相似职位：</p>
{#each [1,2,3] as i}
	<Item {i} />
{:else}
	<p class="font-weight-light text-warning">加载中 ... </p>
{/each}
</div>

<style>

</style>
