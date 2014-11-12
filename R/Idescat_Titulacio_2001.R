
# Crea Informacio Auxiliar  ---------------------------------------------------------

fieldDescription <- c(
  "NoLlegEscr", "No sap llegir o escriure",
  "PrimarIncom", "Primaria incompleta",
  "PrimerGrau", "Primer grau",
  "Eso", "ESO,EGB,Batxillerat Elemental",
  "FP1", "FP 1r grau",
  "FP2", "FP 2n grau", 
  "Batxillerat", "Batxillerat superior",
  "Diplomatura", "Diplomatura",
  "LlicDoc", "Llicenciatura i doctorat"
)
fieldDescription <- matrix( ncol = 2, data = fieldDescription, byrow = TRUE)


getDataFunction = function(){
  titulacio <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVdXg5emRtNHFuZzA&export=download')
  colSeccioCensal <- 1
  colHomes <- seq(1,27,3) + 1
  colDones <- seq(1,27,3) + 2
  
  dataHomes <- data.frame( SeccioCensal = titulacio[, colSeccioCensal],
                           Sexe = "home",
                           titulacio[, colHomes])
  colnames( dataHomes )[ 1:9 + 2 ] <- fieldDescription[, 1]
  
  dataDones <- data.frame( SeccioCensal = titulacio[, colSeccioCensal],
                           Sexe = "dona",
                           titulacio[, colDones])
  colnames( dataDones )[ 1:9 + 2 ] <- fieldDescription[, 1]
  
  return( rbind( dataHomes, dataDones ) )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Cens2001$addInformationSource(
  newName = 'Titulacio',
  getDataFunction = getDataFunction,
  dataSource = "http://www.idescat.cat",
  description = "Poblacio de 10 anys i mes segons nivell d'instruccio i sexe. Cens 2001.",
  fieldDescription = fieldDescription,
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
