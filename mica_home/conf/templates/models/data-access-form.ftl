<#include "../libs/data-access-form.ftl">

<#macro dataAccessFormPrintFooter form>
  <div class="border-top mt-3 pt-3">
    <div class="float-left">
      <small><span class="moment-datetime text-muted">${.now}</span></small>
    </div>
    <div class="float-right">
      <#if form.lastSubmission??>
        <small><@message "form-submitted-on"/> <span class="moment-datetime text-muted">${form.lastSubmission.changedOn.toString()}</span></small>
      </#if>
    </div>
  </div>
</#macro>
