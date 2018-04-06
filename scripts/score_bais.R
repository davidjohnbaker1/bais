#======================================================================================================
# Scoring Script to Score Gold-MSI Self Report Survey Version 1.0
# Works with jsPsych v5.0.3 implementation of GMSI by David John Baker
#======================================================================================================
# Directions
#--------------------------------------------------
# To use this script just point the script at the directory containing your raw CSV files.
# Click "Source" at the top right panel of this screen (in RStudio)
# then run the score.directory() function. This will create individual aggregated files
# for each of your participants. To combine them all, run the create.dataset() 
# function. Note that ONLY the _data files should be in the 
# directory that the create.dataset() function is pointing to.
#--------------------------------------------------
#======================================================================================================

# Uncomment and set path for example files.
#setwd("../data")

score.directory <- function(fns=list.files(pattern=".csv")){
  
  # Set up the For Loop to score all of the .csv files in the directory
  for(i in seq(along=fns)){
    
    tmp.dat <- read.csv(fns[i])
    print(paste("Now Working On File",fns[i]))
    
    ## tmp.dat <- read.csv("HIGH.csv") # Line for Debugging 
    
    
    finalScores1 <- cbind(subjNo,ACTIVE,PERCEPTUAL,MUSICAL,SINGING,EMOTIONS,GENERAL,
                          Instrument, occStats, Genre, edAttain, edExpected,
                          Age, Gender, Nationality, Formative, CurrentCountry, individual_responses)
    
    write.table(finalScores1,paste0(substr(fns[i],1,nchar(fns[i])-4),"_data.csv"),sep=",",col.names=TRUE,row.names=FALSE)
    
  }
}

## Once you run score.directory(), run this! 

create.dataset <- function(){
  filenames <- list.files(pattern = "data")
  bigdata <- do.call("rbind", lapply(filenames, read.csv, header = TRUE))
  write.csv(bigdata,"Gold_MSI_combined_data_with_Indvidual_Responses.csv")
}

