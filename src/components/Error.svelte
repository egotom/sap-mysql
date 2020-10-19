<script>
export let erno, setMode;

</script>
{#if erno===0}
    <p class="text-center text-success"></p>
{:else if erno===1}
    <p class="text-center text-danger">该邮箱还没有注册！<br> <a href=" " on:click="{()=>setMode(1)}">请先注册。</a></p>
{:else if erno===2}
    <p class="text-center text-danger">该账号还没有激活！<br> <a href=" " on:click="{()=>setMode(3)}">请先激活账号。</a></p>
{:else if erno===3}
    <p class="text-center text-danger">登录邮箱或密码错误！</p>
{:else if erno===4}
    <p class="text-center text-danger">邮箱格式错误！</p>
{:else if erno===5}
    <p class="text-center text-danger">该邮箱已经被注册！<br>
    <a href=" " on:click="{()=>setMode(0)}">请登录 </a> 或 <a href=' ' on:click="">重置密码</a></p>
{:else if erno===6}
    <p class="text-center text-success">注册成功，<br>请前往注册邮箱激活你的账号。</p>
{:else if erno===7}
    <p class="text-center text-danger"> 该邮箱未注册。<br> <a href=" " on:click="{()=>setMode(1)}">请先注册。</a></p>
{:else if erno===8}
    <p class="text-center text-success"> 密码重置链接已发到你的邮箱。<br> 请在 5 分钟内重置你的密码。</p>
{:else if erno===9}
    <p class="text-center text-danger"> 密码重置链接过期。<br> <a href=" " on:click="{()=>setMode(1)}">重新发送</a></p>
{:else if erno===10}
    <p class="text-center text-success"> 密码重置成功！<br><a href=" " on:click="{()=>setMode(0)}"> 请重新登录。</a></p>
{:else if erno===11}
    <p class="text-center text-success"> 激活邮件发送成功！<br><a href=" " on:click="{()=>setMode(0)}"> 请先登录你的注册邮箱激活账号。</a></p>
{:else if erno===12}
    <p class="text-center text-danger"> 您的激活链接已过期！<br><a href=" " on:click="{()=>setMode(3)}"> 重新发送激活链接</a></p>
{:else if erno===13}
    <p class="text-center text-success"> 账号激活成功！<br><a href=" " on:click="{()=>setMode(0)}"> 请登录你的账号。</a></p>
{:else}
    <p class="text-center text-danger">系统错误！<br> 请稍后再试。</p>
{/if}