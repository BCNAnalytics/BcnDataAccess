BcnDataSources$Others$addInformationSource(
  newName = 'VotsBarris',
  getDataFunction = function(){
    data(votsBarris, envir = environment())
    return(votsBarris)
  },
  dataSource = "",
  description = "Vots per Barris",
  lastUpdate = "October 2014",
  broughtBy = "Josep Marc Mingot"  
)
