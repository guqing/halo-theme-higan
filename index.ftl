<#include "${theme_base!}/module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
      <section id="about">
          <p>${user.description!}</p>
          <p>
            Find me on
            <#if settings.twitter??>
                <a class="icon" target="_blank" href="https://twitter.com/${settings.twitter}">
                    <i class="fa fa-twitter"></i>
                </a>
            </#if>
            <#if settings.facebook??>
                <a class="icon" target="_blank" href="https://www.facebook.com/${settings.facebook}">
                    <i class="fa fa-facebook"></i>
                </a>
            </#if>
            <#if settings.instagram??>
                <a class="icon" target="_blank" href="https://www.instagram.com/${settings.instagram}">
                    <i class="fa fa-instagram"></i>
                </a>
            </#if>
            <#if settings.dribbble??>
                <a class="icon" target="_blank" href="https://dribbble.com/${settings.dribbble}">
                    <i class="fa fa-dribbble"></i>
                </a>
            </#if>

            <#if settings.weibo??>
                <a class="icon" target="_blank" href="https://weibo.com/${settings.weibo}">
                    <i class="fa fa-weibo"></i>
                </a>
            </#if>
            <#if settings.qq??>
                <a class="icon" target="_blank" href="tencent://message/?uin=${settings.qq}&Site=&Menu=yes">
                    <i class="fa fa-qq"></i>
                </a>
            </#if>

            <#if settings.telegram??>
                <a class="icon" target="_blank" href="https://t.me/${settings.telegram}">
                    <i class="fa fa-telegram"></i>
                </a>
            </#if>
            <#if settings.email??>
                <a class="icon" target="_blank" href="mailto:${settings.email}">
                    <i class="fa fa-envelope"></i>
                </a>
            </#if>
            <#if settings.github??>
                <a class="icon" target="_blank" href="https://github.com/${settings.github}">
                    <i class="fa fa-github"></i>
                </a>
            </#if>
          </p>
      </section>

      <section id="writing">
        <span class="h1"><a href="${context!}/archives">文章</a></span>
        <span class="h2">Topics</span>
        <span class="widget tagcloud">
            <@categoryTag method="list">
              <#if categories?size==0>暂时没有分类</#if>
              <#list categories as category>
                <a href="${context!}/categories/${category.slug}" style="font-size: 10px;">${category.name!}</a>
              </#list>
            </@categoryTag>
        </span>
        <span class="h2">Most recent</span>

        <ul class="post-list">
            <@postTag method="latest" top="10">
                 <#list posts as post>
                    <li class="post-item">
                         <div class="meta">
                            <time datetime="${post.createTime!}" itemprop="datePublished">${post.createTime!}</time>
                         </div>
                         <span>
                            <a  href="${context}/archives/${post.url!}">${post.title!}</a>
                         </span>
                    </li>
                 </#list>
            </@postTag>
        </ul>
      </section>
</@layout>
