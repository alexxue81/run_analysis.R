## First, read all the data

train<-read.table("X_train.txt")
test<-read.table("X_test.txt")

trainlabel<-read.table("y_train.txt")
testlabel<-read.table("y_test.txt")

features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

subject_train<-read.table("subject_train.txt")
subject_test<-read.table("subject_test.txt")




mergedata<-rbind(train,test)                   ## Merges the training and the test sets to create one data set.

mean<-matrix(data = NA, nrow = 1, ncol = ncol(mergedata))  ## Calculate the mean for each measurement.  
for(i in 1:ncol(mergedata)){
	mean[1,i]<-mean(mergedata[,i])	
}

sd<-matrix(data = NA, nrow = 1, ncol = ncol(mergedata))   ## Calculate the standard deviation for each measurement. 
for(i in 1:ncol(mergedata)){
	sd[1,i]<-sd(mergedata[,i])	
}





trainpluslabel<-cbind(train,trainlabel)  ## bind the dataset of train with label
testpluslabel<-cbind(test,testlabel)     ## bind the dataset of test with label



featuresnames<-features[,2]                    ## Assign the features' names to a  variable called "featuresnames"                 
levels(featuresnames)[562]<-"activity_labels"  ## Add a level of featuresnames
featuresnames[562]<-"activity_labels"          ## Assign the 562th colname of "activity_labels"

colnames(trainpluslabel)<-featuresnames
colnames(testpluslabel)<-featuresnames



onedataset<-rbind(trainpluslabel,testpluslabel) ## Bind to build a data.frame that includes all the data in one data set 


for(i in 1:nrow(onedataset)){                ## Uses descriptive activity names to name the activities in the data set

	if(onedataset[i,562]==1){onedataset[i,562]<-"WALKING"}
	if(onedataset[i,562]==2){onedataset[i,562]<-"WALKING_UPSTAIRS"}
	if(onedataset[i,562]==3){onedataset[i,562]<-"WALKING_DOWNSTAIRS"}
	if(onedataset[i,562]==4){onedataset[i,562]<-"SITTING"}
	if(onedataset[i,562]==5){onedataset[i,562]<-"STANDING"}
	if(onedataset[i,562]==6){onedataset[i,562]<-"LAYING"}
	
}

sub<-rbind(subject_train,subject_test)
onedataset<-cbind(onedataset,sub)

levels(featuresnames)[563]<-"subject"   ## Add a level of featuresnames
featuresnames[563]<-"subject"           ## Assign the 563th colname of "subject"
colnames(onedataset)<-featuresnames     ## Assign the featuresnames to the colnames of the data.frame





