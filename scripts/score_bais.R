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

# Libraries Needed
library(stringr)

# Only run on files if they were one!
score.bais.c <- function(fns=list.files(pattern=".csv")){

  # Set up the For Loop to score all of the .csv files in the directory
  for(i in seq(along=fns)){

    tmp.dat <- read.csv(fns[i], stringsAsFactors = FALSE)
    print(paste("Now Working On File",fns[i]))

    # tmp.dat <- read.csv("666.csv",stringsAsFactors = FALSE) # Line for Debugging
    subjectNo <- tmp.dat[1,7]
    Condition <- "BAIS-C"

    baisData <- tmp.dat[2,8]
    baisDigitsColon <- unlist(str_extract_all(baisData,":[0-9]"))
    baisDigits <- str_replace_all(baisDigitsColon,":","")
    baisVector <- as.numeric(baisDigits)
    javascriptSucks <- baisVector + 1
    baisScore <- round(mean(javascriptSucks),3)

    finalScores <- cbind(subjectNo, baisScore, Condition)

    write.table(finalScores,paste0(substr(fns[i],1,nchar(fns[i])-4),"C_data.csv"),sep=",",col.names=TRUE,row.names=FALSE)

  }
}

# This is same as bais.c just fyi
score.bais.v <- function(fns=list.files(pattern=".csv")){

  # Set up the For Loop to score all of the .csv files in the directory
  for(i in seq(along=fns)){

    tmp.dat <- read.csv(fns[i], stringsAsFactors = FALSE)
    print(paste("Now Working On File",fns[i]))

    # tmp.dat <- read.csv("666.csv",stringsAsFactors = FALSE) # Line for Debugging
    subjectNo <- tmp.dat[1,7]
    Condition <- "BAIS-V"


    baisData <- tmp.dat[2,8]
    baisDigitsColon <- unlist(str_extract_all(baisData,":[0-9]"))
    baisDigits <- str_replace_all(baisDigitsColon,":","")
    baisVector <- as.numeric(baisDigits)
    javascriptSucks <- baisVector + 1
    baisScore <- round(mean(javascriptSucks),3)

    finalScores <- cbind(subjectNo, baisScore,Condition)

    write.table(finalScores,paste0(substr(fns[i],1,nchar(fns[i])-4),"_V_data.csv"),sep=",",col.names=TRUE,row.names=FALSE)

  }
}


score.bais.both <- function(fns=list.files(pattern=".csv")){

  # Set up the For Loop to score all of the .csv files in the directory
  for(i in seq(along=fns)){

    tmp.dat <- read.csv(fns[i], stringsAsFactors = FALSE)
    print(paste("Now Working On File",fns[i]))

    # tmp.dat <- read.csv("666.csv",stringsAsFactors = FALSE) # Line for Debugging
    subjectNo <- tmp.dat[1,7]


    Condition <- "BAIS-BOTH"

    baisDataV <- tmp.dat[2,8]
    baisDigitsColonV <- unlist(str_extract_all(baisDataV,":[0-9]"))
    baisDigitsV <- str_replace_all(baisDigitsColonV,":","")
    baisVectorV <- as.numeric(baisDigitsV)
    javascriptSucksV <- baisVectorV + 1
    baisScoreV <- round(mean(javascriptSucksV),3)

    baisDataC <- tmp.dat[3,8]
    baisDigitsColonC <- unlist(str_extract_all(baisDataC,":[0-9]"))
    baisDigitsC <- str_replace_all(baisDigitsColonC,":","")
    baisVectorC <- as.numeric(baisDigitsC)
    javascriptSucksC <- baisVectorC + 1
    baisScoreC <- round(mean(javascriptSucksC),3)


    finalScores <- cbind(subjectNo, baisScoreV,baisScoreC,Condition)

    write.table(finalScores,paste0(substr(fns[i],1,nchar(fns[i])-4),"_combined_data.csv"),sep=",",col.names=TRUE,row.names=FALSE)

  }
}


## Once you run score.directory(), run this!

create.dataset <- function(){
  filenames <- list.files(pattern = "data")
  bigdata <- do.call("rbind", lapply(filenames, read.csv, header = TRUE))
  write.csv(bigdata,"BAIS-Data.csv")
}

