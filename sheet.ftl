<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>${sheet.title!}</h1>
    ${sheet.formatContent!}

    <@global.comment target=sheet type="sheet" />
</@layout>
