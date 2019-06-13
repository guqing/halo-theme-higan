<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 归档" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <div id="archive">
         <@postTag method="archiveYear">
            <#list archives as archive>
                <h2>${archive.year?c}</h2>
                <ul class="post-list">
                   <#list archive.posts?sort_by("createTime")?reverse as post>
                        <li class="post-item">
                           <div class="meta">
                                <time datetime="${post.createTime!}" itemprop="datePublished">${post.createTime!?string('yyyy-MM-dd')}</time>
                           </div>
                           <span>
                               <a class="post-title" href="${context!}/archives/${post.url!}">${post.title!}</a>
                            </span>
                        </li>
                   </#list>
                </ul>
              </#list>
          </@postTag>

        <div class="pagination">
            <#if posts.hasPrevious()>
                 <a href="/archives/page/${posts.number}"><i class="fa fa-angle-left"></i></a>
            </#if>
            <span class="page-number">Page 1 of ${pageRainbow?size}</span>
            <#if posts.hasNext()>
                <a href="/archives/page/${posts.number+2}"><i class="fa fa-angle-right"></i></a>
            </#if>
        </div>
   </div>
</@layout>
