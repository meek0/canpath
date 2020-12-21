<#include "../libs/study-scripts.ftl">

<script>

  const getStudyDatasets = function(id, onsuccess, onfailure) {
    let url = '/ws/datasets/_rql';
    let query = 'study(in(Mica_study.id,' + id + ')),dataset(limit(0,1000),fields(acronym.*,name.*,variableType,studyTable.studyId,studyTable.project,studyTable.table,studyTable.populationId,studyTable.dataCollectionEventId,harmonizationTable.studyId,harmonizationTable.project,harmonizationTable.table,harmonizationTable.populationId),sort(studyTable.studyId,studyTable.populationWeight,studyTable.dataCollectionEventWeight,acronym))';
    url = url + '?query=' + query;
    axios.get(MicaService.normalizeUrl(url))
        .then(response => {
          //console.dir(response);
          if (onsuccess) {
            onsuccess(response.data);
          }
        })
        .catch(response => {
          console.dir(response);
          if (onfailure) {
            onfailure(response);
          }
        });
  };

  $(function () {
      const currentLanguage = '${.lang}';
      getStudyDatasets('${study.id}', function (data) {
         if (data.datasetResultDto && data.datasetResultDto['obiba.mica.DatasetResultDto.result']) {
             $('#datasetsContainer').show();
             const datasets = data.datasetResultDto['obiba.mica.DatasetResultDto.result'].datasets;
             const tbodyElem = $('#datasets tbody');
             tbodyElem.children().remove();
             datasets.forEach(dataset => {
                let varCount = (dataset['obiba.mica.CountStatsDto.datasetCountStats'] && dataset['obiba.mica.CountStatsDto.datasetCountStats'].variables) ?
                    dataset['obiba.mica.CountStatsDto.datasetCountStats'].variables : '0';
                let row = '<tr>' +
                    '<td><a href="../dataset/' + dataset.id + '">' + LocalizedValues.forLang(dataset.acronym, currentLanguage) + '</a></td>' +
                    '<td>' + LocalizedValues.forLang(dataset.name, currentLanguage) + '</td>' +
                    '<td><a href="../search#lists?type=variables&query=dataset(in(Mica_dataset.id,' + dataset.id + '))">' + varCount + '</a></td>' +
                    '</tr>';
                tbodyElem.append(row);
             });
             $("#datasets").DataTable(dataTablesSortOpts);
         }
         $('#loadingDatasets').hide();
      }, function() {
         $('#loadingDatasets').hide();
      });
  });
</script>
