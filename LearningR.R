# Data Exploration
# loading packages
library(ggplot2)
library(scales)
library(WVPlots)
library(dplyr)

# making histogram
p1 <- ggplot(custdata, aes(x=gas_usage))
p1 + geom_histogram(binwidth=10, fill="gray")


# making density plots
p2 <- ggplot(custdata, aes(x=income)) 
p2 + geom_density() + scale_x_continuous(labels=dollar)
p2 + geom_density() + scale_x_log10(breaks = c(10, 100, 1000, 10000, 100000, 1000000),labels=dollar) + annotation_logticks(sides="bt", color="gray")

# making barcharts
p3 <- ggplot(custdata, aes(x=marital_status)) 
p3 + geom_bar(fill = "red") + coord_flip()
ClevelandDotPlot(custdata, "state_of_res", sort = 2, title="Customers by state") +
  coord_flip()

#line graphs, scatter plots, etc
custdata2 <- subset(custdata, 0 < age & age < 100 & 0 < income & income < 200000) # create subset
set.seed(245566) 
custdata_samp <- sample_frac(custdata2, size=0.1, replace=FALSE) # create random sample of 10% (requires dplyr package)
p4 <- ggplot(custdata_samp, aes(x=age, y=income)) 
p4 + geom_point() + ggtitle("Income as a function of age") + geom_smooth()

#hexbin plot
HexBinPlot(custdata2, "age", "income", "Income as a function of age") + geom_smooth(color="black", se=FALSE)