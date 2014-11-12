
# Crea Informacio Auxiliar  ---------------------------------------------------------

fieldDescription <- c(
  "Cat_Barcelona", "Barcelona",
  "Cat_Girona", "Girona",
  "Cat_Lleida", "Lleida",
  "Cat_Tarragona", "Tarragona",
  "Andalusia", "Andalusia",
  "Arago", "Arago",
  "Asturies", "Asturies",
  "Balears", "Balears",
  "Canaries", "Canaries",
  "Cantabria", "Cantabria", 
  "CastellaMan", "Castella la Mantxa",
  "CastellaLLeo", "Castella Lleo",
  "Valencia", "Pais Valencia",
  "Extremadura", "Extremadura",
  "Galicia", "Galicia",
  "Madrid", "Madrid",
  "Murcia", "Murcia",
  "Navarra", "Navarra",
  "Basc", "Pais Basc",
  "Rioja", "Rioja",
  "CeuMel", "Ceuta i Melilla",
  "Estranger", "Estranger"
)
fieldDescription <- matrix( ncol = 2, data = fieldDescription, byrow = TRUE)

getDataFunction = function(){
  naixament <- read.table('https://docs.google.com/uc?authuser=0&id=0ByVQHmO-WjuVVnJwZVJKaV9McWc&export=download')
  indexSenseTotals <- rep( c(TRUE, TRUE, FALSE), nrow( naixament )/3 )
  naixament <- naixament[indexSenseTotals, ]
  naixament <- naixament[, -c(2, 7, ncol( naixament ) ) ]
  colnames( naixament ) <- c( "SeccioCensal", fieldDescription[, 1])
  naixament$Sexe <- c( 'home', 'dona' )
  
  return( naixament )
}


# AfegeixPaginaInformacio -------------------------------------------------

BcnDataSources$Idescat$Cens2001$addInformationSource(
  newName = 'Naixament',
  getDataFunction = getDataFunction,
  dataSource = "http://www.idescat.cat",
  description = "Poblacio segons lloc de naixament i sexe. Cens 2001.",
  fieldDescription = fieldDescription,
  lastUpdate = "12/11/2014",
  broughtBy = "Aleix Ruiz de Villa"  
)
