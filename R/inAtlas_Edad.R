
# Crea Informacio Auxiliar  ---------------------------------------------------------

getDataFunction = function(){
  edad <- read.csv('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVcWdBUElRS25JRXM&export=download', header = TRUE, sep =";")
  colnames( edad )[ 1 ] <- "COD_MUNICIPIO"
  edadRange <- t( sapply( as.character( edad$EDAD ), function( edadVal ){
    if( edadVal != "100 y mas" ){
      return( as.numeric( strsplit( edadVal, " " )[[1]][c(1, 3)] ) )      
    }else{
      return( c(100, 150) )
    }
  }, USE.NAMES = FALSE, simplify = TRUE ) )
  
  edad$EDAD_RANGO_INF <- edadRange[, 1]
  edad$EDAD_RANGO_SUP <- edadRange[, 2]
  edad$X <- NULL
  edad$EDAD <- NULL
  
  return( edad )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$inAtlas$addInformationSource(
  newName = 'Edad',
  getDataFunction = getDataFunction,
  dataSource = "http://www.inAtlas.com",
  description = "Distribucion edades por codigo censal poblaciones de Catalunya.",
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
