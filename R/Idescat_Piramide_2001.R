# Crea Informacio Auxiliar  ---------------------------------------------------------

getDataFunction = function(){
  piramide <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVdldnekY4elNHbkU&export=download')
  colSeccioCensal <- 1
  colHomes <- 2:101
  colDones <- 103:202
  
  dataHomes <- data.frame( SeccioCensal = piramide[, colSeccioCensal],
                           Sexe = "home",
                           piramide[, colHomes])
  colnames( dataHomes )[ colHomes + 1 ] <- paste( 0:99, "Anys", sep = "")
  
  dataDones <- data.frame( SeccioCensal = piramide[, colSeccioCensal],
                           Sexe = "dona",
                           piramide[, colDones])
  colnames( dataDones )[ colHomes + 1 ] <- paste( 0:99, "Anys", sep = "")

  return( rbind( dataHomes, dataDones ) )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Cens2001$addInformationSource(
  newName = 'Piramide',
  getDataFunction = getDataFunction,
  dataSource = "http://www.idescat.cat",
  description = "Piràmide d'edats any a any per sexe. Cens 2001.",
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
