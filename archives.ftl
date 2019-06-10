<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 归档" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <div class="content index py4">
      <header id="header">
      <a href="/">
          <div id="logo" style="background-image: url(${options.blog_logo!});"></div>
            <div id="title">
              <h1>${options.blog_title!}</h1>
          </div>
      </a>

      <div id="nav" style="margin-top:5px;">
        <ul>
          <li class="icon">
            <a href="#"><i class="fas fa-bars fa-2x"></i></a>
          </li>
          <@menuTag method="list">
              <#list menus as menu>
                <li>
                    <a href="${menu.url!}">${menu.name!}</a>
                </li>
              </#list>
          </@menuTag>
        </ul>
      </div>
    </header>

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

    <footer id="footer">
         <div class="footer-left">
           Theme is ${theme.name} by ${theme.author.name}
           Powered by Halo
           © <span id="site_date"></span> ${options.blog_title!}
         </div>
         <div class="footer-right">
           <nav>
             <ul>
                 <@menuTag method="list">
                     <#list menus as menu>
                       <li>
                           <a href="${menu.url!}">${menu.name!}</a>
                       </li>
                     </#list>
                  </@menuTag>
             </ul>
           </nav>
         </div>
       </footer>
 </div>

     <!-- styles -->
     <link rel="stylesheet" href="${context!}/guqing_higan/source/justified-gallery/css/justifiedGallery.min.css">

     <!-- jquery -->
    <script src="${context!}/guqing_higan/source/js/jquery.min.js"></script>
    <script src="${context!}/guqing_higan/source/justified-gallery/js/jquery.justifiedGallery.min.js"></script>
    <script src="${context!}/guqing_higan/source/js/main.js"></script>
</@layout>
