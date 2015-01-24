##library dependencies
library(reshape2)

##read in features and activities labels
features=read.table('features.txt',header=F)
activities=read.table('activity_labels.txt')

##read in data sets
X_train=read.table('train/X_train.txt')
subject_train=read.table('train/subject_train.txt')
y_train=read.table('train/y_train.txt')

X_test=read.table('test/X_test.txt')
subject_test=read.table('test/subject_test.txt')
y_test=read.table('test/y_test.txt')

##add column labels, and information for subject and activity to X data
colnames(X_train)=features[,2]
X_train$subject=subject_train[,1]
X_train$activitycode=y_train[,1]

colnames(X_test)=features[,2]
X_test$subject=subject_test[,1]
X_test$activitycode=y_test[,1]

##combine data sets
fulldata=rbind(X_train,X_test)

##filter on data containing mean, standard deviation, activity, or subject information
shortdata=fulldata[,grep('std()|mean()|subject|activitycode',colnames(fulldata))]

##set activity codes to descriptors
shortdata$activitycode=as.factor(shortdata$activitycode)
levels(shortdata$activitycode)=activities[,2]


##melt data for processing and establish new data frame for tidy data
shortmelt=melt(shortdata,id=c('activitycode','subject'))
tidydata=data.frame()

##generate reports of mean values for all variables, split by activity code and subject
for (i in unique(shortmelt$subject)) {
	temp=dcast(shortmelt[which(shortmelt$subject==2),],activitycode ~ variable,mean)
	temp=cbind(subject=i,temp)
	tidydata=rbind(tidydata,temp)
	}

##reorder tidy data based on subject number and activity code
tidydata=tidydata[order(tidydata$subject,tidydata$activitycode),]
rownames(tidydata)=seq_along(tidydata$subject)

##write to file
write.table(tidydata,'tidydata.txt',row.name=FALSE)