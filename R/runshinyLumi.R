#' Launch shiny app for shinyLumi
#'
#' @return NULL. Start the shiny interface
#'
#' @examples
#' \dontrun{
#'    runshinyLumi()
#' }
#'
#' @export
#' @importFrom shiny run App
#'
runshinyLumi <- function(){
  appDir <- system.file('shiny-scripts',package = 'shinyLumi')
  shiny::runApp(appDir, display.mode = 'normal')
  return()
}
