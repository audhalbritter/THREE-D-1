###Trying the ggplot to nicely visualize the biomass data from permanent plots###
#################################################################################

Permanent<-read.csv("Total_Biomass_Permanent_Plots.csv",  
                    sep=";",                        
                    dec=",",                        
                    header=TRUE,                    
                    stringsAsFactors = FALSE)

library(ggplot2)

data(Permanent)
Permanent$elevation <- factor(Permanent$elevation,
                           labels = c("Vikesland", "Hogsete", "Joasete", "In Between", "Liahovden"))

p10 <- ggplot(Permanent, aes(x = elevation, y = bioperday, fill = Treatment)) +
  geom_boxplot()
p10

###Customizing the labels###

p10 <- p10 + scale_x_discrete(name = "Study sites") +
  scale_y_continuous(name = "Biomass/day (g)")
p10

###Adding the title###

p10 <- p10 + ggtitle("Biomass/perday in permanent plots across sites")
p10

p10 <- p10 + geom_jitter()
p10

p10 <- p10 + scale_fill_brewer(palette = "Accent")
p10

###Just boxolots across sites with different treatments###

p10 <- ggplot(Permanent, aes(x = elevation, y = bioperday, fill = Treatment)) +
  geom_boxplot(notch = FALSE) + scale_x_discrete(name = "Study sites") +
  scale_y_continuous(name = "Biomass/day (g)") + ggtitle("Above-ground biomass grown per day in permanent plots across all study sites") + scale_fill_brewer(palette = "Accent") + theme_bw() +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"),
        axis.title = element_text(face="bold"),
        axis.text.x=element_text(size = 11),
        legend.position = "bottom") +
  scale_fill_brewer(palette = "Accent") +
  labs(fill = "Treatment")
p10

###Adding notch to the boxplot###
###With notch and data dots###
p10 <- ggplot(Permanent, aes(x = elevation, y = bioperday, fill = Treatment)) +
  geom_boxplot(notch = TRUE) + scale_x_discrete(name = "Study sites") +
  scale_y_continuous(name = "Biomass/day (g)") + ggtitle("Above-ground biomass grown per day in permanent plots across all study sites") + geom_jitter() + scale_fill_brewer(palette = "Accent") + theme_bw() +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"),
        axis.title = element_text(face="bold"),
        axis.text.x=element_text(size = 11),
        legend.position = "bottom") +
  scale_fill_brewer(palette = "Accent") +
  labs(fill = "Treatment")
p10
