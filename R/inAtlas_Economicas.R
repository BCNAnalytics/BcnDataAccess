
# Crea Informacio Auxiliar  ---------------------------------------------------------

getDataFunction = function(){
  cat("Downloading...This will take some minutes.")
  economicas <- read.csv('http://arcvi.io/wp-content/uploads/2015/02/BCN_ANALYTICS_BBDD_ECONOMICAS.csv', 
                           header = TRUE, sep =";", encoding = "UTF-8")
  colnames( economicas )[ 1 ] <- "SECTOR"
  economicas$X <- NULL
  
  return( economicas )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$inAtlas$addInformationSource(
  newName = 'DatosEmpresas',
  getDataFunction = getDataFunction,
  dataSource = "http://www.inAtlas.com",
  description = "Datos de las empresas y sectores, por seccion censal.",
  lastUpdate = "29/04/2015",
  broughtBy = "Aleix Ruiz de Villa"  
)
