#code for simulating data

##########################
# Medical Records data
# 100 items of each list
##########################
set.seed(101)

# number of items of each list
n <- 100

#simulate list of patient ID's 40 or so
#make a list of 40 id's sample those 100 times



#simulate list of Condition ID's
conditionList <- c("ADHD", "Depression", "Anxiety", "bi-polar", "ADD", "ODC", "DID")
c_data <- sample(conditionList, n) #doesnt work yet


#simulate random 3rd ID

#simulate a Dates
date <- sample(seq(as.Date('2010/01/01'), as.Date('2020/01/01'), by="day"), n)

#simulate a prescription (start date/ end date)

#simulate effectiveness score?
escore <- floor(runif(n, min = 0, max = 10))

###combine the lists into a dataframe


##########################
# Demographic data 
#
##########################

#Patient ID's (use the same ones as in the medical records)

#Age

#Gender

#Marital status

#Ethnicity

#Income

#Religion

#Education

###combine the lists into a dataframe
