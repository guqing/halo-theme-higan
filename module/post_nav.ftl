<div id="header-post">
  <a id="menu-icon" href="#">
    <i class="iconify iconify-middle" data-icon="material-symbols:menu"></i>
  </a>
  <a id="menu-icon-tablet" href="#"><i class="iconify iconify-middle" data-icon="material-symbols:menu"></i></a>
  <a id="top-icon-tablet" href="#" onclick="$('html, body').animate({ scrollTop: 0 }, 'fast');"
     style="display:none;"><i class="iconify iconify-middle material-symbols:keyboard-arrow-up"></i></a>
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
               <i class="iconify iconify-large"
                  data-icon="mdi:chevron-left"
                  onmouseover="$('#i-prev').toggle();"
                  onmouseout="$('#i-prev').toggle();"
               ></i>
             </a>
           </li>
         </#if>
            <#if nextPost??>
              <li>
            <a class="icon" href="${nextPost.fullPath!}">
              <i class="iconify iconify-large"
                 data-icon="ic:round-chevron-right"
                 onmouseover="$('#i-next').toggle();"
                 onmouseout="$('#i-next').toggle();"
              ></i>
            </a>
            </li>
            </#if>
        <li><a class="icon" href="#" onclick="$('html, body').animate({ scrollTop: 0 }, 'fast');">
            <i class="iconify iconify-large"
               data-icon="material-symbols:keyboard-arrow-up"
               onmouseover="$('#i-top').toggle();"
               onmouseout="$('#i-top').toggle();"
            ></i>
          </a></li>
        <li><a class="icon" href="#">
            <i class="iconify iconify-middle"
               data-icon="mdi:share-variant-outline"
               onmouseover="$('#i-share').toggle();" onmouseout="$('#i-share').toggle();"
               onclick="$('#share').toggle();return false;"
            ></i>
          </a></li>
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
               href="http://www.facebook.com/sharer.php?u=${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="ic:baseline-facebook"></i></a></li>
        <li><a class="icon"
               href="https://twitter.com/share?url=${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="mdi:twitter-circle"></i></a></li>
        <li><a class="icon"
               href="http://www.linkedin.com/shareArticle?url=${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="mdi:linkedin"></i></a></li>
        <li><a class="icon"
               href="https://pinterest.com/pin/create/bookmarklet/?url=${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="mdi:pinterest"></i></a></li>
        <li><a class="icon"
               href="mailto:?subject=${post.title!}&amp;body=Check out this article: ${post.fullPath!}">
            <i class="iconify" data-icon="ph:envelope-simple-bold"></i></a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="mdi:pocket"></i></a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="ic:baseline-reddit"></i></a></li>
        <li>
          <a class="icon" href="${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="carbon:logo-stumbleupon"></i>
          </a></li>
        <li><a class="icon" href="${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="fa-brands:digg"></i>
          </a></li>
        <li><a class="icon"
               href="${post.fullPath!}&amp;title=${post.title!}">
            <i class="iconify" data-icon="fa-brands:hacker-news"></i>
          </a></li>
      </ul>
    </div>
    <div id="toc"></div>
  </span>
</div>
