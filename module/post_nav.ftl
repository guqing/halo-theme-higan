<script src="${theme_base!}/lib/font-awesome/js/brands.js"></script>
<div id="header-post">
  <a id="menu-icon" href="#">
    <i class="fa-solid fa-bars fa-lg"></i></a>
  <a id="menu-icon-tablet" href="#"><i class="fa-solid fa-bars fa-lg"></i></a>
  <a id="top-icon-tablet" href="#" onclick="$('html, body').animate({ scrollTop: 0 }, 'fast');"
     style="display:none;"><i class="fa-brands fa-chevron-up fa-lg"></i></a>
  <span id="menu" style="visibility: hidden">
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
               href="http://www.facebook.com/sharer.php?u=${post.fullPath!}&amp;title=${post.title!}"><i
                    class="fab fa-facebook " aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="https://twitter.com/share?url=${post.fullPath!}&amp;title=${post.title!}">
            <i class="fab fa-twitter"aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="http://www.linkedin.com/shareArticle?url=${post.fullPath!}&amp;title=${post.title!}"><i
                    class="fab fa-linkedin " aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="https://pinterest.com/pin/create/bookmarklet/?url=${post.fullPath!}&amp;title=${post.title!}"><i
                    class="fab fa-pinterest " aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="mailto:?subject=${post.title!}&amp;body=Check out this article: ${post.fullPath!}"><i
                    class="fas fa-envelope " aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}"><i
                    class="fab fa-get-pocket " aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}"><i
                    class="fab fa-reddit " aria-hidden="true"></i></a></li>
        <li>
          <a class="icon" href="${post.fullPath!}&amp;title=${post.title!}">
               <i class="fab fa-stumbleupon" aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}"><i
                    class="fab fa-digg " aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}&amp;description=${post.summary!}"><i
                    class="fab fa-tumblr " aria-hidden="true"></i></a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}"><i
                    class="fab fa-hacker-news " aria-hidden="true"></i></a></li>
      </ul>
    </div>
    <div id="toc"></div>
  </span>
</div>
