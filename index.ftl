<#include "./module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">

    <section id="about">
        <#if settings.hitokoto!>
            <p id="hitokoto"></p>
        </#if>
        <#if !(settings.hitokoto!) && meta_description??>
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
                    <i class="fa fa-brands fa-twitter"></i>
                </a>
            </#if>
            <#if settings.facebook??>
                <a class="icon" target="_blank" href="https://www.facebook.com/${settings.facebook}">
                    <i class="fa fa-brands fa-facebook"></i>
                </a>
            </#if>
            <#if settings.instagram??>
                <a class="icon" target="_blank" href="https://www.instagram.com/${settings.instagram}">
                    <i class="fa fa-brands fa-instagram"></i>
                </a>
            </#if>
            <#if settings.dribbble??>
                <a class="icon" target="_blank" href="https://dribbble.com/${settings.dribbble}">
                    <i class="fa fa-brands fa-dribbble"></i>
                </a>
            </#if>

            <#if settings.weibo??>
                <a class="icon" target="_blank" href="https://weibo.com/${settings.weibo}">
                    <i class="fa-brands fa-weibo"></i>
                </a>
            </#if>
            <#if settings.qq??>
                <a class="icon" target="_blank" href="tencent://message/?uin=${settings.qq}&Site=&Menu=yes">
                    <i class="fa fa-brands fa-qq"></i>
                </a>
            </#if>

            <#if settings.telegram??>
                <a class="icon" target="_blank" href="https://t.me/${settings.telegram}">
                    <i class="fa fa-brands fa-telegram"></i>
                </a>
            </#if>
            <#if settings.email??>
                <a class="icon" target="_blank" href="mailto:${settings.email}">
                    <i class="fa fa-envelope"></i>
                </a>
            </#if>
            <#if settings.github??>
                <a class="icon" target="_blank" href="https://github.com/${settings.github}">
                    <i class="fa fa-brands fa-github"></i>
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

    <#if settings.hitokoto!>
        <!-- 新 API 方法， 十分简洁 -->
        <script src="https://v1.hitokoto.cn/?encode=js&select=%23hitokoto" defer></script>
    </#if>
</@layout>
