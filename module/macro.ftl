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
    <link rel="stylesheet" href="${theme_base!}/css/style.css"/>
    <!-- persian styles -->
    <link rel="stylesheet" href="${theme_base!}/css/rtl.css"/>
    <title>${title}</title>
  </head>
  <body class="max-width mx-auto px3 ltr">

  <#if is_post??>
      <#include "./post_nav.ftl"/>
  </#if>
  <div class="content index py4">
      <#if !(is_post??)>
        <header id="header">
          <a href="${blog_url!'/'}">
            <div id="logo" style="background-image: url(${settings.icon!}?${theme_base!}/images/logo.png)"></div>

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
  <link rel="stylesheet" href="${theme_base!}/lib/font-awesome/css/all.min.css"/>
  <link rel="stylesheet" href="${theme_base!}/lib/font-awesome/css/brands.min.css"/>
  <link
          rel="stylesheet"
          href="${theme_base!}/lib/justified-gallery/css/justifiedGallery.min.css"
  />

  <!-- jquery -->
  <script src="${theme_base!}/lib/jquery/jquery.min.js"></script>
  <script src="${theme_base!}/lib/justified-gallery/js/jquery.justifiedGallery.min.js"></script>
  <!-- clipboard -->
  <script src="${theme_base!}/lib/clipboard/clipboard.min.js"></script>

  <script src="${theme_base!}/js/main.js"></script>
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
    })
  </script>
  </body>
  </html>
</#macro>
