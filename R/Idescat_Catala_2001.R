# Crea Informacio Auxiliar  ---------------------------------------------------------

getDataFunction = function(){
  catala <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVOGx4QnRNVmpLbm8&export=download')
  indexSenseTotals <- rep( c(TRUE, TRUE, FALSE), nrow( catala )/3 )
  catala <- catala[ indexSenseTotals, ]
  colnames( catala ) <- c("SeccioCensal", "Enten", "Parla", "Llegeix", "Escriu", "NoEnten", "Poblacio")
  catala$Sexe <- c( 'home', 'dona' )
  
  return( catala )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Cens2001$addInformationSource(
  newName = 'Catala',
  getDataFunction = getDataFunction,
  dataSource = "http://www.idescat.cat",
  description = "Població de 2 anys i més segons el coneixement del català i sexe. Cens 2001.",
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)

