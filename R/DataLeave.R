DataLeave <- setRefClass('DataLeave', 
                         fields = list(
                           dataSource = "character",
                           description = "character",
                           lastUpdate = "character",
                           fieldDescription = "matrix",
                           leafName = "character",
                           getDataFunction = "function"
                           )
                         )

DataLeave$methods( 
  initialize = function( newNameE, 
                         getDataFunctionE, 
                         dataSourceE = '',
                         descriptionE = '',
                         lastUpdateE = '',
                         fieldDescriptionE = matrix(''),
                         ... ){
  
  leafName <<- newNameE
  getDataFunction <<- getDataFunctionE
  dataSource <<- dataSourceE
  description <<- descriptionE
  lastUpdate <<- lastUpdateE
  fieldDescription <<- fieldDescriptionE
  
  callSuper(...)
})

DataLeave$methods( agafaDades = function(...){
  return( getDataFunction(...) )
})

DataLeave$methods( obrePaginaFont = function(){
  shell.exec(dataSource)  
})


DataLeave$methods( show = function(){
  cat( '    Localitzacio de la font: ' )
  cat( dataSource )
  cat( '\n\n    Descripcio: ' )
  cat( description )
  cat( '\n\n    Ultima actualitzacio: ')
  cat( lastUpdate )
  
  if( ncol( fieldDescription) > 1 ){ 
    View( fieldDescription, paste( 'Descripcio de camps de', leafName) )
  }
})

.DollarNames.DataLeave <- function(x, pattern){
  
  nameFuncs <- c("agafaDades()", "obrePaginaFont()")
  grep(pattern, nameFuncs, value=TRUE)
}