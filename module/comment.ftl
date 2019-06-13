<#macro comment post,type>
    <p style="margin-top:20px;"><p>
    <#if !post.disallowComment!false>
        <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <script src="${context!}/guqing_higan/source/js/halo-comment.min.js"></script>
        <halo-comment id="${post.id}" type="${type}" style="color:#fff!important;"/>
    </#if>
</#macro>
