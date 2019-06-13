<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 标签：${tag.name}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <h1>标签：名称111${tag.name}</h1>
    ${tag.id}
    <@postTag method="listByTagId" tagId="${tag.id}">
        <#list posts as post>
            ${post}
        </#list>
     </@postTag>
</@layout>
