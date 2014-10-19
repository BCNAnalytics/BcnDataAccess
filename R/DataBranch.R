DataBranch <- setRefClass('DataBranch', 
                          fields = list(
                            dataLeavesNames = "list",
                            dataSource = "character",
                            subBranchesNames = "character"
                          )
)

DataBranch$methods( initialize = function(dataSourceE = "", ...){

  dataSource <<- dataSourceE
  callSuper(...)
})

DataBranch$methods( addInformationBranch = function( newName, dataSource = "" ){

  if( length( dataLeavesNames ) == 0 ){
    subBranchesNames <<- c( subBranchesNames, newName )
    assign(newName, DataBranch$new( dataSource ), envir = .self)
  }else{
    print( "This branch can only contain information sources" )
  }
})

DataBranch$methods( addInformationSource = function( 
  newName, 
  getDataFunction, 
  dataSource = '',
  description = '',
  lastUpdate = '',
  fieldDescription = matrix(''),
  broughtBy = ''
  ){

  if( length( subBranchesNames ) == 0 ){
    dataLeavesNames <<- c( dataLeavesNames, newName )
    assign(newName, DataLeave$new( 
      newName, 
      getDataFunction,
      dataSource, 
      description,
      lastUpdate,
      fieldDescription,
      broughtBy
      ), envir = .self)
  }else{
    print( "This branch can only contain subbranches" )
  }
})

DataBranch$methods( show = function(){
  if( dataSource != '' ){
    cat( '    Source:\n' )
    cat( dataSource )
  }
})

.DollarNames.DataBranch <- function(x, pattern){
 
  if( length( x$subBranchesNames ) > 0 ){
    return( grep(pattern, x$subBranchesNames, value=TRUE) )
  }else if( length( x$dataLeavesNames) > 0 ){
    return( grep(pattern, x$dataLeavesNames, value=TRUE) )
  }
}