<script>
  import Error from './Error.svelte'
  import {getCookies } from '../cookie'
  import {stores} from '@sapper/app'
  const { session } = stores()
  

  let email = null, passwd = '', cfpassword='', userName='', agree=false,remember=false, erno=0;
  $:mode=0;
  async function login(e){
    e.preventDefault();
    let res =await fetch('/auth?login=1', {
      method: 'POST',
      mode: 'cors',
      credentials: 'include',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({email,passwd,remember})
    })
    res = await res.json()
    let cks = getCookies()
    $session.authenticated=cks.get('auth')?true:false
    //sessionStorage.setItem('token', res.accessToken);
    //sessionStorage.setItem('name', res.name);
    //sessionStorage.setItem('email', res.email);
    //sessionStorage.setItem('avatar', res.avatar);
    //console.log(cks.get('auth'),'-------------------')
    erno=res.erno
  }
  async function register(){
    if(cfpassword!==passwd){
      msg='<span style="color:red">两次输入的密码不一致，<br>请重新输入。</span>';
      return;
    }
    if(passwd.length<6){
      msg='<span style="color:red">密码长度至少为6位。</span>';
      return;
    }
    if(!agree){
      msg='<span style="color:red">请阅读并同意用户协议。</span>';
      return;
    }
    
    let res=await fetch('/auth?register=1', {
      method: 'POST',
      mode: 'cors',
      credentials: 'include',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({userName,email,passwd})
    })
    res = await res.json();
    erno=res.erno;
  }
  async function reset(){
    let res=await fetch('/auth?reset=1', {
      method: 'POST',
      mode: 'cors',
      credentials: 'include',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({email})
    })
    res = await res.json();
    erno=res.erno;
  }

  async function reset2(){
    let res=await fetch('/auth?reset=2', {
      method: 'POST',
      mode: 'cors',
      credentials: 'include', 
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({passwd})
    })
    res = await res.json();
    erno=res.erno;
  }
  function setMode(md){
    mode=md
  }
</script>
{#if mode===0}
  <form class="form-signin"  on:submit|preventDefault="{login}">
    <p class="font-weight-light text-info mb-3">登录，或 <a href=" " class="font-weight-bold" on:click="{()=>setMode(1)}">注册新账号</a></p>
    <label for="inputEmail" class="sr-only">邮箱</label>
    <input type="email" id="inputEmail" class="form-control" placeholder="邮箱" required bind:value={email}>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="密码" required bind:value={passwd}>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" bind:checked={remember}> 下次自动登录
      </label>
    </div>
    <Error erno={erno} setMode={setMode} />
    <button class="btn btn-primary btn-inline-block mb-1" type="submit" >登 录</button>
  </form>  
  {:else if mode===1}
  <form class="form-signin" on:submit|preventDefault="{register}">
    <p class="font-weight-light text-info mb-3">注册新账号，或 <a href=" " class="font-weight-bold" on:click="{()=>setMode(0)}">登录账号</a></p>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" id="userName" class="form-control" placeholder="用户名" required bind:value={userName}>
    <label for="inputEmail" class="sr-only">邮箱</label>
    <input type="email" id="inputEmail" class="form-control" placeholder="邮箱" required bind:value={email}>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="密码" required bind:value={passwd}>
    <label for="cfPassword" class="sr-only">确认密码</label>
    <input type="password" id="cfPassword" class="form-control" placeholder="确认密码" required bind:value={cfpassword}>
    <div class="checkbox mb-1">
      <label>
        <input type="checkbox" bind:checked={agree}> 我同意 <a href="/terms">用户协议</a>。
      </label>
    </div>
    <Error erno={erno} setMode={setMode} />
    <button class="btn btn-primary btn-inline-block mb-1" type="submit">注 册</button>
  </form>
  {:else if mode===2}
    <form class="form-signin" on:submit|preventDefault="{reset}">
      <label for="inputEmail" class="sr-only">注册邮箱</label>
      <input type="email" id="inputEmail" class="form-control" placeholder="注册邮箱" required bind:value={email}>
      <Error erno={erno} setMode={setMode} />
      <button class="btn btn-primary btn-inline-block mb-1" type="submit">重置密码</button>
    </form>
  {:else}
    <form class="form-signin" on:submit|preventDefault="{reset2}">
      <label for="inputPassword" class="sr-only">新密码</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="新密码" required bind:value={passwd}>
      <label for="cfPassword" class="sr-only">确认新密码</label>
      <input type="password" id="cfPassword" class="form-control" placeholder="确认新密码" required bind:value={cfpassword}>
      <Error erno={erno} setMode={setMode} />
      <button class="btn btn-primary btn-inline-block mb-1" type="submit">重置密码</button>
    </form>
{/if}

<style>
  .form-signin {
    width: 100%;
    max-width: 330px;
    padding: 15px;
    margin: auto;
  }
  .form-signin .checkbox {
    font-weight: 400;
  }
  .form-signin .form-control {
    position: relative;
    box-sizing: border-box;
    height: auto;
    padding: 10px;
    font-size: 16px;
  }
  .form-signin .form-control:focus {
    z-index: 2;
  }
  .form-signin input{
    margin-bottom: 10px;
  }
</style>