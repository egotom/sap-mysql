<script>
	import Nav from '../components/Nav.svelte';
	export let segment;
	let adv=true,hots=true,pfo=true,sdb=true;
	const onFocus =()=>{hots=false;adv=true;pfo=true};
	const onBlur =()=>{hots=true};
	const onPfo=()=>{pfo=!pfo;adv=true;hots=true};
	const onAdv=()=>{adv=!adv;pfo=true;hots=true};
	const onSdb=()=>{sdb=!sdb};
</script>
<div class="container-fluid mb-5 fixed-top bg-white justify-content-md-between justify-content-sm-between">
<nav class="row py-2 shadow">
	<div class="col-md-3 col-lg-3 order-md-0 order-sm-0  col-sm-4 d-flex justify-content-start">
		<a class="btn" on:click={onSdb} href=" ">
			<svg width="1.7em" height="1.7em" viewBox="0 0 16 16" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
			</svg>
		</a>
		<a class="navbar-brand text-warning" href=" ">Sibelly</a>
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
			<p class="font-weight-light">缩小搜索范围</p>
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
				<button type="submit" class="btn bg-gradient-secondary ">搜 索</button>
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
	<div class="col-md-3 col-lg-3 order-md-2 order-sm-1 col-sm-8 d-flex justify-content-end">
		<a href=" " class="avatar rounded-circle" on:click={onPfo}>
			<img alt="Image" src="https://demos.creative-tim.com/argon-dashboard-pro/assets/img/theme/team-4.jpg">
		</a>
		<div class:show="{pfo}" class="dropmenu border shadow-sm rounded bg-white p-5">
			<div class="container">
				<div class="row">
				  <div class="col col-sm-12 d-flex justify-content-center">
					<img src="https://demos.creative-tim.com/argon-dashboard-pro/assets/img/theme/team-4.jpg" alt="" class="avatar-lg mb-2">
					<a class="btn-upload bg-white px-1 pb-1 text-secondary " href=" ">	
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-camera" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M15 12V6a1 1 0 0 0-1-1h-1.172a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 9.173 3H6.828a1 1 0 0 0-.707.293l-.828.828A3 3 0 0 1 3.172 5H2a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
							<path fill-rule="evenodd" d="M8 11a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
							<path d="M3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
						</svg>
					</a>
				  </div>
				</div>
				<div class="row ">
				  <div class="col col-sm-12  justify-content-center">
					<p class="text-center my-0">egotom</p>
					<p class="text-center mb-4">egotom@gmail.com</p>
				  </div>
				</div>
				<div class="row ">
					<div class="col col-sm-12 d-flex justify-content-center">
						<button class="btn btn-outline-secondary btn-sm">退出登录</button>
					</div>
				  </div>
			  </div>
		</div>
	</div>
</nav>
</div>

{#if sdb}
<div class="container-fluid mt-5 pt-3">
	<div class="row mt-1 mt-lg-1 mt-sm-5">
		<Nav {segment}/>
		<slot></slot>
	</div>
</div>
{:else}
<div class="container mt-5 pt-3">
	<div class="row mt-1 mt-lg-1 mt-sm-5">
		<slot></slot>
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
	.avatar img{width: 35px;height: 35px;}
	.avatar img:hover{border:3px solid rgb(184, 178, 178);}
	.avatar-lg {width: 85px; height: 85px;}
	.rounded-circle img {border-radius:21px;}
	.straight{ flex-wrap: nowrap;}
	.btn-upload{
		position: absolute;
		margin-top:70px;
		margin-left:70px;;
		z-index: 6;
		border-radius:30px;
		border:1px solid rgb(184, 178, 178);
	}
</style>