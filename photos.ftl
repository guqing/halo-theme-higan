<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 图库" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
  <article class="photos post" itemscope itemtype="http://schema.org/BlogPosting">
    <div class="content">
        <#assign lastTeam = dataNull!>
      <ul class="photo-list">
          <#list photos.content?sort_by('team') as photo>
              <#if lastTeam != photo.team >
                <h2>${photo.team}</h2>
              </#if>
              <#assign lastTeam = photo.team >
            <li class="photo-image">
              <img alt="${photo.description}" src="${photo.url}"/>
            </li>
          </#list>
      </ul>

      <div class="pagination">
          <@paginationTag method="photos" page="${photos.number}" total="${photos.totalPages}" display="${options.photos_page_size}">
              <#if photos.hasPrevious()>
                <a href="${pagination.prevPageFullPath!}"><i class="fa fa-angle-left"></i></a>
              </#if>
            <span class="page-number">Page ${photos.number} of ${photos.getTotalPages()}</span>
              <#if photos.hasNext()>
                <a href="${pagination.nextPageFullPath!}"><i class="fa fa-angle-right"></i></a>
              </#if>
          </@paginationTag>
      </div>
    </div>
  </article>
</@layout>
