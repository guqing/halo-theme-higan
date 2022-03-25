<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
  <article class="post" itemscope itemtype="http://schema.org/BlogPosting">
    <h1>${sheet.title!}</h1>
      ${sheet.formatContent!}
    
    <div class="post-comment">
      <#if settings.disqus??>
        <div id="disqus_thread"></div>
      <#else>
        <@global.comment target=sheet type="sheet" />
      </#if>
    </div>
  </article>
</@layout>
