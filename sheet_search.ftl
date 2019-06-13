<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 搜索" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <article class="post" itemscope itemtype="http://schema.org/BlogPosting">
      <div class="content" itemprop="articleBody">
        <section id="search">
              <form>
                <input type="text" class="search-input" id="search-input" placeholder="搜索...">
              </form>
            <div id="search-result">

            </div>
            <p class="search-no-result">抱歉，没有符合您搜索条件的结果。请换其它关键词再试。</p>
        </section>
      </div>
    </article>

 <!-- jquery -->
<script src="${context!}/guqing_higan/source/js/jquery.min.js"></script>
<script type="text/javascript">
  $(function() {
    var $inputArea = $("input#search-input");
    var $resultArea = document.querySelector("div#search-result");

    $inputArea.focus(function() {

    });
    $inputArea.keydown(function(e) {
      if (e.which == 13) {
        var keyword = $inputArea.val();
        console.log("搜索关键字：" + keyword)
        e.preventDefault();
      }
    });
  });
  </script>
</@layout>
