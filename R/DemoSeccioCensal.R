# Crea Inforacio Auxiliar  ---------------------------------------------------------

fieldDescription <- c( "Nom columna", "Descripcio",
                      "MAP_SCENSAL_COMUNITARIS", "Numero de persones comunitaries",
                      "MAP_SCENSAL_DATA_DADES", "Data de les dades",
                      "MAP_SCENSAL_DONES", "Numero de dones",
                      "MAP_SCENSAL_EDAT_0_A_14", "Numero de persones entre 0 i 14 anys",
                      "MAP_SCENSAL_EDAT_15_A_24", "Numero de persones entre 15 i 24 anys",
                      "MAP_SCENSAL_EDAT_25_64", "Numero de persones entre 25 i 64 anys",
                      "MAP_SCENSAL_EDAT_65_A_MES", "Numero de persones de 65 o mes anys",
                      "MAP_SCENSAL_ESTRANGERS", "Numero de persones estrangeres",
                      "MAP_SCENSAL_HOMES", "Numero d'homes",
                      "MAP_SCENSAL_NACIONALS", "Numero de persones espanyoles",
                      "MAP_SCENSAL_SECCIO_CENSAL", "La denominacio de les 1.061 seccions censals es numerica: num. Districte num. Seccio censal; començant en cada districte la numeracio de les seccions des del numero 1." 
)
fieldDescription <- matrix( ncol = 2, data = fieldDescription, byrow = TRUE)


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$OpenData$addInformationSource(
  newName = 'DemografiquesSeccioCensal',
  getDataFunction = function(){
    return( read.csv('http://opendata.bcn.cat/opendata/ca/descarrega-fitxer?url=http%3a%2f%2fbismartopendata.blob.core.windows.net%2fopendata%2fopendata%2fmap_scensal_0_opendata_map_scensal.csv&name=MAP_SCENSAL.csv', sep = ";") )
  },
  dataSource = "http://opendata.bcn.cat/opendata/ca/catalog/CENSAL#",
  description = "Dades demogràfiques de les seccions censals de la ciutat de Barcelona. ",
  lastUpdate = "25/10/2013",
  fieldDescription = fieldDescription,
  broughtBy = "Aleix Ruiz de Villa"  
)


# Neteja informacio auxiliar ----------------------------------------------

rm( fieldDescription )
