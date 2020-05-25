# Creating named matrix and visualizing using matplot - simple exercise

# named matrix
name <- c("Ishaan", "Zishaan","Kisaan","Deeshan","Seeshan")
month <- c("aug","sep","oct","nov","jan")
Ishaan_score <- c(60,66,77,88,92)
Zishaan_score <- c(70,77,68,66,70)
Kisaan_score <- c(80,81,93,87,77)
Deeshan_score <- c(55,58,72,86,75)
Seeshan_score <- c(66,76,69,77,85)
rank_matrix <-rbind(Ishaan_score,Zishaan_score,Kisaan_score,Deeshan_score,Seeshan_score)
#the vectors can ve deleted as those are no longer needed , after creating the matrix
rm(Ishaan_score,Zishaan_score,Kisaan_score,Deeshan_score,Seeshan_score)
colnames(rank_matrix) <- month
rownames(rank_matrix) <- name
rank_matrix
rank_matrix["Ishaan","nov"]
rank_matrix[1,"nov"]

# named vector .......
marks <- c(25,18,39,11,40)
subjects <- c("english","french","maths","sociology","physics")
names(marks) <-c("english","french","maths","sociology","physics")
marks
marks["sociology"]
names(marks)
##clear names **********
names(marks) <-NULL
marks
#....matrix using matrix()
my.data <- 1:20
A <- matrix(my.data,4,5)
A
B <-matrix(my.data,nrow=4,ncol = 5,byrow = TRUE )
B

#************matplot example syntax *************
rank_matrix  #display the matrix
name         #display the name
t(rank_matrix)  #transpose of rank_matrix
matplot(t(rank_matrix),type="b",pch=15:18, col=c(1:4,6))
legend("bottomleft",inset=0.01, legend=name,pch=15:18, col=c(1:4,6),horiz = F)

# display the matplot only for Ishaan
matplot(rank_matrix[1,],type="b",pch=15:18, col=c(1:4,6))
legend("bottomleft",inset=0.01, legend=name[1],pch=15:18, col=c(1:4,6),horiz = F)

# display the matplot only for Ishaan using transpose
data<- t(rank_matrix)
data
#data[,1] is vector , so convert it to matrix by data[,1,drop=F]
#is.matrix(data[,1,drop=F])   this will show True now
matplot(data[,1,drop=F],type="b",pch=15:18, col=c(1:4,6))
legend("bottomleft",inset=0.01, legend=name[1],pch=15:18, col=c(1:4,6),horiz = F)

#***** creating a function for the above code in matplot
myplot <- function(parameter1,rows){ #rows is parameter 2 actually
  data<- t(parameter1)   # parameter1 = rank_matrix
  data
  matplot(data[,rows,drop=F],type="b",pch=15:18, col=c(1:4,6))
  legend("bottomleft",inset=0.01, legend=name[rows],pch=15:18, col=c(1:4,6),horiz = F)
  
}
myplot(rank_matrix,1)  # <-here parameter1=rank_matrix and rows =1 as passed as parameter
# *****************************************
#***** creating a function for the above code in matplot with default rows as parameter
myplot <- function(parameter1,rows=1:5){ #rows is parameter 2 actually
  data<- t(parameter1)   # parameter1 = rank_matrix
  data
  matplot(data[,rows,drop=F],type="b",pch=15:18, col=c(1:4,6))
  legend("bottomleft",inset=0.01, legend=name[rows],pch=15:18, col=c(1:4,6),horiz = F)
  
}
myplot(rank_matrix)  # <-here parameter1=rank_matrix and rows default value is 1:5 unless explicitly passed as 1 , 2 , 3 4, or 5 etc
# *****************************************
