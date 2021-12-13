setwd("~/Downloads/Prog_Stat/Fichiers-20210210")
# Assure toi de le faire avec le bon répertoire pour toi

# Exercice 1

# Q1
mydataset = scan("file1.csv", what = "character")

# Q2
nomcol = mydataset[1]

# Q3
gsub(",",".",mydataset)

# Q4
M = matrix(c(""), ncol = 5, nrow = 4, byrow = TRUE)
# Du coup le c("") il faut que tu entres 5*4 = 20  string
# ça te créra une matrice de 5 colonnes et 4 lignes

# Q5
nomligne = M[1,]
nomligne
M[2:4,]

# Q6
data = as.data.frame(M)

# Exercice 2
# Pour l'exo 2 c'est que de l'importation
# regardes la documentation de read.table , tu devrais pouvoir le faire

# Le 3 j'ai pas encore fais mais c'est le même régistre que le 2

? attributes
?lapply
