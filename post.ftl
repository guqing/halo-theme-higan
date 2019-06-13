<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${post.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
<div id="header-post">
  <a id="menu-icon" href="#" class="active"><i class="fa fa-bars fa-lg"></i></a>
  <span id="menu" style="visibility: visible;">
    <span id="nav">
      <ul>
       <@menuTag method="list">
          <#list menus as menu>
            <li>
                <a href="${menu.url!}">${menu.name!}</a>
            </li>
          </#list>
        </@menuTag>
      </ul>
  </span>
</div>



    <h1>${post.title!}</h1>
    <div class="post-wrapper">
       ${post.formatContent!}
    </div>

    <#include "module/comment.ftl">
    <br>
    <@comment post=post type="post" />

    <script src="//cdn.bootcss.com/highlight.js/9.11.0/highlight.min.js"></script>
    <script src="/guqing_higan/source/js/jquery.min.js"></script>
    <script type="text/javascript">
      <#--  hljs.initHighlightingOnLoad();  -->
      $(document).ready(function() {
        $('pre code').each(function(i, block) {
          hljs.highlightBlock(block);
        });
      });
    </script>
</@layout>
