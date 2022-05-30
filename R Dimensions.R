# Discovering a new dimension

first.matrix <- matrix(1:12, ncol = 4)
first.matrix

# Fill the matrix by row
matrix(1:12, ncol= 4, byrow= TRUE)

# Looking at the prperties
str(first.matrix)

# To get the number of rows and columns 
dim(first.matrix)

# find the totla number of values in a matrix
length(first.matrix) 

# play with attributes
my.array <- array(1:24, dim= c(3, 4, 2))
baskets.team <-rbind(baskets.of.Granny = c(12, 4, 5, 6, 9, 3),
                     baskets.of.Geraldine= c(5, 4, 2, 4, 12, 9))

# Too see the attributes of the array 
attributes(my.array)

# To add attributes
attr(baskets.team, "season") <- "2010-2011"
attr(baskets.team, "season")

# To remove the value set to NULL
attr(baskets.team, "season") <- NULL



# Combining vectors into a matrix
baskets.of.Granny <- c(12, 4, 5, 6, 9, 3)
baskets.of.Geraldine <- c(5, 4, 2, 4, 12, 9)
baskets.team <- rbind(baskets.of.Granny, baskets.of.Geraldine) # rbind is combinding them by rows

baskets.team # This is showing the matrix

#cbind() fucniton combines the vectors by columns 

cbind(1:3, 4:6, matrix(7:12, ncol= 2))


# Using the indices
first.matrix
first.matrix[1:2, 2:3]


# Extract complete rows and columns from the matrix
first.matrix[2:3, ]


#Dropping values usign negative indices
first.matrix
first.matrix[-2, -3] # This is return all but row 2 and column 3

# drop only the element at the second row and the 3rd column
nr <- nrow(first.matrix)
id <- nr * 2 + 2
first.matrix[-id]


# Juggling dimensions
# Drop the first and third rows of the matrix 
first.matrix[-c(1, 3), ]

# Using drop= this will stop R from the change of dimensions 
first.matrix[2, , drop= FALSE]


# How to replace values in a matrix

# Replace values in the second row and thrid column
first.matrix[3, 2] <- 4
first.matrix


# Change the entire row or columns of values by not specifying the other dimension
first.matrix[2, ] <- c(1,3)
first.matrix


# Replace values within the matrix by another matrix
first.matrix[1:2, 3:4] <- c(8, 4, 2, 1)
first.matrix


# Naming Matrix rows and Columns
# changing row names
rownames(baskets.team) <- c("Granny", "Geraldine")
rownames(baskets.team)

# changing column names
colnames(baskets.team) <- c("1st","2nd", "3th", "4th", "5th", "6th")
baskets.team

# Correct the mistake in columns names
colnames(baskets.team)[3] <- "3rd"


# How to remove column and row names
baskets.copy <- baskets.team
colnames(baskets.copy) <- NULL
baskets.copy

# Using names as indices
baskets.team[, c("2nd", "5th")] # this extracts the columns with the names 2nd and 5th

baskets.team["Granny", ] # This extracts the row with the name Granny



# Calculating with matrices
# Using standard operations with matrices
first.matrix
first.matrix + 4 # This added 4 to each cell in the matrix 

# Create a new matrix to add to the first
second.matrix <- matrix(1:3, nrow= 3, ncol = 4) # This creates a new matrix with 1-3 on each column
second.matrix

# Add both matrix together
first.matrix + second.matrix

# vectors can be used to add into the matrix
first.matrix + 1:3

# Calculating row and column summaries
#Get the total number each women made during the last 6 games
rowSums(baskets.team)
rowMeans(baskets.team)



# Creating an array
my.array <- array(1:24, dim= c(3, 4, 2))
my.array

# changing the dimensions of a vector
my.vector <- 1:24 
dim(my.vector) <- c(3, 4, 2) # This creates an array like the one above it from a vector
my.vector


# Checking if they are identical
identical(my.array, my.vector)


# How to get the 2nd row and 3rd column value
my.array[2, 3, 1] # [row, column, slice]

# How to get the 3rd column of the 2nd slice
my.array[, 3, 2, drop= FALSE] # [row, column, slice]


# Combining different tuype of values in a data frame
baskets.df <- as.data.frame(t(baskets.team)) # t() converts rows to columns 
baskets.df

# Counting values and variables
# Get the number of rows in a dataframe
nrow(baskets.df)

# get the number of columns in a dataframe
ncol(baskets.df)
length(baskets.df) # Get the number of variables


# Creating a data frame from scratch
# names salaries and starting dates

# Create 3 vectors that contain the information
employee <- c("John Doe", "Peter Gynn", "Jolie Hope")
salary <- c(21000, 23400, 26800)
startdate <- as.Date(c("2010-11-1", "2008-3-25", "2007-3-14"))


# Combine the 3 vectors into a data frame
employ.data <- data.frame(employee, salary, startdate)

# Preventing character turning into factors
employ.data <- data.frame(employee, salary, startdate, stringsAsFactors = FALSE)


# Naming variables and observations

# Working with variable names
# To access the variable names, I can treat a data frame like a matrix and use the function colnames()
colnames(employ.data) # this works hard, to make it easier and quicker
names(employ.data)

# Change the varible names 
names(employ.data)[3] <- "firstday"

# Data frames always return back a row name even if not specified
rownames(employ.data)

# Changing row names
rownames(employ.data) <-c("Chef", "BigChef", "BiggerChef") # Row names cannot be accessed like column names
employ.data

# Manipulating values in a data frame

# Extracting variables, observations and values

# Pretending dataframe is a matrix
# Get the number of baskets scored by Geraldine in the 3rd game using names
baskets.df["3rd", "Geraldine"] # [row, column ]

# Getting all the baskets granny scored using the column index
baskets.df[, 1] #[ blank, column ] blank returns the whole row

# Keep as a data frame
str(baskets.df[, 1, drop= FALSE])

# Accessing variables "$"
baskets.df$Granny
# To access multiple variables brackets must be used ["name", "name", "name"]

# Adding observations to a data frame

# Adding a single observation 
# Granny and Geraldine played another game and want to add the number of baskets they made

results <- rbind(baskets.df, c(7, 4))
results

# Adjusting the new row name
baskets.df <- rbind(baskets.df, "7th" = c(7,4))
baskets.df


new.baskets <- data.frame(Granny = c(3, 8), Geraldine = c(9, 4))
new.baskets
rownames(new.baskets) <- c("8th", "9th")

baskets.df <- rbind(baskets.df, new.baskets)
baskets.df

# Adding a series of values using indices
baskets.df[c("8th", "9th"),] <- matrix(c(3, 8, 9, 4), ncol= 2)

# Matrix is not need to add values to a dataframe
baskets.df[c("8th", "9th"),] <- c(3, 8, 9, 4)


# Adding variables to a data frame

# Adding a single variable
# Granny wants us to add a new play and the points
# First create a vector with the data
baskets.of.Gabrielle <- c(11, 5, 6, 7, 3, 12, 4, 5, 9)

# Second use "$" to add a new variable followed by the name 
baskets.df$Gabrielle <- baskets.of.Gabrielle

# Taking a peak using head() functions 
head(baskets.df)


# Adding multiple variables using cbind
# Create new data frames for two new people
new.df <- data.frame(
  Gertrude = c(3, 5, 2, 1, NA, 3, 1, 1, 4),
  Guinevere = c(6, 9, 7, 3, 3, 6, 2, 10, 6))

head(cbind(baskets.df, new.df), 4)



# Combining different objects in a list
# Creating a list

# Creating an unnamed list
baskets.list <- list(baskets.team, "2010-2011")

# Creating a named list 
baskets.nlist <- list(scores = baskets.team, season= "2010-2011")
baskets.nlist

# Playing with components
names(baskets.nlist)



# USING [[ ]]  - this returns the components itself
baskets.list[[1]]
# This is the same
baskets.nlist[["scores"]]

# Using [ ]
baskets.list[-1]


baskets.nlist[grepl("season", names(baskets.nlist))] # grepl() searches for a "Text", in vector) grepl(patter, (wehre to search))

# Changing the vlaue of a component
# using "$" or [[ ]] - the following 3 lines do the same thing
baskets.nlist[[1]] <- baskets.df
baskets.nlist[["scores"]] <- baskets.df
baskets.nlist$scores <- baskets.df

# Changing multiple values
baskets.nlist[1:2] <- list(baskets.df, "2009-2010")


# Removing components
baskets.nlist[[1]] <- NULL
baskets.nlist[["scores"]] <- NULL
baskets.nlist$scores <- NULL


# Adding extra components using indices
# the following 3 lines do the same thing.
baskets.nlist$players <- c("Granny", "Geraldine")
baskets.nlist[["players"]] <- c("Granny", "Geraldine")
baskets.nlist["players"] <- list(c("Granny", "Geraldine"))


baskets.list[[3]] <- c("Granny", "Geraldine")
baskets.list[3] <- list(c("Granny", "Geraldine"))

# Combining lists
baskets.list <- list(baskets.team, "2010-2011")
players <- list(rownames(baskets.team))

c(baskets.list, players)-



