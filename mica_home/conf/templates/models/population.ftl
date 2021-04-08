<!-- Default model macros -->
<#include "../libs/population.ftl">

<!-- Custom model macros, to redefine some default model macros -->

<#function hasRecruitment population>
    <#if (population.model.recruitment)?? &&
    ((population.model.recruitment.generalPopulationSources?? && population.model.recruitment.generalPopulationSources?size != 0) ||
    (population.model.recruitment.specificPopulationSources?? && population.model.recruitment.specificPopulationSources?size != 0) ||
    (population.model.recruitment.studies?? && population.model.recruitment.studies?size != 0))>
        <#return true>
    </#if>
    <#return false>
</#function>

<#function hasNumberOfParticipants population>
    <#if (population.model.numberOfParticipants)?? &&
    (population.model.numberOfParticipants.participant.number?? ||
    (population.model.numberOfParticipants.participant.noLimit?? && population.model.numberOfParticipants.participant.noLimit == true) ||
    population.model.numberOfParticipants.sample.number?? ||
    (population.model.numberOfParticipants.sample.noLimit?? && population.model.numberOfParticipants.sample.noLimit == true) ||
    population.model.numberOfParticipants.info??)>
        <#return true>
    </#if>
    <#return false>
</#function>

<#function hasSelectionCriteria population={}>
    <#if (population.model.selectionCriteria?? &&
    (population.model.selectionCriteria.gender?? ||
    population.model.selectionCriteria.ageMin?? ||
    population.model.selectionCriteria.ageMax?? ||
    (population.model.selectionCriteria.pregnantWomen?? && population.model.selectionCriteria.pregnantWomen?size != 0) ||
    (population.model.selectionCriteria.newborn?? && population.model.selectionCriteria.newborn == true) ||
    (population.model.selectionCriteria.twins?? && population.model.selectionCriteria.twins == true) ||
    (population.model.selectionCriteria.countriesIso?? && population.model.selectionCriteria.countriesIso?size != 0) ||
    population.model.selectionCriteria.territory?? ||
    arrayNotEmpty(population.model.selectionCriteria.ethnicOrigin) ||
    arrayNotEmpty(population.model.selectionCriteria.healthStatus) ||
    population.model.selectionCriteria.otherCriteria?? ||
    localizedStringNotEmpty(population.model.selectionCriteria.info)))>
        <#return true>
    </#if>
    <#return false>
</#function>

<#macro populationModel population id=population.id>

  <!-- Individual study -->
  <div class="row">
      <#if hasSelectionCriteria(population)>
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">
                  <@message "study.selection-criteria.label"/>
              </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body pb-0">
              <dl class="row striped">
                  <#if population.model.selectionCriteria.gender??>
                    <dt class="col-sm-2">
                        <@message "population.gender"/>
                    </dt>
                    <dd class="col-sm-10">
                      <div><@message "study_taxonomy.vocabulary.populations-selectionCriteria-gender.term.${population.model.selectionCriteria.gender}.title"/></div>
                    </dd>
                  </#if>

                  <#if population.model.selectionCriteria.ageMin??>
                    <dt class="col-sm-2">
                        <@message "population.ageMin"/>
                    </dt>
                    <dd class="col-sm-10">
                      <div>${population.model.selectionCriteria.ageMin}</div>
                    </dd>
                  </#if>

                  <#if population.model.selectionCriteria.ageMax??>
                    <dt class="col-sm-2">
                        <@message "population.ageMax"/>
                    </dt>
                    <dd class="col-sm-10">
                      <div>${population.model.selectionCriteria.ageMax}</div>
                    </dd>
                  </#if>

                  <#if population.model.selectionCriteria.pregnantWomen?? && population.model.selectionCriteria.pregnantWomen?size != 0>
                    <dt class="col-sm-2" title="<@message "study_taxonomy.vocabulary.populations-selectionCriteria-pregnantWomen.description"/>">
                        <@message "study.selection-criteria.pregnant-women"/>
                    </dt>
                    <dd class="col-sm-10">
                      <ul class="list-unstyled my-0">
                          <#list population.model.selectionCriteria.pregnantWomen as type>
                            <li>
                                <#assign text = "study_taxonomy.vocabulary.populations-selectionCriteria-pregnantWomen.term." + type + ".title"/>
                                <@message text/>
                            </li>
                          </#list>
                      </ul>
                    </dd>
                  </#if>

                  <#if population.model.selectionCriteria.newborn?? && population.model.selectionCriteria.newborn == true>
                    <dt class="col-sm-2">
                        <@message "study.selection-criteria.newborn"/>
                    </dt>
                    <dd class="col-sm-10">
                      <i class="fas fa-check"></i>
                    </dd>
                  </#if>


                  <#if population.model.selectionCriteria.twins?? && population.model.selectionCriteria.twins == true>
                    <dt class="col-sm-2">
                        <@message "study.selection-criteria.twins"/>
                    </dt>
                    <dd class="col-sm-10">
                      <i class="fas fa-check"></i>
                    </dd>
                  </#if>

                  <#if population.model.selectionCriteria.countriesIso?? && population.model.selectionCriteria.countriesIso?size != 0>
                    <dt class="col-sm-2">
                        <@message "client.label.countries"/>
                    </dt>
                    <dd class="col-sm-10">
                      <ul class="list-inline list-comma-separated my-0">
                          <#list population.model.selectionCriteria.countriesIso as country>
                            <li class="list-inline-item"><@message country/></li>
                          </#list>
                      </ul>
                    </dd>
                  </#if>

                  <#if population.model.selectionCriteria.territory??>
                    <dt class="col-sm-2">
                        <@message "study.selection-criteria.territory"/>
                    </dt>
                    <dd class="col-sm-10">
                        ${localize(population.model.selectionCriteria.territory)}
                    </dd>
                  </#if>


                  <#if arrayNotEmpty(population.model.selectionCriteria.ethnicOrigin)>
                    <dt class="col-sm-2">
                        <@message "study.selection-criteria.ethnic-origin"/>
                    </dt>
                    <dd class="col-sm-10">
                      <ul class="list-inline list-comma-separated my-0">
                          <#list population.model.selectionCriteria.ethnicOrigin as item>
                            <li class="list-inline-item">${localize(item)}</li>
                          </#list>
                      </ul>
                    </dd>
                  </#if>

                  <#if arrayNotEmpty(population.model.selectionCriteria.healthStatus)>
                    <dt class="col-sm-2">
                        <@message "study.selection-criteria.health-status"/>
                    </dt>
                    <dd class="col-sm-10">
                      <ul class="list-inline list-comma-separated my-0">
                          <#list population.model.selectionCriteria.healthStatus as item>
                            <li class="list-inline-item">${localize(item)}</li>
                          </#list>
                      </ul>
                    </dd>
                  </#if>

                  <#if population.model.selectionCriteria.otherCriteria??>
                    <dt class="col-sm-2">
                        <@message "population.otherCriteria"/>
                    </dt>
                    <dd class="col-sm-10">
                        ${localize(population.model.selectionCriteria.otherCriteria)}
                    </dd>
                  </#if>

                  <#if localizedStringNotEmpty((population.model.selectionCriteria.info))>
                    <dt class="col-sm-2">
                        <@message "population.info"/>
                    </dt>
                    <dd class="col-sm-10">
                        ${localize(population.model.selectionCriteria.info)}
                    </dd>
                  </#if>
              </dl>
            </div>
            <!-- /.card-body -->
          </div>
        </div>
      </#if>
  </div>
  <div class="row d-flex align-items-stretch">
      <#if hasRecruitment(population)>
        <div class="col-sm-12 col-md d-flex align-items-stretch">

            <#if hasRecruitment(population)>
              <div class="card w-100">
                <div class="card-header">
                  <h3 class="card-title">
                      <@message "study_taxonomy.vocabulary.populations-recruitment-dataSources.title"/>
                  </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body pb-0">
                  <dl class="row striped">
                      <#if population.model.recruitment.generalPopulationSources?? && population.model.recruitment.generalPopulationSources?size != 0>
                        <dt class="col-sm-4" title="<@message "study_taxonomy.vocabulary.populations-recruitment-generalPopulationSources.description"/>">
                            <@message "study.recruitment-sources.general-population"/>
                        </dt>
                        <dd class="col-sm-8">
                          <ul class="list-unstyled my-0">
                              <#list population.model.recruitment.generalPopulationSources as type>
                                <li>
                                    <#assign text = "study_taxonomy.vocabulary.populations-recruitment-generalPopulationSources.term." + type + ".title"/>
                                    <@message text/>
                                </li>
                              </#list>
                          </ul>
                        </dd>
                      </#if>

                      <#if population.model.recruitment.specificPopulationSources?? && population.model.recruitment.specificPopulationSources?size != 0>
                        <dt class="col-sm-4" title="<@message "study_taxonomy.vocabulary.populations-recruitment-specificPopulationSources.description"/>">
                            <@message "study.recruitment-sources.specific-population"/>
                        </dt>
                        <dd class="col-sm-8">
                          <ul class="list-unstyled my-0">
                              <#list population.model.recruitment.specificPopulationSources as type>
                                <li>
                                    <#assign text = "study_taxonomy.vocabulary.populations-recruitment-specificPopulationSources.term." + type + ".title"/>
                                    <@message text/>
                                    <#if type == "other" && population.model.recruitment.otherSpecificPopulationSource??>
                                      : ${localize(population.model.recruitment.otherSpecificPopulationSource)}
                                    </#if>
                                </li>
                              </#list>
                          </ul>
                        </dd>
                      </#if>

                      <#if population.model.recruitment.otherSource?? && population.model.recruitment.otherSource?has_content>
                        <dt class="col-sm-4" title="<@message "study_taxonomy.vocabulary.populations-recruitment-specificPopulationSources.description"/>">
                            <@message "study.recruitment-sources.other"/>
                        </dt>
                        <dd class="col-sm-8">
                            ${localize(population.model.recruitment.otherSource)}
                        </dd>
                      </#if>

                      <#if population.model.recruitment.studies?? && population.model.recruitment.studies?size != 0>
                        <dt class="col-sm-4">
                            <@message "study.recruitment-sources.studies"/>
                        </dt>
                        <dd class="col-sm-8">
                          <ul class="list-unstyled my-0">
                              <#list population.model.recruitment.studies as item>
                                <li>${localize(item)}</li>
                              </#list>
                          </ul>
                        </dd>
                      </#if>

                      <#if localizedStringNotEmpty((population.model.recruitment.info))>
                        <dt class="col-sm-4" title="<@message "study_taxonomy.vocabulary.populations-recruitment-specificPopulationSources.description"/>">
                            <@message "suppl-info"/>
                        </dt>
                        <dd class="col-sm-8">
                            ${localize(population.model.recruitment.info)}
                        </dd>
                      </#if>


                  </dl>
                </div>
                <!-- /.card-body -->
              </div>
            </#if>
        </div>
      </#if>

      <#if hasNumberOfParticipants(population)>
        <div class="col-sm-12 col-md d-flex align-items-stretch">
          <div class="card w-100">
            <div class="card-header">
              <h3 class="card-title">
                  <@message "client.label.study.sample-size"/>
              </h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body pb-0">
              <dl class="row striped">
                  <#if (population.model.numberOfParticipants.participant.number)??>
                    <dt class="col-sm-4">
                        <@message "numberOfParticipants.participants"/>
                    </dt>
                    <dd class="col-sm-8">
                        ${population.model.numberOfParticipants.participant.number}
                        <#if population.model.numberOfParticipants.participant.noLimit == true>
                          (<@message "numberOfParticipants.no-limit"/>)
                        </#if>
                    </dd>
                  <#else>
                    <dt class="col-sm-4">
                        <@message "numberOfParticipants.participants"/>
                    </dt>
                    <dd class="col-sm-8">
                        <#if (population.model.numberOfParticipants.participant.noLimit)?? && population.model.numberOfParticipants.participant.noLimit == true>
                            <@message "numberOfParticipants.no-limit"/>
                        <#else>
                          <i class="fas fa-minus"></i>
                        </#if>
                    </dd>
                  </#if>

                  <#if (population.model.numberOfParticipants.sample.number)??>
                    <dt class="col-sm-4">
                        <@message "numberOfParticipants.sample"/>
                    </dt>
                    <dd class="col-sm-8">
                        ${population.model.numberOfParticipants.sample.number}
                        <#if population.model.numberOfParticipants.sample.noLimit == true>
                          (<@message "numberOfParticipants.no-limit"/>)
                        </#if>
                    </dd>
                  </#if>

                  <#if localizedStringNotEmpty((population.model.numberOfParticipants.info))>
                    <dt class="col-sm-4">
                        <@message "population.info"/>
                    </dt>
                    <dd class="col-sm-8">
                        ${localize(population.model.numberOfParticipants.info)}
                    </dd>
                  </#if>
              </dl>
            </div>
          </div>
        </div>
      </#if>
  </div>

  <!-- Harmonization study -->
  <!-- place model rules here -->

  <!-- Files -->
    <#if showStudyPopulationFiles>
        <@populationFilesBrowser id=id/>
    </#if>
</#macro>

<#macro populationDialog id population>
  <div class="modal fade" id="modal-population-${id}">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">${localize(population.name)}</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="mb-3 marked"><template>${localize(population.description)}</template></div>
            <@populationModel population=population id=id/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal"><@message "close"/></button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->
</#macro>