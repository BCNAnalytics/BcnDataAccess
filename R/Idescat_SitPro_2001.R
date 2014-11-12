
# Crea Informacio Auxiliar  ---------------------------------------------------------

fieldDescription <- c(
  "EmpresAmbPers", "Empresaris amb personal assalariat",
  "EmpresSensePers", "Empresaris sense personal assalariat", 
  "Coop", "Membres de cooperatives", 
  "AjFam", "Ajudes familiars", 
  "AssalariatsFix", "Assalariats fixos",
  "AssalariatsEvent", "Assalariats eventuals",
  "Altres", "Altres"
)

fieldDescription <- matrix( ncol = 2, data = fieldDescription, byrow = TRUE)


getDataFunction = function(){
  sitPro <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVNG91YkxlM2lwNlE&export=download')
  indexSenseTotals <- rep( c(TRUE, TRUE, FALSE), nrow( sitPro )/3 )
  sitPro <- sitPro[indexSenseTotals, ]
  sitPro <- sitPro[, -ncol( sitPro )]
  colnames( sitPro ) <- c( "SeccioCensal", fieldDescription[, 1])
  sitPro$Sexe <- c( 'home', 'dona' )
  
  return( sitPro )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Cens2001$addInformationSource(
  newName = 'SituacioPro',
  getDataFunction = getDataFunction,
  dataSource = "http://www.idescat.cat",
  description = "Poblacio ocupada de 16 anys i mes segons situacio professional i sexe. Cens 2001.",
  fieldDescription = fieldDescription,
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
