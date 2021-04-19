<!-- Macros -->
<#include "libs/header.ftl">
<#include "models/variable.ftl">
<#include "models/population.ftl">
<#include "models/dce.ftl">
<#include "models/files.ftl">

<#if type == "Harmonized" || type == "Dataschema">
  <#assign variableCartId = (variable.datasetId + ":" + variable.name + ":Dataschema")/>
  <#assign datasetsUrl = "harmonized-datasets"/>
  <#assign datasetsType = "harmonized-datasets"/>
  <#assign studyType = "harmonization-study"/>
<#else>
  <#assign variableCartId = variable.id/>
  <#assign datasetsType = "collected-datasets"/>
  <#assign datasetsUrl = "collected-datasets"/>
  <#assign studyType = "individual-study"/>
</#if>

<#function harmonizationStatusClass status="">
  <#local cssClass = ""/>
  <#switch status>
    <#case "complete">
      <#local cssClass = "success"/>
      <#break>
    <#case "undetermined">
      <#local cssClass = "warning"/>
      <#break>
    <#case "impossible">
      <#local cssClass = "danger"/>
      <#break>
    <#case "partial">
      <#local cssClass = "partial"/>
      <#break>
    <#case "na">
      <#local cssClass = "black"/>
      <#break>
    <#default>
      <#local cssClass = "info"/>
      <#break>
  </#switch>
  <#return cssClass>
</#function>

<#macro groupAnnotationByTaxonomy annotations>
  <div class="col-sm-12 col-md d-flex align-items-stretch">
    <div class="card card-info card-outline w-100">
      <div class="card-header">
        <h3 class="card-title"><@message "classifications.title"/></h3>
      </div>
      <div class="card-body pb-0">
            <#local prevTaxo = ""/>
            <#list annotations as annotation>
              <#local currTaxo = annotation.taxonomyName/>
                <#if prevTaxo != currTaxo>
                  <#if prevTaxo?has_content>
                    </dl>
                  </#if>

                  <h6 class="text-info <#if prevTaxo?length != 0>mt-4</#if>">${localize(annotation.taxonomyTitle)}</h6>
                  <dl class="row striped mt-0 mb-1">
                  <#local prevTaxo = currTaxo/>
                </#if>
                  <dt class="col-sm-4" title="<#if annotation.vocabularyDescription??>${localize(annotation.vocabularyDescription)}</#if>">
                      ${localize(annotation.vocabularyTitle)}
                  </dt>
                  <dd class="col-sm-8" title="<#if annotation.termDescription??>${localize(annotation.termDescription)}</#if>">
                    <span class="marked"><template>${localize(annotation.termTitle)}</template></span>
                  </dd>
            </#list>
      </div>
      <div class="card-footer">
        <a href="${contextPath}/search#lists?type=variables&query=${query}">
          <@message "find-similar-variables"/> <i class="fas fa-search"></i>
        </a>
      </div>
    </div>
  </div>
</#macro>

<!DOCTYPE html>
<html lang="${.lang}">
<head>
  <#include "libs/head.ftl">
  <title>${config.name!""} | ${variable.name}</title>
</head>
<body id="${type?lower_case}-variable-page" class="hold-transition layout-top-nav layout-navbar-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <#include "libs/top-navbar.ftl">
  <!-- /.navbar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <#assign title = variable.name/>
    <#if opalTable?? && opalTable.name??>
      <#assign title = (variable.name + " [" + localize(opalTable.name) + "]")/>
    </#if>
    <@header titlePrefix=(type?lower_case + "-variable") title="variable" subtitle=""/>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container">

        <div class="row d-flex align-items-stretch">
          <div class="col-lg-12">
            <div class="card card-info card-outline">
              <div class="card-body">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="col-lg-12">
                      <h3 class="mb-4">${variable.name}</h3>
                      <dl class="row mb-0">
                        <#if variable.attributes?? && variable.attributes.label??>
                          <dt class="col-1"><@message "label"/></dt>
                          <dd class="col-11 marked"><template>${localize(variable.attributes.label)}</template></dd>
                        <#else>
                          <p class="text-muted"><@message "no-label"/></p>
                        </#if>
                        <#if variable.attributes?? && variable.attributes.description??>
                          <dt class="col-1"><@message "description"/></dt>
                          <dd class="col-11 marked"><template>${localize(variable.attributes.description)}</template></dd>
                        </#if>
                      </dl>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row d-flex align-items-stretch">
          <div class="col-xs-12 col-md d-flex align-items-stretch">
            <div class="card card-info card-outline w-100">
              <div class="card-header">
                <h3 class="card-title"><@message "overview"/></h3>
              </div>
              <div class="card-body pb-0">
                <dl class="row striped mt-0 mb-1">
                  <dt class="col-sm-4"><@message "${studyType}"/></dt>
                  <#if study??>
                    <#if studyPublished>
                      <dd class="col-sm-8"><a href="${contextPath}/study/${study.id}">${localize(study.acronym)}</a></dd>
                    <#else>
                      <dd class="col-sm-8">${localize(study.acronym)}</dd>
                    </#if>
                  </#if>
                  <dt class="col-sm-4"><@message "dataset"/></dt>
                  <dd class="col-sm-8"><a href="${contextPath}/dataset/${variable.datasetId}">${localize(variable.datasetAcronym)}</a></dd>
                  <dt class="col-sm-4"><@message "value-type"/></dt>
                  <dd class="col-sm-8"><@message "variable_taxonomy.vocabulary.valueType.term." + variable.valueType + ".title"/></dd>
                  <dt class="col-sm-4"><@message "client.label.variable.variable-type"/></dt>
                  <dd class="col-sm-8">${variable.variableType}</dd>
                </dl>

                <#if variable.categories?? && variable.categories?size != 0>
                  <dl class="mt-4 mt-0 mb-1">
                    <dt class="h6 text-info"><@message "categories"/></dt>
                    <dd>
                      <table class="table table-striped table-sm mt-2">
                        <thead>
                        <tr>
                          <th><@message "name"/></th>
                          <th><@message "label"/></th>
                          <th><@message "missing"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list variable.categories as category>
                          <tr>
                            <td>${category.name}</td>
                            <td>
                              <#if category.attributes??>
                                ${localize(category.attributes.label)}
                              </#if>
                            </td>
                            <td><#if category.missing><i class="fas fa-check"></i></#if></td>
                          </tr>
                        </#list>
                        </tbody>
                      </table>
                    </dd>
                  </dl>
                </#if>
              </div>
            </div>
          </div>

          <#if annotations?? && annotations?size != 0>
            <@groupAnnotationByTaxonomy annotations/>
            <br/>
          </#if>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="card card-info card-outline">
              <div class="card-header">
                <h3 class="card-title"><@message "summary-statistics"/></h3>
                <#if showDatasetContingencyLink>
                  <#if variable.nature == "CATEGORICAL">
                    <a class="btn btn-primary float-right" href="${contextPath}/dataset-crosstab/${variable.datasetId}?var1=${variable.name}">
                      <i class="fas fa-cog"></i> <@message "dataset.crosstab.title"/>
                    </a>
                  <#elseif variable.nature == "CONTINUOUS">
                    <a class="btn btn-primary float-right" href="${contextPath}/dataset-crosstab/${variable.datasetId}?var2=${variable.name}">
                      <i class="fas fa-cog"></i> <@message "dataset.crosstab.title"/>
                    </a>
                  </#if>
                </#if>
              </div>
              <div class="card-body">
                <#if user?? || !config.variableSummaryRequiresAuthentication>
                  <@variableSummary variable=variable/>
                <#else>
                  <@message "sign-in-for-variable-statistics"/>
                  <a href="${contextPath}/signin?redirect=${contextPath}/variable/${variable.id}" class="btn btn-info"><@message "sign-in"/></a>
                </#if>
              </div>
            </div>
          </div>
        </div>

        <#if type == "Dataschema">
          <div class="row">
            <div class="col-12">
              <div class="card card-info card-outline">
                <div class="card-header">
                  <h3 class="card-title"><@message "harmonized-variables"/></h3>
                </div>
                <div class="card-body">
                  <div id="loadingHarmonizedVariables" class="spinner-border spinner-border-sm" role="status"></div>
                  <div class="table-responsive">
                    <table id="harmonizedVariables" class="table table-striped" style="display: none">
                      <thead>
                        <tr>
                          <th><@message "variable"/></th>
                          <th><@message "study"/></th>
                          <th><@message "data-collection-event"/></th>
                          <th><@message "status"/></th>
                          <th><@message "status-detail"/></th>
                          <th><@message "comment"/></th>
                        </tr>
                      </thead>
                      <tbody></tbody>
                    </table>
                  </div>
                  <div id="noHarmonizedVariables" style="display: none">
                    <span class="text-muted"><@message "no-harmonized-variables"/></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </#if>

      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <#include "libs/footer.ftl">
</div>
<!-- ./wrapper -->

<#include "libs/scripts.ftl">
<#include "libs/variable-scripts.ftl">

</body>
</html>
