<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
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


      <section id="about">
          <p>${user.description!}</p>
          <p>
            Find me on
            <#if settings.twitter??>
                <a class="icon" target="_blank" href="https://twitter.com/${settings.twitter}">
                    <i class="fa fa-twitter"></i>
                </a>
            </#if>

            <#if settings.facebook??>
                <a class="icon" target="_blank" href="https://www.facebook.com/${settings.facebook}">
                    <i class="fa fa-facebook"></i>
                </a>
            </#if>

            <#if settings.instagram??>
                <a class="icon" target="_blank" href="https://www.instagram.com/${settings.instagram}">
                    <i class="fa fa-instagram"></i>
                </a>
            </#if>

            <#if settings.dribbble??>
                <a class="icon" target="_blank" href="https://dribbble.com/${settings.dribbble}">
                    <i class="fa fa-dribbble"></i>
                </a>
            </#if>

            <#if settings.weibo??>
                <a class="icon" target="_blank" href="https://weibo.com/${settings.weibo}">
                    <i class="fa fa-weibo"></i>
                </a>
            </#if>

            <#if settings.qq??>
                <a class="icon" target="_blank" href="tencent://message/?uin=${settings.qq}&Site=&Menu=yes">
                    <i class="fa fa-qq"></i>
                </a>
            </#if>

            <#if settings.telegram??>
                <a class="icon" target="_blank" href="https://t.me/${settings.telegram}">
                    <i class="fa fa-telegram"></i>
                </a>
            </#if>

            <#if settings.email??>
                <a class="icon" target="_blank" href="mailto:${settings.email}">
                    <i class="fa fa-envelope"></i>
                </a>
            </#if>

            <#if settings.github??>
                <a class="icon" target="_blank" href="https://github.com/${settings.github}">
                    <i class="fa fa-github"></i>
                </a>
            </#if>
          </p>
      </section>

      <section id="writing">
        <span class="h1"><a href="/archives">文章</a></span>
        <span class="h2">Topics</span>
        <span class="widget tagcloud">
            <@categoryTag method="list">
              <#if categories?size==0>暂时没有分类</#if>
              <#list categories as category>
                <a href="${context!}/categories/${category.slugName}" style="font-size: 10px;">${category.name}</a>
              </#list>
            </@categoryTag>
        </span>
        <span class="h2">Most recent</span>

        <ul class="post-list">
            <@postTag method="latest" top="10">
                 <#list posts as post>
                    <li class="post-item">
                         <div class="meta">
                            <time datetime="${post.createTime!}" itemprop="datePublished">${post.createTime!}</time>
                         </div>
                         <span>
                            <a  href="${context}/archives/${post.url!}">${post.title!}</a>
                         </span>
                    </li>
                 </#list>
            </@postTag>
        </ul>
      </section>

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
  <link rel="stylesheet" href="/guqing_higan/source/justified-gallery/css/justifiedGallery.min.css">

  <!-- jquery -->
 <script src="/guqing_higan/source/js/jquery.min.js"></script>
 <script src="/guqing_higan/source/justified-gallery/js/jquery.justifiedGallery.min.js"></script>
 <script src="/guqing_higan/source/js/main.js"></script>


   <!-- Baidu Analytics -->
    <script type="text/javascript">
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?2e6da3c375c8a87f5b664cea6d4cb29c";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</@layout>
