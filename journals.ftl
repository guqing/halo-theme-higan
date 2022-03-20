<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
<article class="post" itemscope itemtype="http://schema.org/BlogPosting">
    <div class="content">
        <ul class="post-list">
            <#list journals.content as journal>
                <li>
                    <h2>${journal.createTime?string('yyyy年MM月dd日')}</h2>
                    ${journal.content!}
                </li>
            </#list>
        </ul>
    </div>
</article>
</@layout>
