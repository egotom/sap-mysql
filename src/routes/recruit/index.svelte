<script context="module">
	export async function  preload() {
        let pvc=[],idt=[],tags=[],its=[],jobs=[]
        const res = await this.fetch(`res.json`)
        if (res.status === 200) {
			pvc = await res.json();			
        }
		let res4 = await this.fetch(`recruit/list.json`)
        if (res4.status === 200) {
			its = await res4.json();			
		}
		res4 = await this.fetch(`res.json?ijt=1`)
        if (res4.status === 200) {
			let a = await res4.json();	
			jobs=a.jobs
			idt=a.idt
			tags=a.tags
        }
        return { pvc,idt,tags,its,jobs};
	}
</script>

<script>
	import {stores} from '@sapper/app'
    import { getContext } from 'svelte'
	import Item from './_Item.svelte'
	import ThirdNav from '../../components/ThirdNav.svelte'
	export let pvc,idt,tags,its,jobs
    let caret=true, city=[], dist=[],sidt=[],job2=[],job3=[],job4=[]
    let pc=undefined, cc=undefined, dc=undefined
    let pay=["1K以下","1K-2K","2K-4K","4K-6K","6K-8K","8K-10K","10K-15K","15K-25K","25K-35K","35K-50K","50K以上"]
	const navs$ = getContext('navs')
  	$: navs = $navs$
	//$: console.log(JSON.stringify(jobs))

	const { page } = stores()
	//$: console.log($page)
	$: uri = $page.path.split('/')
	
	const current=(path)=>{
        let cr=[]
        for(let i in path){
            let nv=navs.find(n=>n.link===path[i])
            if(nv!==undefined && (nv.parent_id===0 || nv.parent_id===cr[cr.length-1].id))
                cr.push(nv)
        }
        return cr[cr.length-1].name
    }

    const ntl=(l,ac)=>{        
        if(l===1) pc=ac
        else if(l===2) cc=ac
        else  dc=ac
        if(ac!==undefined)
            fetch(`res.json?area_code=`+ac).then(r => r.json()).then(ct => {
                if(l==1){
					dist=[]
					city=ct
				}                    
                if(l==2)
                    dist=ct
			})       
        console.log(pc,cc,dc)
    }
    const inl=(id)=>{
        sidt=idt.filter(i=>i.parent_id===id)
	}
	const onSelect=(id)=>{
		console.log(id,'-------------fdgdfg--------------')
	}
</script>

<svelte:head>
	<title>贝拉-{current(uri)}</title>
</svelte:head>

<div class="d-flex justify-content-between px-3 mb-3">
	<h4>{current(uri)}</h4>
	<a href="#focus" on:click|preventDefault="{()=>caret=!caret}" data-toggle="collapse">
		{#if caret}
		收起筛选条件
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
		</svg>
		{:else}
		筛选职位
		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
		</svg>
		{/if}
	</a>
</div>
<div class="collapse show row mb-3" id="focus">
	<div class="card card-body bg-white">
		<div class="custom-control custom-checkbox pb-3 pl-5 pr-3 d-flex justify-content-end">
			<input type="checkbox" class="custom-control-input cros" id="customCheck3">
			<label  class="custom-control-label text-warning cros" for="customCheck3">关注本目录</label>
		</div>
		<div class="bg-light p-3 rounded">
		<div>
            <span class="mt-1 font-weight-bold ">地点：</span>
            <a href=" " on:click|preventDefault="{()=>ntl(1,undefined)}" class:active="{pc == undefined}"  class="d-inline-block text-dark py-2 pr-3 mnv ">不限</a>
			{#each pvc as {area_code,short_name}}
			<a href=" " class:active="{area_code == pc}" on:click|preventDefault="{()=>ntl(1,area_code)}" class="d-inline-block text-dark py-2 pr-3 mnv ">{short_name}</a>
			{/each}		
        </div>

        {#if city.length>1}
		<div class="border-top border-warning pt-2">
            <a href=" " on:click|preventDefault="{()=>ntl(2,undefined)}" class:active="{cc === undefined}"  class="d-inline-block text-dark py-2 pr-3 mnv ">不限</a>
            {#each city as {area_code,short_name}}
			<a href=" " class:active="{area_code == cc}" on:click|preventDefault="{()=>ntl(2,area_code)}" class="text-dark d-inline-block py-1 pr-3 mnv">{short_name}</a>
			{/each}
        </div>
        {/if}
        {#if dist.length>1}
		<div class="border-top border-warning pt-2">
            <a href=" " on:click|preventDefault="{()=>ntl(3,undefined)}" class:active="{dc === undefined}"  class="d-inline-block text-dark py-2 pr-3 mnv ">不限</a>
            {#each dist as {area_code,short_name}}
            <a href=" " on:click|preventDefault="{()=>ntl(3,undefined)}" class:active="{area_code === dc}" class="text-dark d-inline-block py-1 pr-3 mnv active">{short_name}</a>
            {/each}
        </div>
        {/if}
		</div>
		<ThirdNav tnvs={jobs} label={"职位类别"} onSelect={onSelect} />
		<ThirdNav tnvs={idt} label={"行业"} onSelect={onSelect} />
		<div class="bg-light p-3 rounded mt-3">
			<span class="mt-1 font-weight-bold">月薪：</span>
			<a href=" " class="text-dark d-inline-block py-1 px-2 mnv active">不限</a>	
			{#each pay as p}
			<a href=" " class="text-dark d-inline-block py-1 px-2 mnv">{p}</a>	
			{/each}
		</div>
		<div class="bg-light p-3 rounded mt-3">
			<span class="mt-1 font-weight-bold">其他：</span>
			<select class="mr-3 sel">
				<option selected>工作经验</option>
				<option value="1">无经验</option>
				<option value="2">1年以下</option>
				<option value="3">1-3年</option>
				<option value="3">3-5年</option>
				<option value="3">5-10年</option>
				<option value="3">10年以上</option>
			</select>
			<select class="mr-3 sel">
				<option selected>学历要求</option>
				<option value="1">初中及以下</option>
				<option value="2">高中</option>
				<option value="3">中专/中技</option>
				<option value="1">大专</option>
				<option value="2">本科</option>
				<option value="3">硕士</option>
				<option value="1">MBA/EMBA</option>
				<option value="2">博士</option>
				<option value="3">不要求</option>
			</select>
			<select class="mr-3 sel">
				<option selected>公司性质</option>
				<option value="1">国企</option>
				<option value="1">外商独资</option>
				<option value="1">代表处</option>
				<option value="1">合资</option>
				<option value="1">民营</option>
				<option value="1">股份制企业</option>
				<option value="1">上市公司</option>
				<option value="1">国家机关</option>
				<option value="1">事业单位</option>
				<option value="1">银行</option>
				<option value="1">医院</option>
				<option value="1">学校/下级学院</option>
				<option value="1">律师事务所</option>
				<option value="1">社会团体</option>
				<option value="1">港澳台公司</option>
				<option value="1">其它</option>
			</select>
			<br><br>
			{#each tags as {id,title}}
			<div class="d-inline-block pr-4 mb-3">
				<input type="checkbox" id="{id}">
				<label class="" for="{id}">{title}</label>
			</div>
			{/each}
		</div>
	</div>
</div>
<div class="raw pl-sm-3 pl-md-0">
	{#each its as it}
		<Item {it} />
	{:else}
		<p class="font-weight-light text-warning">加载中 ... </p>
	{/each}
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
	.mnv:hover{text-decoration:none; color:#007bff!important;}
	.active{color:#007bff!important;}
</style>

