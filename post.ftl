<#include "module/macro.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
  <div id="header-post">
    <a id="menu-icon" href="#"><i class="fas fa-bars fa-lg"></i></a>
    <a id="menu-icon-tablet" href="#"><i class="fas fa-bars fa-lg"></i></a>
    <a id="top-icon-tablet" href="#" onclick="$('html, body').animate({ scrollTop: 0 }, 'fast');"
       style="display:none;"><i class="fas fa-chevron-up fa-lg"></i></a>
    <div id="menu" style="visibility: hidden">
      <span id="nav">
          <@menuTag method="list">
            <ul>
              <#list menus?sort_by('priority') as menu>
                <li>
                  <a href="${menu.url!}" target="${menu.target!}">${menu.name!}</a>
                </li>
              </#list></ul>
          </@menuTag>
      </span>
      <br>
      <span id="actions">
        <ul>
         <#if prevPost??>
           <li>
             <a class="icon" href="${prevPost.fullPath!}">
              <i
                      class="fas fa-chevron-left"
                      aria-hidden="true"
                      onmouseover="$('#i-prev').toggle();"
                      onmouseout="$('#i-prev').toggle();">
              </i>
             </a>
           </li>
         </#if>
            <#if nextPost??>
              <li>
            <a class="icon" href="${nextPost.fullPath!}">
              <i
                      class="fas fa-chevron-right"
                      aria-hidden="true"
                      onmouseover="$('#i-next').toggle();"
                      onmouseout="$('#i-next').toggle();">
              </i>
            </a>
            </li>
            </#if>
        <li><a class="icon" href="#" onclick="$('html, body').animate({ scrollTop: 0 }, 'fast');"><i
                    class="fas fa-chevron-up" aria-hidden="true" onmouseover="$('#i-top').toggle();"
                    onmouseout="$('#i-top').toggle();"></i></a></li>
        <li><a class="icon" href="#"><i class="fas fa-share-alt" aria-hidden="true"
                                        onmouseover="$('#i-share').toggle();" onmouseout="$('#i-share').toggle();"
                                        onclick="$('#share').toggle();return false;"></i></a></li>
        </ul>
        <#if prevPost??>
          <span id="i-prev" class="info" style="display:none;">Previous post</span>
        </#if>
          <#if nextPost??>
            <span id="i-next" class="info" style="display:none;">Next post</span>
          </#if>
        <span id="i-top" class="info" style="display:none;">Back to top</span>
        <span id="i-share" class="info" style="display:none;">Share post</span>
      </span>
      <br>
      <div id="share" style="display: none">
        <ul>
          <li><a class="icon"
                 href="http://www.facebook.com/sharer.php?u=http://probberechts.github.io/2016/11/14/hello-world/"><i
                      class="fab fa-facebook " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="https://twitter.com/share?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;text=Hello World"><i
                      class="fab fa-twitter " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="http://www.linkedin.com/shareArticle?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;title=Hello World"><i
                      class="fab fa-linkedin " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="https://pinterest.com/pin/create/bookmarklet/?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;is_video=false&amp;description=Hello World"><i
                      class="fab fa-pinterest " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="mailto:?subject=Hello World&amp;body=Check out this article: http://probberechts.github.io/2016/11/14/hello-world/"><i
                      class="fas fa-envelope " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="https://getpocket.com/save?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;title=Hello World"><i
                      class="fab fa-get-pocket " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="http://reddit.com/submit?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;title=Hello World"><i
                      class="fab fa-reddit " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="http://www.stumbleupon.com/submit?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;title=Hello World"><i
                      class="fab fa-stumbleupon " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="http://digg.com/submit?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;title=Hello World"><i
                      class="fab fa-digg " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="http://www.tumblr.com/share/link?url=http://probberechts.github.io/2016/11/14/hello-world/&amp;name=Hello World&amp;description="><i
                      class="fab fa-tumblr " aria-hidden="true"></i></a></li>
          <li><a class="icon"
                 href="https://news.ycombinator.com/submitlink?u=http://probberechts.github.io/2016/11/14/hello-world/&amp;t=Hello World"><i
                      class="fab fa-hacker-news " aria-hidden="true"></i></a></li>
        </ul>
      </div>
      <div id="toc"></div>
    </div>
  </div>
  <article class="post" itemscope itemtype="http://schema.org/BlogPosting">
    <header>
      <h1 class="posttitle" itemprop="name headline">
          ${post.title!}
      </h1>
      <div class="meta">
                <span class="author" itemprop="author" itemscope>
                    <span itemprop="name">${user.nickname!}</span>
                </span>

        <div class="postdate">
          <time datetime="${post.editTime!}" itemprop="datePublished">
              ${post.editTime?string["MMMM dd yyyy"]}
          </time>
        </div>

          <#if (post.tags?size > 0)>
            <div class="article-tag">
              <i class="fas fa-tag"></i>
                <#list post.tags as postTag>
                  <a class="tag-link" href="${postTag.fullPath!}">${postTag.name}</a>
                </#list>
            </div>
          </#if>
      </div>
    </header>

    <div class="content" itemprop="articleBody">
        ${post.formatContent!}
    </div>
  </article>
    <#include "module/comment.ftl">
  <br>
    <@global.comment target=post type="post" />

  <script src="${theme_base!}/lib/jquery/jquery.min.js"></script>
  <script src="${theme_base!}/js/highlight.min.js"></script>
  <link rel="stylesheet" href="${theme_base!}/lib/tocbot/tocbot.css">
  <script src="${theme_base!}/lib/tocbot/tocbot.min.js"></script>
  <script type="text/javascript">
    $(function () {

      // mount it!
      $(".content pre").wrap('<figure class="highlight"></figure>');
      // copy-btn HTML
      $(".content figure pre").before('<span class="btn-copy tooltipped tooltipped-sw" aria-label="Copy to clipboard!"><i class="far fa-clone"></i></span>');
      // code highlight
      document.querySelectorAll('pre code').forEach(el => {
        hljs.highlightElement(el)
      })

      var clip = new ClipboardJS('.btn-copy', {
        text: function (trigger) {
          return Array.from(trigger.nextElementSibling.querySelectorAll('.code')).reduce((str, it) => str + it.innerText + '\n', '')
        }
      });
      clip.on('success', function (e) {
        e.trigger.setAttribute('aria-label', "Copied!");
        e.clearSelection();
      })

      tocbot.init({
        tocSelector: '#toc',
        contentSelector: '.post .content',
        // Main class to add to links.
        linkClass: 'toc-link',
        activeLinkClass: 'is-active-link toc-active-link'
      });
    })
  </script>
</@layout>
