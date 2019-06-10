<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 搜索" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
<div class="content index py4">
    <header id="header">
        <a href="/">
            <div id="logo" style="background-image: url(/images/logo.png);"></div>
            <div id="title">
              <h1>Swing&#39;Blog 有恨无人省</h1>
            </div>
        </a>
      <div id="nav">
        <ul>
          <li class="icon">
            <a href="#"><i class="fas fa-bars fa-2x"></i></a>
          </li>
          <@menuTag method="list">
            <#list menus as menu>
              <li>
                  <a href="${menu.url!}">${menu.name!}</a>
              </li>
            </#list>
           </@menuTag>
        </ul>
      </div>
    </header>
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

    <footer id="footer">
      <div class="footer-left">
        Copyright &copy; 2019 Swing
      </div>
      <div class="footer-right">
        <nav>
          <ul>
              <li><a href="/about/">About</a></li>
              <li><a href="/archives/">Articles</a></li>
              <li><a href="/link">Links</a></li>
              <li><a href="/search/">Search</a></li>
          </ul>
        </nav>
      </div>
    </footer>
</div>
 <!-- jquery -->
<script src="${context!}/guqing_higan/source/js/jquery.min.js"></script>
<script src="${context!}/guqing_higan/source/js/main.js"></script>
<!-- search -->
<script src="${context!}/guqing_higan/source/js/search.js"></script>
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
