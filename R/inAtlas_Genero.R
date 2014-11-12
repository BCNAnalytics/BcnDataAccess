
# Crea Informacio Auxiliar  ---------------------------------------------------------

getDataFunction = function(){
  genero <- read.csv('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVVnhzRlEwWjRFS3c&export=download', header = TRUE, sep =";")
  colnames( genero )[ 1 ] <- "COD_MUNICIPIO"
  genero$X <- NULL
  
  return( genero )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$inAtlas$addInformationSource(
  newName = 'Genero',
  getDataFunction = getDataFunction,
  dataSource = "http://www.inAtlas.com",
  description = "Distribucion de generos por codigo censal poblaciones de Catalunya.",
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
