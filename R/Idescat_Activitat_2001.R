# Crea Informacio Auxiliar  ---------------------------------------------------------

fieldDescription <- c(
  "PoblacioMes16", "Població de 16 anys i més",
  "Ocupats", "Ocupats",
  "DesocPrimFeina", "Desocupats que busquen la seva primera feina", 
  "Desoc", "Desocupats que han treballat abans",
  "ServMilPresSoc", "Fa el servei militar o la prestació social",
  "JubPen", "Jubilats o pensionistes",
  "Incap", "Incapacitat permanent per treballar",
  "Estudiant", "Estudiant,escolar o preescolar",
  "Llar", "Fa feines de la llar no remunerades",
  "Altres", "Altres situacions",
  "Poblacio", "Poblacio"
)
fieldDescription <- matrix( ncol = 2, data = fieldDescription, byrow = TRUE)


getDataFunction = function(){
  activitat <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVM1lIQkp2c3JuLUk&export=download')
  indexSenseTotals <- rep( c(TRUE, TRUE, FALSE), nrow( activitat )/3 )
  activitat <- activitat[indexSenseTotals, ]
  selCol <- c(1, 2:5, 7:12, 14)
  activitat <- activitat[, selCol]
  colnames( activitat ) <- c( "SeccioCensal", fieldDescription[, 1])
  activitat$Sexe <- c( 'home', 'dona' )
  
  return( activitat )
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
