DataLeave <- setRefClass('DataLeave', 
                         fields = list(
                           dataSource = "character",
                           description = "character",
                           lastUpdate = "character",
                           fieldDescription = "matrix",
                           leafName = "character",
                           getDataFunction = "function",
                           getMapFunction = "function",
                           broughtBy = "character"
                           )
                         )

DataLeave$methods( 
  initialize = function( newNameE, 
                         getDataFunctionE = function(){}, 
                         getMapFunctionE = function(){},
                         dataSourceE = '',
                         descriptionE = '',
                         lastUpdateE = '',
                         fieldDescriptionE = matrix(''),
                         broughtByE = '', 
                         ... ){
  
  leafName <<- newNameE
  getDataFunction <<- getDataFunctionE
  getMapFunction <<- getMapFunctionE
  dataSource <<- dataSourceE
  description <<- descriptionE
  lastUpdate <<- lastUpdateE
  fieldDescription <<- fieldDescriptionE
  broughtBy <<- broughtByE
  
  callSuper(...)
})

DataLeave$methods( getData = function(...){
  return( getDataFunction(...) )
})

DataLeave$methods( getMap = function(...){
  return( getMapFunction(...) )
})

DataLeave$methods( openSourcePage = function(){
  shell.exec(dataSource)  
})


DataLeave$methods( show = function(){
  cat( '    Source: ' )
  cat( dataSource )
  cat( '\n\n    Description: ' )
  cat( description )
  cat( '\n\n    Last update: ')
  cat( lastUpdate )
  cat( '\n\n    Brought by: ')
  cat( broughtBy )
  
  if( ncol( fieldDescription) > 1 ){ 
    View( fieldDescription, paste( 'Field description of', leafName) )
  }
})

.DollarNames.DataLeave <- function(x, pattern){
  
  nameFuncs <- c("getData()", "openSource()", "getMap()")
  grep(pattern, nameFuncs, value=TRUE)
}