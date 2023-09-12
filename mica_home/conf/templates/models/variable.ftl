<!-- Default model macros -->
<#include "../libs/variable.ftl">

<!-- Custom model macros, to redefine some default model macros -->

<#macro variableSummary variable>
  <div id="loadingSummary" class="spinner-border spinner-border-sm" role="status"></div>

  <#if showHarmonizedVariableSummarySelector>
    <div style="display: none;" class="mb-4">
      <select id="select-study" class="form-control select2 float-right" style="width: 100%;"></select>
    </div>
  </#if>

  <div>
    <div class="row d-flex align-items-center">
      <div id="categoricalSummary" style="display: none" class="col-xs-12 offset-lg-2 col-lg-8">
        <div class="table-responsive">
          <table class="table table-striped border">
            <thead>
              <tr>
                <th><@message "values"/></th>
                <th><@message "frequencies"/></th>
              </tr>
            </thead>
            <tbody id="validValues"></tbody>
            <tbody id="otherValues"></tbody>
            <tbody>
              <tr>
                <th><@message "total"/></th>
                <td id="frequencyTotal"></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="row d-flex align-items-center">
      <div class="col-xs-12 col-lg-12">
        <div id="continuousSummary" class="table-responsive" style="display: none;">
          <span><@message "continuous-summary-title"/></span>
          <table class="table border">
            <thead>
            <tr>
              <th><@message "min"/></th>
              <th><@message "max"/></th>
              <th><@message "mean"/></th>
              <th><@message "stdDev"/></th>
              <th><@message "n-with-values"/></th>
              <th id="missings-column"><@message "n-missings" /></th>
              <th><@message "total"/></th>
            </tr>
            </thead>
            <tbody></tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="row d-flex align-items-center">
      <div class="col-xs-12 offset-lg-2 col-lg-8">
        <div id="frequencyChart"></div>
      </div>
    </div>
  </div>

  <div id="noSummary" style="display: none">
    <span class="text-muted"><@message "no-variable-summary"/></span>
  </div>
</#macro>

<#macro harmonizationTableLegend showMessage=true>
  <div class="pb-2">
    <#if showMessage>
      <p><@message "harmonization-table-legend-title"/></p>
    </#if>
    <ul id="harmonization-legend" class="list-unstyled">
      <li><i class="fas fa-check fa-fw text-success"></i><span class="pl-2"><@message "harmonization-complete"/></span></li>
      <li><i class="fas fa-adjust fa-fw text-partial"></i><span class="pl-2"><@message "harmonization-partial"/></span></li>
      <li><i class="fas fa-times fa-fw text-danger"></i><span class="pl-2"><@message "harmonization-impossible"/></span></li>
      <li><i class="fas fa-minus fa-fw text-black"></i><span class="pl-2"><@message "harmonization-na"/></span></li>
      <li><i class="fas fa-question fa-fw text-warning"></i><span class="pl-2"><@message "harmonization-undetermined"/></span></li>
    </ul>
  </div>
</#macro>

