<#import "${context!}/common/macro/common_macro.ftl" as common>
<#macro layout title,keywords,description>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="keywords" content="${keywords!}"/>
        <meta name="description" content="${description!}"/>

        <#--
            公共 head 代码，详情请参考：https://halo.run/develop/theme.html#%E5%85%AC%E5%85%B1-head-%E6%A0%87%E7%AD%BE
            包含：Favicon，站点验证代码
        -->
        <@common.globalHeader />

        <link rel="shortcut icon" href="${options.blog_favicon!}">
        <link rel="icon" type="image/png" href="${options.blog_favicon!}" sizes="192x192">

        <link rel="stylesheet" href="${theme_base!}/source/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/style.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/rtl.css">
        <link rel="stylesheet" href="${theme_base!}/source/css/post.css">

        <link href="${theme_base!}/source/css/atelier-lakeside-dark.min.css" rel="stylesheet"/>
        <#--  <link href="${context!}/guqing_higan/source/css/codehls/dracula.css" rel="stylesheet"/>  -->

        <title>${title}</title>

        <style>
            body h1, body .h1, body h2, body h3, body h4, body h5, body h6 {
                color: #2bbc8a;
                text-decoration: none;
            }

            .post-title {
                color: #c9cacc;
                text-decoration: none;
                background-image: linear-gradient(transparent, transparent 5px, #c9cacc 5px, #c9cacc);
                background-position: bottom;
                background-size: 100% 6px;
                background-repeat: repeat-x;
            }

            .post-title:hover {
                background-image: linear-gradient(transparent, transparent 4px, #d480aa 4px, #d480aa);
            }
        </style>
    </head>
    <body class="max-width mx-auto px3 ltr">
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


        <#nested >


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
    <link rel="stylesheet" href="${theme_base!}/source/justified-gallery/css/justifiedGallery.min.css">

    <!-- jquery -->
    <script src="${theme_base!}/source/js/jquery.min.js"></script>
    <script src="${theme_base!}/source/justified-gallery/js/jquery.justifiedGallery.min.js"></script>
    <script src="${theme_base!}/source/js/main.js"></script>

    <script type="text/javascript">
      var myDate = new Date();
      document.getElementById("site_date").innerHTML = myDate.getFullYear();


      <#--  设置代码渲染样式  -->
      $(document).ready(function () {
        var basePath = "${theme_base!}/source/css/codehls/";
        <#if settings.code_style??>
        var codeStyle = "${settings.code_style}"

        var element = document.createElement("link");
        element.setAttribute('rel', 'stylesheet');
        element.setAttribute('type', 'text/css');
        element.setAttribute('href', basePath + codeStyle + '.css');
        document.getElementsByTagName('head')[0].appendChild(element);
        </#if>
      })
    </script>

    <#--
        公共底部代码，详情请参考：https://halo.run/develop/theme.html#%E5%85%AC%E5%85%B1%E5%BA%95%E9%83%A8
        包含：统计代码，底部信息
    -->
    <div style="color: #666;font-size: 11px;text-align: left;margin-top:-15px;">
        <@common.globalFooter />
    </div>
    </body>
    </html>
</#macro>

