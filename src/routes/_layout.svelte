<script context="module">
	export function preload() {
		return this.fetch(`index.json`).then(r => r.json()).then(navs => {
			return {navs};
		});
	}
</script>

<script>
	import {stores} from '@sapper/app'
	import { setContext } from 'svelte'
	import { writable } from 'svelte/store'
	import Nav from '../components/Nav.svelte'
	import Profile from '../components/Profile.svelte'
	import SubNav from '../components/SubNav.svelte'

	export let segment, navs
	//console.log(JSON.stringify(navs),'8888888888888888888888888')
	setContext("navs", writable(navs));
	let adv=true, hots=true, pfo=true, mainWidth=768
	const { session, page } = stores()

	$: side=(mainWidth<768)? false:true

	const onFocus =()=>{hots=false;adv=true;pfo=true;}
	const onBlur =()=>{hots=true};
	const onAdv=()=>{adv=!adv;pfo=true;hots=true}
	const onSide=()=>{side=!side;}
	const logout=()=>{
		let cookies = document.cookie.split(";")
		for (var i = 0; i < cookies.length; i++) {
			var cookie = cookies[i]
			var eqPos = cookie.indexOf("=")
			var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
			document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT"
		}
		$session.authenticated=false
	}
</script>
<svelte:window bind:innerWidth={mainWidth}/>
<div class="container-fluid mb-5 fixed-top bg-white justify-content-between" >
<nav class="row py-2 shadow ">
	<div class="col-md-3 col-lg-3 order-md-0 order-sm-0  col-sm-4 d-flex justify-content-start">
		<span class="navbar-brand side-btn" on:click={onSide}>
			<svg width="1.7em" height="1.7em" viewBox="0 0 16 16" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
			</svg>
		</span>
		<h1 class="navbar-brand text-warning">Sibelly</h1>
	</div>
	<div class="col-md-6 col-lg-6 order-md-1 order-sm-2  col-sm-12 px-2 px-sm-3">
	<div class="input-group  straight" id="navbarCollapse">        
        <span class="input-group-prepend">
          <button class="btn border-right-0 border bg-light" type="button">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
					<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
				</svg>
          </button>
        </span>
        <input class="form-control border-left-0 border-right-0 bg-light"  type="search" placeholder="搜索" on:focus={onFocus} on:blur={onBlur} >
		<div class="input-group-append">
			<button class="btn border-left-0 border bg-light" type="button" on:click="{onAdv}">
				{#if adv}
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-down-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
				</svg>
				{:else}
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path d="M7.247 4.86l-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
				</svg>
				{/if}
			</button>			
		</div>
		<div class:show="{adv}" class="dropmenu bg-light p-4 border shadow-sm rounded">
			<p class="font-weight-light text-info">缩小搜索范围</p>
			<div class="form-group row">
				<label for="a" class="col-sm-2 col-form-label font-weight-light">精确匹配</label>
				<div class="col-sm-10">
				<input type="text" class="inp bg-light" >
				</div>
			</div>
			<div class="form-group row">
				<label for="b" class="col-sm-2 col-form-label font-weight-light">包含</label>
				<div class="col-sm-10">
				<input type="text" class="inp bg-light" >
				</div>
			</div>
			<div class="form-group row">
				<label for="c" class="col-sm-2 col-form-label font-weight-light">不包含</label>
				<div class="col-sm-10">
				<input type="text" class="inp bg-light" >
				</div>
			</div>
			<div class="form-group row">
				<label for="c" class="col-sm-2 col-form-label font-weight-light">地域</label>
				<div class="col-sm-10">
				<input type="text" class="inp bg-light" >
				</div>
			</div>
			<div class="form-group row">
				<label for="d" class="col-sm-2 col-form-label font-weight-light">日期</label>
				<div class="col-sm-10">
					<select class="form-control">
						<option>任何时间</option>
						<option>近1小时</option>
						<option>近24小时</option>
						<option>近1周</option>
						<option>近1年</option>
					</select>
				</div>
			</div>
			<div class="form-group row ">
				<div class="col-12 d-flex justify-content-end">
				<button type="submit" class="btn bg-light mr-4">重 置</button>
				<button type="submit" class="btn bg-light ">搜 索</button>
				</div>
			</div>
		</div>
		<div class:show="{hots}" class="dropmenu bg-light border shadow-sm rounded">
			<div class="list-group border-0">
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>		
			</div>
		</div>
	</div>
	</div>
</nav>
</div>

{#if side}
<div class="container-fluid mt-5 pt-4">
	<div class="row mt-2 mt-lg-2 mt-sm-5">
		<nav class="col-md-3 col-lg-2 col-sm-6 d-md-block bg-white sidebar pt-5 pl-0" class:dbr1={(mainWidth<768)}>
			<div class="mt-3 pt-3">
			<Nav {segment} {navs} />
			</div>
		</nav>
		<div class="col-md-9 col-lg-10 ml-sm-auto">
			<div class="col-md-12 ml-sm-12 col-lg-12 ">
				<div class="row pt-3">
					<div class="col-lg-8 col-md-8 col-sm-12 order-md-0 order-sm-1">
						<slot>  </slot>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 pt-md-5 pt-sm-0 mb-5 order-md-1 order-sm-0">
						<div class="border rounded-lg shadow-sm  mb-4 mt-md-1 mt-sm-0">
							<Profile />
						</div>
						{#if $page.path!=="/"}
							<div><SubNav {navs}/></div>	
						{/if}	
						<div class="border rounded-lg shadow-sm  mb-4 mt-md-1 mt-sm-0 bg-light">
							<div class="d-flex justify-content-center">
								<div class="col-3 text-center">
									<h2 class="text-warning">这里应该有广告</h2>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{:else}
<div class="container-fluid mt-5 pt-4 ">
	<div class="row mt-2 mt-lg-2 mt-sm-5">
		<div class="col-md-12 ml-sm-12 col-lg-12">
			<div class="row pt-3 ">
				<div class="col-lg-9 col-md-9 col-sm-12 pl-md-4 pl-sm-0 order-md-0 order-sm-1">
					<div class="pl-md-2">
					<slot></slot>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 pt-md-5 pt-sm-0 order-md-1 order-sm-0 mb-5 ">
					<div class="border rounded-lg shadow-sm mb-4 mt-md-1 mt-sm-0">
						<Profile />
					</div>
					{#if $page.path!=="/"}
						<div><SubNav {navs}/></div>	
					{/if}			
					<div class="border rounded-lg shadow-sm mb-4 mt-md-1 mt-sm-0 bg-light">
						<div class="d-flex justify-content-center">
							<div class="col-3 text-center">
								<h2 class="text-warning">这里应该有广告</h2>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
</div>
{/if}
<style>
	.show{display: none;}
	.dropmenu{
		width: 100%;
		position: absolute;
		z-index: 5;
		margin-top:38px;
  	}
	.inp {
		width: 100%;
		border:none;
		border-bottom: 1px solid #d9dee4;
		padding: 2px 10px;
		outline: none;
	}
	.inp:focus{
		border-bottom: 1px solid #1890ff;
	}
	[placeholder]:focus::-webkit-input-placeholder {
		transition: text-indent 0.4s 0.4s ease; 
		text-indent: -100%;
		opacity: 1;
	}
	.side-btn {padding:6px;}
	.side-btn:hover{background-color: rgb(184, 178, 178); border-radius:25px;cursor:pointer;}
	.sidebar {
		position: fixed;
		top: 0;
		bottom: 0;
		left: 0;
		z-index: 200; /* Behind the navbar */
	}
	.dbr1{
		border-right: 1px solid rgb(197, 194, 194);
		background-color: rgb(85, 83, 83);
		box-shadow: 5px 10px 5px #b8b6b6;
	}
</style>