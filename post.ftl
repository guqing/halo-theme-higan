<#include "./module/macro.ftl">
<#include "./module/comment.ftl">
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
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
    <#if settings.disqus??>
      <div id="disqus_thread"></div>
    <#else>
      <@comment target=post type="post" />
    </#if>
  </article>

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

      const postTitleUpperCase = ${settings.post_title_uppper?c}
      if(postTitleUpperCase) {
        $(".post .posttitle").addClass("title-upper-case")
      }

    })
  </script>
</@layout>
