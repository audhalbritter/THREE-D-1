###Testing if treament effect varies among sites in permanent plots######
########Two-Way ANOVA####################################################

Testing2<-read.csv("Testing_treatment_effect_among_sites.csv",  
                  sep=";",                        
                  dec=",",                        
                  header=TRUE,                    
                  stringsAsFactors = FALSE)     

attach(Testing2)

summary(Testing2)

str(Testing2)

View(Testing2)

################################
###Testing for the main effect##

Model_1<-aov(biomass~treatment+site, data=Testing2)

summary(Model_1)

###Cheking if the model assumptions are met###

par(mfrow=c(2,2))

plot(Model_1)

#####Assumption 1: Normal distribution: Shapiro-Wilk test (testing for normality)####

uhat1<-resid(Model_1)
shapiro.test(uhat1)

####Assumption 2: Homogeneity of variance of the groups###

leveneTest(biomass~treatment*site, data=Testing2)

########################################
###Testing for the interaction effect###

Model_2<-aov(biomass~treatment*site, data=Testing2)

summary(Model_2)

##Assumption testig:##

par(mfrow=c(2,2))

plot(Model_2)

#####Shapiro-Wilk test (testing for normality)####

uhat2<-resid(Model_2)
shapiro.test(uhat2)

###Post-hoc test: Since we found a significant interaction effect###

###Question to AUD: what am I doing wrong here?###
#I constantly get the error message saying that the "cld" function could not be found##

library("lsmeans")
library("multcompView")

posthoc <-lsmeans(Model_2,
                  pairwise~treatment*site,
                  adjust = "tukey")
posthoc

cld(posthoc,
    alpha=0.05,
    Letter=letters)
