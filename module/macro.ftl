<#import "/common/macro/common_macro.ftl" as common>
<#macro layout title,keywords,description>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${keywords!}"/>
    <meta name="description" content="${description!}" />

    <#--
        公共 head 代码，详情请参考：https://halo.run/develop/theme.html#%E5%85%AC%E5%85%B1-head-%E6%A0%87%E7%AD%BE
        包含：Favicon，站点验证代码
    -->
    <@common.globalHeader />

    <link rel="shortcut icon" href="${options.blog_favicon!}">
    <link rel="icon" type="image/png" href="${options.blog_favicon!}" sizes="192x192">

    <link rel="stylesheet" href="${context!}/guqing_higan/source/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="${context!}/guqing_higan/source/css/style.css">
    <link rel="stylesheet" href="${context!}/guqing_higan/source/css/rtl.css">

    <title>${title}</title>

    <style>
        body h1, body .h1,body h2,body h3,body h4,body h5,body h6{
            color: #2bbc8a;
            text-decoration: none;
        }
        .post-title{
            color: #c9cacc;
            text-decoration: none;
            background-image: linear-gradient(transparent, transparent 5px, #c9cacc 5px, #c9cacc);
            background-position: bottom;
            background-size: 100% 6px;
            background-repeat: repeat-x;
        }
         .post-title:hover{
            background-image: linear-gradient(transparent, transparent 4px, #d480aa 4px, #d480aa);
        }
    </style>
</head>
<body class="max-width mx-auto px3 ltr">

<#nested >


<#--
    公共底部代码，详情请参考：https://halo.run/develop/theme.html#%E5%85%AC%E5%85%B1%E5%BA%95%E9%83%A8
    包含：统计代码，底部信息
    <@common.globalFooter />
-->

</body>
</html>
</#macro>

