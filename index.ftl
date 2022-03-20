<#include "${theme_base!}/module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

    <section id="about">
        <#if meta_description??>
            <p>${meta_description!}</p>
        </#if>

        <p>
            Find me on
            <#if settings.rss>
                <a class="icon" target="_blank" href="${blog_url!}/rss.xml">
                    <i class="fa fa-rss"></i>
                </a>
            </#if>
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
        <span class="h1"><a href="${blog_url!}'/archives'">Writing</a></span>

        <@postTag method="latest" top="10">
            <ul class="post-list">
                <#list posts as post>
                    <li class="post-item">
                        <div class="meta">
                            <time datetime="${post.editTime!}" itemprop="datePublished">
                                ${post.editTime?string["MMMM dd yyyy"]}
                            </time>
                        </div>
                        <span>
                          <a href="${post.fullPath!}">${post.title!}</a>
                        </span>
                    </li>
                </#list>
            </ul>
        </@postTag>
    </section>

    <!--<section id="projects">
        <span class="h1">
            <a href="http://github.com/guqing">Projects</a>
        </span>
        <ul class="project-list">
            <li class="project-item">
                <a href="url">Halo</a>:
                 <p>content</p>
            </li>
        </ul>
    </section>-->

</@layout>
