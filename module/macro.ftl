<#macro layout title,keywords,description>
  <!DOCTYPE html>
  <html lang="zh">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="HandheldFriendly" content="True"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
    />
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}"/>

    <meta property="og:type" content="website"/>
    <meta property="og:title" content="${blog_title!}"/>
    <meta property="og:url" content="${blog_url!}"/>
    <meta property="og:site_name" content="${blog_title!}"/>
    <meta property="og:description" content="${meta_description!}"/>
      <#--
          公共 head 代码，详情请参考：https://halo.run/develop/theme.html#%E5%85%AC%E5%85%B1-head-%E6%A0%87%E7%AD%BE
          包含：Favicon，站点验证代码
      -->
      <@global.head />

    <link rel="shortcut icon" href="${options.blog_favicon!'${theme_base}/images/favicon.ico'}"/>

    <!-- styles -->
    <link rel="stylesheet" href="${theme_base!}/css/colors/${settings.theme_color!}.css"/>
    <link rel="stylesheet" href="${theme_base!}/css/style.css?version=${theme.version!}"/>
    <!-- persian styles -->
    <link rel="stylesheet" href="${theme_base!}/css/rtl.css?version=${theme.version!}"/>
    <title>${title}</title>
  </head>
  <body>
  <!-- 图片预览遮罩层占位 -->
  <div id="img-preview-overlay" class="hidden-preview-img-overlay" onclick="cancelImagePreview()"></div>
  <div class="max-width mx-auto px3 ltr">
      <#if is_post??>
          <#include "./post_nav.ftl"/>
      </#if>
    <div class="content index py4">
        <#if !(is_post??)>
          <header id="header">
            <a href="${blog_url!'/'}">
                <#if settings.icon??>
                  <div id="logo" style="background-image: url(${settings.icon!}"></div>
                <#else>
                  <div id="logo" style="background-image: url(${theme_base!}/images/logo.png))"></div>
                </#if>
              <div id="title">
                <h1>${title}</h1>
              </div>
            </a>
            <div id="nav">
              <ul>
                <li class="icon">
                  <a href="#"><i class="fas fa-bars fa-2x"></i></a>
                </li>

                  <@menuTag method="list">
                      <#list menus?sort_by('priority') as menu>
                        <li>
                          <a href="${menu.url!}" target="${menu.target!}">${menu.name!}</a>
                        </li>
                      </#list>
                  </@menuTag>
              </ul>
            </div>
          </header>
        </#if>

        <#nested >

      <footer id="footer">
        <div style="flex: 1">
          <div class="footer-left">Theme is ${theme.name} by ${theme.author.name}
            Powered by Halo
            © <span id="site_date"></span> ${options.blog_title!}</div>
          <div class="footer-right">
            <nav>
                <@menuTag method="list">
                  <ul>
                      <#list menus?sort_by('priority') as menu>
                        <li>
                          <a href="${menu.url!}" target="${menu.target!}">${menu.name!}</a>
                        </li>
                      </#list>
                  </ul>
                </@menuTag>
            </nav>
          </div>
            <@global.footer />
        </div>
      </footer>
    </div>
    <!-- styles -->
    <link
            rel="stylesheet"
            href="${theme_base!}/lib/justified-gallery/css/justifiedGallery.min.css"
    />

    <!-- jquery -->
    <script src="${theme_base!}/lib/jquery/jquery.min.js"></script>
    <script src="${theme_base!}/lib/justified-gallery/js/jquery.justifiedGallery.min.js"></script>
    <!-- clipboard -->
    <script src="${theme_base!}/lib/clipboard/clipboard.min.js"></script>

    <script src="${theme_base!}/js/main.js?version=${theme.version!}"></script>
    <!-- fontawesome -->
    <script src="${theme_base!}/lib/font-awesome/js/fontawesome.js"></script>
    <script src="${theme_base!}/lib/font-awesome/js/solid.js"></script>

      <#if settings.disqus?? && (is_post?? || is_sheet?? || is_journals??)>
        <script id="dsq-count-scr" src="//${settings.disqus!}.disqus.com/count.js" async></script>
        <script>
          /**
           *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
           *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
          /*
          var disqus_config = function () {
          this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
          this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
          };
          */
          (function () { // DON'T EDIT BELOW THIS LINE
            var d = document, s = d.createElement('script');
            s.src = 'https://${settings.disqus!}.disqus.com/embed.js';
            s.setAttribute('data-timestamp', +new Date());
            (d.head || d.body).appendChild(s);
          })();
        </script>
      </#if>
    <script type="text/javascript">
      var myDate = new Date();
      document.getElementById("site_date").innerHTML = myDate.getFullYear();


      <#--  设置代码渲染样式  -->
      $(document).ready(function () {
        var basePath = "${theme_base!}/css/codehls/";
        <#if settings.code_style??>
        var codeStyle = "${settings.code_style}"

        var element = document.createElement("link");
        element.setAttribute('rel', 'stylesheet');
        element.setAttribute('type', 'text/css');
        element.setAttribute('href', basePath + codeStyle + '.css');
        document.getElementsByTagName('head')[0].appendChild(element);
        </#if>

        // 圆形头像
        const enableCircleAvatar = ${settings.avatar_circle?c}
        if (enableCircleAvatar) {
          $("#logo").addClass("circle-avatar")
        }
        // 灰度头像
        const avatarGrayout = ${settings.avatar_grayout?c}
        if (avatarGrayout) {
          $("#logo").addClass("avatar-grayscale")
        }
      })
    </script>
  </div>
  </body>
  </html>
</#macro>
