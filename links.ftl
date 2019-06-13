<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 友情链接" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <article class="post" itemscope itemtype="http://schema.org/BlogPosting">
     <div class="content" itemprop="articleBody">
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
</@layout>
