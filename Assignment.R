titanic.raw = load("~/DM_Assignment6/titanic.raw.RData")
titanic.raw
library("reldist")
library("ineq")
library("entropy")
library("party")
library("FSelectorRcpp")
#gini((titanic.raw$Survived[titanic.raw$Survived=="No"]),(titanic.raw$Survived[titanic.raw$Survived=="No"]))

Gini(titanic.raw$Survived, n = rep(1, length(titanic.raw$Survived[titanic.raw$Survived=="Yes"])))

Gini(titanic.raw$Class, n = rep(1, length(titanic.raw$Survived[titanic.raw$Survived=="Yes" & titanic.raw$Age=="Adult"])
))

Gini(titanic.raw$Sex, n = rep(1, length(titanic.raw$Survived[titanic.raw$Survived=="Yes" & titanic.raw$Age=="Adult"])
))

entropy(titanic.raw$Survived)
information_gain(formula = Sex ~ ., data = titanic.raw)

titanic <- ctree(formula = Survived ~ ., data = titanic.raw, subset = NULL, weights = NULL, 
                 controls = ctree_control(), xtrafo = ptrafo, ytrafo = ptrafo, 
                 scores = NULL)
titanic
plot(titanic) 