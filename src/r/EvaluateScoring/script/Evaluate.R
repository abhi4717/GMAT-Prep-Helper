#input <- read.csv('/home/abhishek/Documents/Git Repositories/GMAT-Prep-Helper/src/r/EvaluateScoring/resources/Evaluate.csv',header=TRUE,sep=",",strip.white=TRUE);
input <- read.csv('C:\\Users\\abgopalan\\Documents\\GitHub\\GMAT-Prep-Helper\\src\\r\\EvaluateScoring\\resources\\Evaluate.csv',header=TRUE,sep=",",strip.white=TRUE);
output.sessionAccuracy <- getSessionAccFrame('Critical Reasoning');
output.typeDateAccuracy <- getTypeDateAccuracyFrame('Critical Reasoning');
getSessionAccFrame <- function(section){
  data <- getSectionData(section);
  dateList <- getDateList(data);
  frmSessionAcc <- data.frame(Section = character(0), Correct = numeric(0), Incorrect = numeric(0), Total = numeric(0), Percent = numeric(0));
  for(dateCount in 1:length(dateList) ){
    frmSessionAcc <- rbind(frmSessionAcc,accuracyInfo(section,data[data$Date==dateList[dateCount],],dateList[dateCount]));
  }
  colnames(frmSessionAcc) <- c("Section","Date","Correct","Incorrect","Total","Percent")
  frmSessionAcc;
}
accuracyInfo <- function(section,data,date){
  correctCount <- sum(data$Result=='Correct');
  incorrectCount <-sum(data$Result != 'Correct');
  
  session <- as.data.frame(section);
  session <- cbind(session,date);
  session <- cbind(session,correctCount);
  session <- cbind(session,incorrectCount);
  session <- cbind(session,correctCount+incorrectCount);
  session <- cbind(session,correctCount/(correctCount+incorrectCount)*100);
  session;
}

getTypeDateAccuracyFrame <- function(section){
  data <- getSectionData(section);
  typeList <- getTypeList(data);
  dateList <- getDateList(data);
  type <- data.frame(Type=character(0),Date=character(0),Correct = numeric(0), Incorrect = numeric(0), Total = numeric(0), Percent = numeric(0));
  for(dateCount in 1:length(dateList)){
    for(typeCount in 1:length(typeList)){
       filterData <- data[data$Type==typeList[typeCount] & data$Date==dateList[dateCount],];
       rbind(type,getTypeDateAccuracy(typeList[typeCount], dateList[dateCount], filterData));
    }
  }
  colnames(type) <- c("Type","Date","Correct","Incorrect","Total","Percent");
  type;
}

getTypeDateAccuracy <- function(type, date, data){
  correctCount <- sum(data$Result == 'Correct');
  incorrectCount <- sum(data$Result != 'Correct');
  
  type <- as.data.frame(type);
  type <- cbind(type,date);
  type <- cbind(type,correctCount);
  type <- cbind(type,incorrectCount);
  type <- cbind(type,correctCount+incorrectCount);
  type <- cbind(type,correctCount/(correctCount+incorrectCount)*100);
  type;
}

getSectionData<-function(section){
  input[input$Section==section,];
}

getDateList<-function(data){
  unique(data$Date);
}
getTypeList<-function(data){
  unique(data$Type);
}