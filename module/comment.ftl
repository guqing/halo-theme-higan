<#-- comment module -->
<#macro comment target,type>
    <#if !target.disallowComment!false>
        <script src="https://unpkg.com/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
        <halo-comment id="${target.id}" type="${type}"/>
    </#if>
</#macro>