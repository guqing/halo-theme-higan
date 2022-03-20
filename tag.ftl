<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
  <div id="archive">
    <h2>标签：${tag.name}</h2>
      <@postTag method="listByTagId" tagId="${tag.id?c}">
        <ul class="post-list">
            <#list posts as post>
              <li class="post-item">
                <div class="meta">
                  <time datetime="${post.createTime!}"
                        itemprop="datePublished">${post.createTime!?string["MMMM dd yyyy"]}</time>
                </div>
                <span>
                 <a class="post-title" href="${post.fullPath!}">${post.title!}</a>
              </span>
              </li>
            </#list>
        </ul>
      </@postTag>
  </div>
</@layout>
