<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 友情链接" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
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

    <article class="post" itemscope itemtype="http://schema.org/BlogPosting">
     <div class="content" itemprop="articleBody">
        <hr>
        <h1 id="友情链接："><a href="#友情链接：" class="headerlink" title="友情链接："></a>友情链接：</h1>
        <ul>
            <@linkTag method="list">
                <#if links?? && links?size gt 0>
                    <#list links as link>
                        <li>
                            <a href="${link.url}" target="_blank" rel="external">${link.name}</a>
                            <#if link.description!=''>
                                – ${link.description}
                            </#if>
                        </li>
                    </#list>
                </#if>
           </@linkTag>
        </ul>
     </div>
     </article>

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


    <link rel="stylesheet" href="${context!}/guqing_higan/source/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${context!}/guqing_higan/source/css/style.css">
    <link rel="stylesheet" href="${context!}/guqing_higan/source/css/rtl.css">

   <!-- jquery -->
    <script src="/guqing_higan/source/js/jquery.min.js"></script>
    <script src="/guqing_higan/source/justified-gallery/js/jquery.justifiedGallery.min.js"></script>
    <script src="/guqing_higan/source/js/main.js"></script>

    <!-- Google Analytics -->
    <script type="text/javascript">
        (function(i,s,o,g,r,a,m) {i['GoogleAnalyticsObject']=r;i[r]=i[r]||function() {
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-133464311-1', 'auto');
        ga('send', 'pageview');
    </script>

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

    <script>
        var myDate = new Date();
        document.getElementById("site_date").innerHTML= myDate.getFullYear();
    </script>
</@layout>
