<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
  <article class="links post" itemscope itemtype="http://schema.org/BlogPosting">
    <div class="content">
        <@linkTag method="list">
            <#list links as link>
              <li>
                <a href="${link.url!}" target="_blank">
                    ${link.name!}
                </a>
              </li>
            </#list>
        </@linkTag>
     </div>
   </article>
</@layout>
