<div class="alert alert-info alert-dismissible mb-4 fade show">
  <div>
    <p>
      To view data filtered by multiple variables, please <a href="/contact">contact the Access Office</a> for assistance.
    </p>
    <div>
      Start searching by selecting a facet.
      <#if !user??>
        To save your search results, please <a href="/signin?redirect=/search">log in</a> or <a href="signup">register</a>.
      </#if>
    </div>
  </div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
