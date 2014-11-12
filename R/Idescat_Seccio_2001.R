# Crea Informacio Auxiliar  ---------------------------------------------------------

fieldDescription <- c(
  "Agricultura", "Agricultura",
  "Industria", "Industria",
  "Construccio", "Construccio",
  "Serveis", "Serveis"
)
fieldDescription <- matrix( ncol = 2, data = fieldDescription, byrow = TRUE)


getDataFunction = function(){
  sector <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVMURNbFQ5aGg3RDA&export=download')
  indexSenseTotals <- rep( c(TRUE, TRUE, FALSE), nrow( sector )/3 )
  sector <- sector[indexSenseTotals, ]
  sector <- sector[, -ncol( sector )]
  colnames( sector ) <- c( "SeccioCensal", fieldDescription[, 1])
  sector$Sexe <- c( 'home', 'dona' )
  
  return( sector )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Cens2001$addInformationSource(
  newName = 'Sector',
  getDataFunction = getDataFunction,
  dataSource = "http://www.idescat.cat",
  description = "Poblacio ocupada de 16 anys i mes per sectors d'activitat i sexe. Cens 2001.",
  fieldDescription = fieldDescription,
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
