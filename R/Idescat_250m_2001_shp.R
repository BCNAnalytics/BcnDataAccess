# Crea Informacio Auxiliar  ---------------------------------------------------------


getMapFunction = function(){
  if( !require(maptools) ){
    install.packages('maptools')
  }
  tempFileName <- tempfile()
  download.file('http://arcvi.io/wp-content/uploads/2015/02/grid_lalea_250_intersec_bcnpobla_secret-1.zip', tempFileName, mode = "wb" )
  return( readShapePoly(unzip(tempFileName, exdir = tempdir())) )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Grid250_2014$addInformationSource(
  newName = 'Map250_2014',
  getMapFunction = getMapFunction,
  dataSource = "http://www.idescat.cat",
  description = "Mapa (shapefile) de grid de 250m. Informacio poblacional: sexe i edat. Censurat a menys de 15 individus, llevat de zones buides. Registre de poblacio a 1 de gener de 2014. Retorna un SpatialPolygonsDataFrame (maptools package)",
  lastUpdate = "22/3/2015",
  broughtBy = "Aleix Ruiz de Villa"  
)
