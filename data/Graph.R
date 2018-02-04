library(data.table)
library(ggplot2)
setwd("C:/Users/Zhang Xing/Documents/GitHub/blogdown/data")
DT = fread("genius.csv", sep=",", header=TRUE)
## cat1=daughter; cat2=son; cat3=dog; cat4=myself
table(DT$variable)
DT = melt(DT, measure = patterns("^Search.Volume"),value.name = c("Search.Volume"))
DT = DT[, Topic := ifelse(variable == "Search.Volume1", "Is my daughter a genius?",
                          ifelse(variable == "Search.Volume2", "Is my son a genius?",
                                 ifelse(variable == "Search.Volume3", "Is my dog a genius?",
                                        "Am I a genius?")))]
ByTopic = DT[, .(Average.Search.Volume = mean(Search.Volume)), by = Topic]
ByTopicNoSelfDog = ByTopic[Topic != "Am I a genius?" & Topic != "Is my dog a genius?"]
(NoSelfDogBar = ggplot(ByTopicNoSelfDog, aes(x=Topic, y = Average.Search.Volume)) + 
  geom_bar(position="dodge", stat = "identity",width=0.5)+
theme(legend.position="bottom", legend.text=element_text(size=24), 
      legend.title = element_text(size = "24"), 
      plot.title = element_text(size = rel(4), hjust = 0.5),
      axis.title.y = element_text(size = rel(3)), 
      axis.title.x = element_text(size = rel(3)),
      axis.text.x = element_text(angle=0, vjust=1,hjust=0.5, size=30), 
      axis.text.y = element_text(angle=0, vjust=1, size=30),
      strip.text = element_text(size=30),
      axis.line = element_line(colour = "black"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.border = element_blank(),
      panel.background = element_blank(),
      strip.background = element_blank())+ 
  labs(title = "", 
       x = "Topic", y = "Search Volume") )

ByTopicNoDog = ByTopic[Topic != "Is my dog a genius?"]
(NoSelfDogBar = ggplot(ByTopicNoDog, aes(x=Topic, y = Average.Search.Volume)) + 
    geom_bar(position="dodge", stat = "identity",width=0.5)+
    theme(legend.position="bottom", legend.text=element_text(size=24), 
          legend.title = element_text(size = "24"), 
          plot.title = element_text(size = rel(4), hjust = 0.5),
          axis.title.y = element_text(size = rel(3)), 
          axis.title.x = element_text(size = rel(3)),
          axis.text.x = element_text(angle=0, vjust=1,hjust=0.5, size=30), 
          axis.text.y = element_text(angle=0, vjust=1, size=30),
          strip.text = element_text(size=30),
          axis.line = element_line(colour = "black"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          strip.background = element_blank())+ 
    labs(title = "", 
         x = "Topic", y = "Search Volume") )


ByTopicNoSelf = ByTopic[Topic != "Am I a genius?"]
(NoSelf = ggplot(ByTopicNoSelf, aes(x=Topic, y = Average.Search.Volume)) + 
    geom_bar(position="dodge", stat = "identity",width=0.5)+
    theme(legend.position="bottom", legend.text=element_text(size=24), 
          legend.title = element_text(size = "24"), 
          plot.title = element_text(size = rel(4), hjust = 0.5),
          axis.title.y = element_text(size = rel(3)), 
          axis.title.x = element_text(size = rel(3)),
          axis.text.x = element_text(angle=0, vjust=1,hjust=0.5, size=30), 
          axis.text.y = element_text(angle=0, vjust=1, size=30),
          strip.text = element_text(size=30),
          axis.line = element_line(colour = "black"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          strip.background = element_blank())+ 
    labs(title = "", 
         x = "Topic", y = "Search Volume") )