<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 分类：${category.name}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
        <div id="archive">
             <@postTag method="listByCategoryId" categoryId="${category.id}">
                <h2>分类：${category.name}</h2>
                <ul class="post-list">
                    <#list posts as post>
                        <li class="post-item">
                           <div class="meta">
                                <time datetime="${post.createTime!}" itemprop="datePublished">${post.createTime!?string["MMMM dd yyyy"]}</time>
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
