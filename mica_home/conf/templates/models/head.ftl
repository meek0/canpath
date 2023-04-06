<!-- Custom CSS rules -->
<link rel="stylesheet" href="/assets/css/custom.css"/>
<link rel="stylesheet" href="/assets/css/mica-custom.css"/>

<#macro messageArgs code args>
    <@spring.messageArgsText code args code/>
</#macro>

<#function arrayNotEmpty array=[]>
    <#assign notEmpty = true>
    <#if array?? && array?size gt 0>
        <#list array as element>
            <#assign notEmpty = notEmpty && element?? && element?has_content>
        </#list>
    <#else>
        <#return false>
    </#if>
    <#return notEmpty>
</#function>

<#function localizedStringNotEmpty txt={}>
    <#assign notEmpty = true>
    <#if txt?? && txt?keys??>
        <#assign notEmpty = txt[.lang]?? && txt[.lang]?has_content && txt[.lang]?trim?has_content>
    <#else>
        <#return false>
    </#if>
    <#return notEmpty>
</#function>

<#macro relevantPapers entity>
    <div class="card card-success card-outline w-100">
        <div class="card-header">
            <h3 class="card-title"><@message "relevant-papers.title"/></h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">

            <#list entity.model.relevantPapers as paper>

<#--                <p class="<#if paper?has_next>mb-4</#if>">-->
                <p>
                    ${paper.info}
                    <#if (paper.pubmedId)?has_content>
                        <a class="d-block mt-1" href="http://www.ncbi.nlm.nih.gov/pubmed/${paper.pubmedId}" target="_blank">PUBMED ${paper.pubmedId}</a>
                    </#if>
                </p>
            </#list>
        </div>
    </div>
</#macro>