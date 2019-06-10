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
    ${post.formatContent!}

    <#include "module/comment.ftl">
    <br>
    <@comment post=post type="post" />
</@layout>
