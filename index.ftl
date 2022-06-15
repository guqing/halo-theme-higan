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
                    <i class="iconify iconify-middle" data-icon="heroicons-outline:rss"></i>
                </a>
            </#if>
            <#if settings.twitter??>
                <a class="icon" target="_blank" href="https://twitter.com/${settings.twitter}">
                    <i class="iconify iconify-middle" data-icon="mdi:twitter"></i>
                </a>
            </#if>
            <#if settings.facebook??>
                <a class="icon" target="_blank" href="https://www.facebook.com/${settings.facebook}">
                    <i class="iconify iconify-middle" data-icon="ic:baseline-facebook"></i>
                </a>
            </#if>
            <#if settings.instagram??>
                <a class="icon" target="_blank" href="https://www.instagram.com/${settings.instagram}">
                    <i class="iconify iconify-middle" data-icon="mdi:instagram"></i>
                </a>
            </#if>
            <#if settings.dribbble??>
                <a class="icon" target="_blank" href="https://dribbble.com/${settings.dribbble}">
                    <i class="iconify iconify-middle" data-icon="mdi:dribbble"></i>
                </a>
            </#if>

            <#if settings.weibo??>
                <a class="icon" target="_blank" href="https://weibo.com/${settings.weibo}">
                    <i class="iconify iconify-middle" data-icon="mdi:sina-weibo"></i>
                </a>
            </#if>
            <#if settings.qq??>
                <a class="icon" target="_blank" href="tencent://message/?uin=${settings.qq}&Site=&Menu=yes">
                    <i class="iconify iconify-middle" data-icon="ant-design:qq-circle-filled"></i>
                </a>
            </#if>

            <#if settings.telegram??>
                <a class="icon" target="_blank" href="https://t.me/${settings.telegram}">
                    <i class="iconify iconify-middle" data-icon="ic:baseline-telegram"></i>
                </a>
            </#if>
            <#if settings.email??>
                <a class="icon" target="_blank" href="mailto:${settings.email}">
                    <i class="iconify iconify-middle" data-icon="ph:envelope-simple-bold"></i>
                </a>
            </#if>
            <#if settings.github??>
                <a class="icon" target="_blank" href="https://github.com/${settings.github}">
                    <i class="iconify iconify-middle" data-icon="mdi:github"></i>
                </a>
            </#if>
        </p>
    </section>

    <section id="writing">
        <span class="h1"><a href="${blog_url!}/archives">Writing</a></span>

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
