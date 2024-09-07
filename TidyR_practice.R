# install.packages("tidyr")
# install.packages("dplyr")

# library("tidyr")
# library("dplyr")

# How to create a dataframe

# Create vectors for each column
unique_identifier <- c(1,2,3)
patient_name <- c("Alice","Bob","Charlie")
patient_age <- c(30,45,29) 
patient_gender <- c("F","M","M")
first_visit <- c("120/80","130/85","110/70")
second_visit <- c("118/76","125/82","112/74")

#Combine the vectors into a data frame using the data.frame()
#Its syntax is: data.frame(column_name = vector)
Patients_information <- data.frame(
  Patient_ID = unique_identifier,
  Name = patient_name,
  Age = patient_age,
  Gender = patient_gender,
  Visit_1_BP = first_visit,
  Visit_2_BP = second_visit)

# View the data frame
Patients_information

# Transforming the dataset from wide format to long format
patient_long <- Patients_information %>% 
  pivot_longer(
    cols = starts_with('Visit'), # Specify the columns to pivot 
    names_to = "Visit", # New column to store original column names
    values_to = "BP_reading") # New column to store the values from the pivoted columns

# View the structure of patient_long
str(patient_long)

#Transforming the dataset from long format to wide format
patient_wide <- patient_long %>% 
  pivot_wider(
    names_from = Visit, # Column to create new column names from
    values_from = BP_reading) # Column to use for filling the new columns

# View the dimensions of patient_wide
dim(patient_wide)

# View the structure of patient_wide
str(patient_wide)
