<script>
    import Auth from "./Auth.svelte";
</script>
<div class="border rounded-lg shadow-sm p-3 mb-4 mt-md-1 mt-sm-0">
    <div class="text-center">
        <img class="img-fluid " src="favicon.png" alt="" width="72" height="72">
        {#if 1===1}
        <!--blockquote class="blockquote text-left">
            <p class="mb-0 text-info quote">自由市场提供了一种发现手段，它激励人们不断去发现新的事实，从而改善了对我们生活的这个世界中恒久变化着的环境的适应力。</p>
            <footer class="blockquote-footer text-right">哈耶克 <cite title="Source Title">《哈耶克文集》</cite></footer>
        </blockquote-->
        <br/>
        <a href=" " class="btn btn-primary d-inline-block my-2">发布供求信息</a>
        {:else}
            <Auth />
        {/if}
    </div>
    {#if 1===2}
    <div class="border-bottom mt-md-2 mt-sm-0 mb-3"></div>
    <div class="d-flex justify-content-between">
        <a class=" " href=" " role="button">评论 <span class="badge badge-pill badge-primary">5</span></a>
        <a class=" " href=" " role="button">私信 <span class="badge badge-pill badge-success">25</span></a>
        <a class=" " href=" " role="button">浏览 <span class="badge badge-pill badge-info">300</span></a>
    </div>	
    {/if}		
</div>
<style>
.quote{text-indent:2em;line-height: 1.8em;} 
</style>