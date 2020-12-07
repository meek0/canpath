<!-- Favicon -->
<#assign faviconPath = "/assets/favicon.ico"/>

<!-- Branding -->
<#assign brandImageSrc = "/assets/images/logo.png"/>
<#assign brandImageClass = ""/>
<#assign brandTextClass = "CanPath"/>
<#assign brandTextEnabled = true/>

<!-- Theme -->
<!--#assign adminLTEPath = "/assets/theme"/-->

<!-- Cart -->
<#assign cartEnabled = (config?? && config.cartEnabled && (config.studyDatasetEnabled || config.harmonizationDatasetEnabled))/>
<!-- Cart feature is only visible to any authenticated users -->
<#assign cartEnabled = cartEnabled && user??/>
<!-- To download the list of variable IDs (and the Opal views, if enabled) -->
<#assign showCartDownload = (isAdministrator || isReviewer || isEditor || isDAO)/>
<!-- To reinstate the cart as views in Opal -->
<#assign showCartViewDownload = (isAdministrator || isReviewer || isEditor || isDAO)/>

<!-- Repository list pages -->
<#assign listDisplays = ["lines"]/>
<#assign listDefaultDisplay = "lines"/>
<#assign studyListDisplays = listDisplays/>
<#assign studyListDefaultDisplay = listDefaultDisplay/>
<#assign datasetListDisplays = ["cards"]/>
<#assign datasetListDefaultDisplay = "cards"/>

<!-- Search -->
<#assign defaultSearchState = "#lists?type=variables"/>
<#assign searchVariableColumns = ["label+description", "valueType", "annotations", "type", "dataset"]/>
<#assign searchDatasetColumns = ["name", "type", "variables"]/>
<#assign searchStudyListDisplay = false/>
<#assign searchNetworkListDisplay = false/>
<#assign searchGraphicsDisplay = false/>
<#assign searchCriteriaMenus = ["variable"]/>

<!-- Variables classifications charts -->
<#assign studyVariablesClassificationsTaxonomies = []/>
