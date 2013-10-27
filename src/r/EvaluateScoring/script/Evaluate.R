input <- read.csv('/home/abhishek/Documents/Git Repositories/GMAT-Prep-Helper/src/r/EvaluateScoring/resources/Evaluate.csv',header=TRUE,sep=","strip.white=TRUE);
output.sessionAccuracy <- sessionAccInfo('Critical Reasoning');
sessionAccInfo <- function(section){
  data <- input[input$Section==section,];
  dateList <- unique(input$Date);
  frmSessionAcc <- data.frame(Section = character(0), Correct = numeric(0), Incorrect = numeric(0), Total = numeric(0));
  for(dateCount in 1:length(dateList) ){
    frmSessionAcc <- rbind(frmSessionAcc,accuracyInfo(data[data$Date==dateList[dateCount],],dateList[dateCount]));
  }
  frmSessionAcc;
}
accuracyInfo <- function(data,date){
  correctCount <- sum(data$Result=='Correct');
  incorrectCount <-sum(data$Result != 'Correct');
  
  session <- as.data.frame(section);
  session <- cbind(session,date);
  session <- cbind(session,correctCount);
  session <- cbind(session,incorrectCount);
  session <- cbind(session,correctCount+incorrectCount);
  colnames(session) <- c("Session","Date","Correct","Incorrect","Total");
  session;
}