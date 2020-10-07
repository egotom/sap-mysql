<script>
	import Nav from '../components/Nav.svelte';
	export let segment;
	let adv=true,hots=true;
	const onFocus =()=>{hots=false;adv=true;}
	const onBlur =()=>hots=true;
</script>
<nav class="navbar navbar-expand-md navbar-light bg-light mb-4">
	<button class="btn" type="button" >
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand text-warning" href=" ">Sibelly</a>

	<div class="input-group mx-5">        
        <span class="input-group-prepend">
          <button class="btn border-right-0 border bg-white" type="button">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
					<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
				</svg>
          </button>
        </span>
        <input class="form-control border-left-0 border-right-0 border"  type="search" placeholder="搜索" on:focus={onFocus} on:blur={onBlur} >
		<div class="input-group-append">
			<button class="btn border-left-0 border bg-white" type="button" on:click="{() => adv = !adv}">
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
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				<a href=" " class="border-0 list-group-item list-group-item-action">Dapibus ac facilisis in</a>				
			</div>
		</div>
	</div>
	
	<div class="collapse navbar-collapse" id="navbarCollapse">
	  <ul class="navbar-nav mr-auto">
		<li class="nav-item active">
		  <a class="nav-link" href=" ">Home <span class="sr-only">(current)</span></a>
		</li>
		<li class="nav-item">
		  <a class="nav-link" href=" ">Link</a>
		</li>
		<li class="nav-item">
		  <a class="nav-link disabled" href=" " tabindex="-1" aria-disabled="true">Disabled</a>
		</li>
	  </ul>
	</div>
</nav>


<Nav {segment}/>

<main>
	<slot></slot>
</main>


<style>
	.show{display: none;}
	.dropmenu{
		width: 100%;
		position: absolute;
		z-index: 2;
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
</style>