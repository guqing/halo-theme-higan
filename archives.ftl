<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <div id="archive">
        <#list archives as archive>
            <h2>${archive.year?c}</h2>
            <ul class="post-list">
                <#list archive.posts?sort_by("createTime")?reverse as post>
                    <li class="post-item">
                        <div class="meta">
                            <time datetime="${post.createTime!}"
                                  itemprop="datePublished">${post.editTime?string["MMMM dd yyyy"]}</time>
                        </div>
                        <span>
                           <a class="post-title" href="${post.fullPath!}">${post.title!}</a>
                        </span>
                    </li>
                </#list>
            </ul>
        </#list>

      <div class="pagination">
          <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="${options.post_archives_page_size}">
              <#if posts.hasPrevious()>
                <a href="${pagination.prevPageFullPath!}"><i class="fa fa-angle-left"></i></a>
              </#if>
            <span class="page-number">Page ${posts.number + 1} of ${posts.getTotalPages()}</span>
              <#if posts.hasNext()>
                <a href="${pagination.nextPageFullPath!}"><i class="fa fa-angle-right"></i></a>
              </#if>
          </@paginationTag>
      </div>
    </div>
</@layout>
