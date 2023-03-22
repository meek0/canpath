<#include "../libs/search.ftl">

<#macro searchInfo>
  <div id="search-info" class="alert alert-info bg-callout alert-dismissible mb-4 fade show" style="display: none">
    <div>
      <p>
        To view data filtered by multiple variables, please <a href="/contact">contact the Access Office</a> for assistance.
      </p>
      <div>
        Start searching by selecting an attribute.
        <#if !user??>
          To save your search results, please <a href="/signin?redirect=/search">log in</a> or <a href="signup">register</a>.
        </#if>
      </div>
    </div>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
</#macro>
