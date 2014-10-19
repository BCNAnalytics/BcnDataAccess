
# Crea Inforacio Auxiliar  ---------------------------------------------------------

getDataFunction = function(){
  if( !require(XML) ){
    install.packages('XML')
  }
  
  ### Agafa dades de la pagina web
  pageHtml <- htmlParse( 'http://www.bcn.cat/estadistica/catala/dades/barris/ttreball/atur/durada/durbarago.htm', encoding = "utf-8" )
  dadesAtur <- readHTMLTable( pageHtml )[[1]]
  dadesAtur <- na.omit(dadesAtur)[-c(2, 3, 4), ]
  dadesAtur <- data.frame( sapply( dadesAtur, as.character), stringsAsFactors = FALSE )
  
  ### Canvia el nom de les columnes
  colnames( dadesAtur ) <- dadesAtur[1, ] 
  dadesAtur <- dadesAtur[-1, ]
  colnames( dadesAtur )[5] <- "Mes de 12 mesos"
  colnames( dadesAtur )[1] <- "Districte"
  
  ### Caracter llegit extrany
  hSpace <-  substr( dadesAtur[2, 1], 2, 3)
  
  colNames <- colnames( dadesAtur )
  colnames( dadesAtur)  <- sapply( colNames, function( colName ){
    colName <- gsub( hSpace, "", colName )
    colName <- gsub( " ", "", colName )
    colName
  } )
  
  ### Separa la informacio de la primera columna
  
  sepColumns <- do.call( rbind, strsplit( dadesAtur$Districte, hSpace ) )
  dadesAtur$Districte <- sepColumns[, 1]
  dadesAtur$Barri <- do.call( rbind, strsplit( sepColumns[, 3], "\\. " ) )[, 2]
  dadesAtur <- dadesAtur[, c(1, 6, 2, 3, 4, 5)]
  
  dadesNumeriques <- sapply( dadesAtur[, c( 3, 4, 5, 6)], function( colData ){
    as.numeric( gsub("\\.", "", colData) )
  })
  
  dadesAtur <- data.frame( dadesAtur[, c(1, 2)], dadesNumeriques)
  
  return( dadesAtur )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Ajuntament$addInformationSource(
  newName = 'AturAgost',
  getDataFunction = getDataFunction,
  dataSource = "http://www.bcn.cat/estadistica/catala/dades/barris/ttreball/atur/durada/durbarago.htm",
  description = "Atur registrat agost 2014 a Bcn",
  lastUpdate = "Setembre 2014",
  broughtBy = "Aleix Ruiz de Villa"  
)



# Neteja informacio auxiliar ----------------------------------------------

rm( getDataFunction )
