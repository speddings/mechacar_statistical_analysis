# DELIVERABLE 1


# Use the library() function to load the dplyr package.
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.
library(tidyverse)
mecha_mpg <- read.csv(file='./resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

# Perform linear regression using the lm() function. In the lm() function, pass in all six variables, 
# and add the dataframe you created in Step 4 as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)) 


# DELIVERABLE 2
# import and read in the Suspension_Coil.csv file as a table
suspension_mpg <- read.csv(file='./resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 
head(suspension_mpg)

# Create a total_summary dataframe using the summarize() function to get the mean, median, variance, 
# and standard deviation of the suspension coil’s PSI column.
total_summary <- suspension_mpg %>% summarize(Mean=mean(PSI),Median=(PSI),Variance=var(PSI),SD=sd(PSI))

# creates a lot_summary dataframe using the group_by() and the summarize() functions to 
# group each manufacturing lot by the mean, median, variance, and standard deviation of 
# the suspension coil’s PSI column.
lot_summary <- suspension_mpg %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI), .groups = 'keep') 



# DELIVERABLE 3
# determine if the PSI across all manufacturing lots is statistically different 
# from the population mean of 1,500 pounds per square inch.
?t.test()
t.test(suspension_mpg$PSI,mu=1500)

# 3 more scripts using t.test() function and its subset() argument to determine if the PSI 
# for each Lot is statistically different from the population mean of 1,500 psi.

# LOT 1
t.test(subset(suspension_mpg,Manufacturing_Lot=="Lot1")$PSI,mu=1500)

# LOT 2
t.test(subset(suspension_mpg,Manufacturing_Lot=="Lot2")$PSI,mu=1500)

# LOT 3
t.test(subset(suspension_mpg,Manufacturing_Lot=="Lot3")$PSI,mu=1500)
              
              