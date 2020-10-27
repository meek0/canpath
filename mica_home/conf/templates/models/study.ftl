<!-- Default model macros -->
<#include "../libs/study.ftl">

<!-- Custom model macros, to redefine some default model macros -->
<#macro studyAccess study>
  <div class="card card-info card-outline">
    <div class="card-header">
      <h3 class="card-title">
        <@message "study.access.label"/>
      </h3>
      <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="<@message "collapse"/>">
          <i class="fas fa-minus"></i></button>
      </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
      <dl class="row">
        <dt class="col-sm-6" title="<@message "study_taxonomy.vocabulary.methods-recruitments.description"/>">
          <@message "study.access.for"/>
        </dt>
        <dd class="col-sm-6">
          <ul class="pl-3">
            <#list study.model.access as type>
              <li>
                <#assign text = "study_taxonomy.vocabulary.access.term." + type + ".title"/>
                <@message text/>
                <#if type == "other" && study.model.otherAccess??>
                  : ${localize(study.model.otherAccess)}
                </#if>
              </li>
            </#list>
          </ul>
        </dd>
      </dl>
    </div>
  </div>
</#macro>

