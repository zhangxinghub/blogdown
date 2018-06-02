getwd()
setwd("...")

set.seed(3000)
N = 10000
NoExperience = data.frame(Estimate = rnorm(N, 5, 3), Information = "No")
Experience = data.frame(Estimate = rnorm(N, 5, 1), Information = "Yes")

DT = rbind(NoExperience, Experience)

png("BeliefLearning.png", width=800, height=800)
ggplot(DT, aes(x= Estimate, fill=Information)) + 
  geom_density(aes(colour=Information,linetype=Information),
               alpha=0,position="identity",show.legend = FALSE, size=2)+
  theme(legend.position="bottom", legend.text=element_text(size=24), 
        legend.title = element_text(size = "24"), 
        plot.title = element_text(size = rel(2)),
        axis.title.y = element_text(size = rel(2)), 
        axis.title.x = element_text(size = rel(2)),
        axis.text.x = element_text(angle=0, vjust=1, size=25), 
        axis.text.y = element_text(angle=0, vjust=1, size=25),
        strip.text = element_text(size=25),
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        strip.background = element_blank()) +
  labs(title = "", x = "", y = "Belief")+
  guides(fill=guide_legend(title="Experience"))
dev.off()