#' Launch shinyMethyl interactive session for shinyMethyl.
#'
#' A functio that Convert MethylLumiSet (methylumi) to RGChannelSet (minfi), then generate plot use shinyMethyl
#'
#' @param MethylumiSet a MethylumiSet object contains methylation array information for plot generation
#'
#' @return No value returned. Instead the shinyMethyl interactive session is launched.
#'
#' @example shinyLumi(Methylumi)
#'
#' @export
#' @import shinyMethyl
#' @import methylumi
#' @import minfi
#'
shinyLumi <- function(Methylumi){
  converted_RGChannelSet <- as(Methylumi, 'RGChannelSet')
  shinyMethylSet_data <-  shinySummarize(converted_RGChannelSet)
  runShinyMethyl(shinyMethylSet_data)
}
