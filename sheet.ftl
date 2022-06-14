<#include "module/macro.ftl">
<#include "./module/comment.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

  <link rel="stylesheet" href="${theme_base!}/css/codehls/${settings.code_style!}.css">

  <article class="post" itemscope itemtype="http://schema.org/BlogPosting">
    <h1>${sheet.title!}</h1>
      ${sheet.formatContent!}
    
    <div class="post-comment">
      <@comment target=sheet type="sheet" />
    </div>
  </article>
</@layout>
