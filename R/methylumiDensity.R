#' Draw a density plot for beta values.
#'
#' A function that draws density plot for given methylumiSet
#'
#' @param MethylumiSet a MethylumiSet object contains methylation array information
#' @param sample_sheet a character vector represents sample group.
#' i.e. if the first value of sample group is 'group A', the first array of the given data belongs to sample group A
#' @param title A string, title for the plot
#'
#' @return NULL. Instead a density plot for beta values for beads contained in the given MethylumiSet is printed.
#'
#' @example methylumidensity(mset)
#'
#' @export
#' @import methylumi
#' @import ggplot2
#' @import reshape2
#' @import RColorBrewer
methylumiDensity <- function(mldat, sample_sheet = '', main = 'Density Plot of beta values',dlim=3.5,legend_position = 'topright'){

  #extract beta values from MethylumiSet object
  betas <- attr(mldat,'assayData')$betas

  #If information about relationship between arrays and sample groups is given
  if(sample_sheet != ''){
    if(is.character((sample_sheet))){
      if(length(sample_sheet) == dim(betas)[2]){
        group = levels(factor(sample_sheet))
        numgroups <- length(level)
        suppressWarnings(palette <- brewer.pal(numgroups,'Set1'))
        #create the plot
        plot(density(betas[,1],na.rm=TRUE), main = 'Density Plot of beta values',xlab='Beta',
             ylim=c(0,dlim), col = palette[which(sample_sheet[1]==group)])
        #add curves to the plot
        for(i in c(2:dim(betas)[2])){
          lines(density(betas[,i],na.rm=TRUE),col = palette[which(sample_sheet[i]==group)])
        }
        legend(legend_position,legend = group,col = palette[1:numgroups],lty = 1, cex=0.8,title = 'Sample Groups')
        return()
        }else{
        stop('Error: Unexpected input. Length of sample groups does not equals number of arrays')
      }
    }else{
      stop('Error: Unexpected input. Sample group is supposed to be a vector of character')
    }
  }else{
    #If no additional sample group information given
    longdata <- melt(betas)
    longdata <- longdata[,-1]
    colnames(longdata) <- c('Array','beta')
    p <- ggplot(longdata, aes(x=beta, color=Array)) +
      geom_density()+
      coord_cartesian(ylim = c(1, dlim))
    p +theme(legend.position = legend_position)
  }
}
