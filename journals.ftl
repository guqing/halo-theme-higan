<#include "module/macro.ftl">
<#include "./module/comment.ftl">
<script src="${theme_base!}/lib/font-awesome/js/brands.js"></script>
<@layout title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
  <article class="journal" itemscope itemtype="http://schema.org/BlogPosting">
    <div class="content">
      <ul class="post-list">
          <#list journals.content as journal>
            <li>
              <h2>${journal.createTime?string('yyyy年MM月dd日')}</h2>
                ${journal.content!}
              <div class="operation">
                <a href="javascript:handleLike(${journal.id?c})" data-journal-id="${journal.id?c}">
                  <i class="fa-brands fa-gratipay"></i>
                  <span data-journal-id="${journal.id?c}">${journal.likes!}</span>
                </a>
                <a href="#journal-comment-${journal.id}" style="margin-left: 5px">
                  <i class="fa-solid fa-comment-dots"></i>
                  <span>${journal.commentCount!}</span>
                </a>
                <div id="journal-comment-${journal.id}" class="journal-comment">
                    <#if settings.disqus??>
                      <div id="disqus_thread"></div>
                    <#else>
                        <@comment target=journal type="journal" />
                    </#if>
                </div>
              </div>
            </li>
          </#list>
      </ul>
    </div>
    <script>
      const likes_localstorage_key = "higan.likes.journal.ids";
      let likedIds = JSON.parse(localStorage.getItem(likes_localstorage_key) || "[]");
      likedIds.forEach(journalId => {
        var dom = document.querySelector(".journal .operation a[data-journal-id='" + journalId + "']")
        dom.style.color = "var(--color-link)";
        dom.style.fontWeight = "500";
      })

      function liked(id) {
        return likedIds.includes(id);
      }

      function handleLike(journalId) {
        if (liked(journalId)) {
          return
        }

        const xhr = new XMLHttpRequest();

        xhr.open('POST', "/api/content/journals/" + journalId + "/likes");

        xhr.onload = () => {
          likedIds = [...likedIds, journalId];
          localStorage.setItem(likes_localstorage_key, JSON.stringify(likedIds));

          const likesNode = document.querySelector("[data-journal-id=\"" + journalId + "\"]");
          const likes = parseInt(likesNode.innerText);
          likesNode.innerText = likes + 1;
        }
        xhr.onerror = function () {
          alert("网络请求失败，请稍后再试");
        };
        xhr.send();
      }
    </script>
  </article>
</@layout>
