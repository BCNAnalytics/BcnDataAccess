
# Crea Informacio Auxiliar  ---------------------------------------------------------

getDataFunction = function(){
  nacionalidad <- read.csv('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVc25WM0tfNDNzV0U&export=download', 
                           header = TRUE, sep =";", encoding = "UTF-8")
  colnames( nacionalidad )[ 1 ] <- "COD_MUNICIPIO"
  nacionalidad$X <- NULL
  
  return( nacionalidad )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$inAtlas$addInformationSource(
  newName = 'Nacionalidad',
  getDataFunction = getDataFunction,
  dataSource = "http://www.inAtlas.com",
  description = "Distribucion de las nacionalidades por codigo censal poblaciones de Catalunya.",
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
