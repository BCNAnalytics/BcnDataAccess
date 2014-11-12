# Crea Informacio Auxiliar  ---------------------------------------------------------

fieldDescription <- c(
  "Directius", "Personal directiu de les empreses i administracions publiques",
  "CientIntel", "Tecnics i professionals,cientifics i intelectuals", 
  "Tecnics", "Tecnics i professionals de suport",
  "Administratius", "Empleats administratius",
  "Comerc", "Treballadors de serveis i venedors de comerç",
  "AgrarPesca", "Treballadors qualificats en activitats agraries i pesqueres",
  "Artesans", "Artesans i treballadors qualificats de les industries i la construccio",
  "Operadors", "Operadors d'instalacions,maquinaria i muntadors",
  "NoQual", "Treballadors no qualificats",
  "ForcArm", "Forces armades"
)
fieldDescription <- matrix( ncol = 2, data = fieldDescription, byrow = TRUE)


getDataFunction = function(){
  professio <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVdTd4dDY3ZnJuaWM&export=download')
  indexSenseTotals <- rep( c(TRUE, TRUE, FALSE), nrow( professio )/3 )
  professio <- professio[indexSenseTotals, ]
  professio <- professio[, -ncol( professio )]
  colnames( professio ) <- c( "SeccioCensal", fieldDescription[, 1])
  professio$Sexe <- c( 'home', 'dona' )
  
  return( professio )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Cens2001$addInformationSource(
  newName = 'Professio',
  getDataFunction = getDataFunction,
  dataSource = "http://www.idescat.cat",
  description = "Poblacio ocupada de 16 anys i mes segons professio i sexe. Cens 2001.",
  fieldDescription = fieldDescription,
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
