#ggplot dplyr lesson

install.packages("ggplot2")
library("ggplot2")
##ggplot makes it easy to make pretty plots for complicated data sets


install.packages("dplyr")
library(dplyr)

#compare base graphics with ggplot

mammals <- read.csv(file="mammals.csv", header=TRUE)
head(mammals)

glimpse(mammals)
#glimpse is in dplyr package, shows data in more readable way than head()

view(mammals)
#did not work for me, but you can click on mammals in environment which does the same thing

plot(adult_head_body_len_mm ~ adult_body_mass_g, data=mammals)
#to plot 2 variables with base graphics

ggplot(data=mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm)) + geom_point()
## tells R: which data to use (data), what to plot on axes(aes), and what plot to use (+ geom)

ggplot(data=mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm)) + geom_point(size=3)
## makes same plot with points set to size 3

ggplot(data=mammals, aes(x=adult_body_mass_g, y=adult_head_body_len_mm)) + geom_point(size=3, aes(color=order))
## makes the same plot, adding color based on animal order

glimpse(mammals)

tails <- filter(mammals, order=="Rodentia")
##subset original dataset to the order of rodentia

glimpse(tails)

large_tails <- filter(mammals, order=="Rodentia" | adult_body_mass_g > 100000)

glimpse(large_tails)

large_tails <- filter(mammals, order=="Rodentia" & adult_body_mass_g > 100000)
#filters Rodentia for animals with body mass > 100000g
glimpse(large_tails)

large_tails <- filter(mammals, order=="Rodentia" & adult_body_mass_g > 10)
#filters Rodentia for animals with body mass > 10g

glimpse(large_tails)

tmammals <- filter(mammals, habitat==T)
#filters mammals for animals in habitat T
colnames(mammals)
arrange (tmammals, adult_body_mass_g)
#orders tmammals dataset by size

view (arrange (tmammals, adult_body_mass_g))

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g)) + geom_boxplot() 
##plots habitat agains adult body mass

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g)) + geom_boxplot() + scale_y_log10()
##sets axis to log10

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) + geom_boxplot() + scale_y_log10()
##adds colors to boxes

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) +
  geom_boxplot() +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen"))
##set the color of the boxes

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) +
  geom_boxplot() +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen")) +
  labs(x = "Habitat", y = "Adult body mass (g)")
##add axis labels

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) +
  geom_boxplot() +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen")) +
  labs(x = "Habitat", y = "Adult body mass (g)", title="Body mass of mammals, by habitat")
##add chart title


## adding another geom:

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) +
  geom_boxplot() +
  geom_point() +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen")) +
  labs(x = "Habitat", y = "Adult body mass (g)", title="Body mass of mammals, by habitat")
#add plot layer with stacked points

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) +
  geom_boxplot() +
  geom_jitter() +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen")) +
  labs(x = "Habitat", y = "Adult body mass (g)", title="Body mass of mammals, by habitat")
## add plot layer with jittered points

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) +
  geom_jitter() +
  geom_boxplot() +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen")) +
  labs(x = "Habitat", y = "Adult body mass (g)", title="Body mass of mammals, by habitat")
## changes order of layers boxplot and points

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g, fill=habitat)) +
  geom_boxplot() +
  geom_jitter(aes(x=habitat, y=adult_body_mass_g, col=order), alpha=0.3) +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen")) +
  labs(x = "Habitat", y = "Adult body mass (g)", title="Body mass of mammals, by habitat")
## makes points transparent and colors them by order
## aes (think of it as aesthetics) to specify what of the data you want to use

ggplot(data=mammals, aes(x = habitat, y = adult_body_mass_g)) +
  geom_boxplot(aes(fill=habitat)) +
  geom_jitter(aes(color = order), alpha=0.3) +
  scale_y_log10() +
  scale_fill_manual(values = c("dodgerblue", "forestgreen")) +
  scale_color_discrete(name = "order")
  labs(x = "Habitat", y = "Adult body mass (g)", title="Body mass of mammals, by habitat")
  
  
  
  
  #back to dplyr...
  
summary(mammals)
summarize(mammals, mean_mass = mean(adult_body_mass_g))
#gives NA because it has missing data

summarize(mammals, mean_mass = mean(adult_body_mass_g, na.rm = TRUE))
#removes missing data before summarizing



#now we will make a new data frame

mammals$adult_body_mass_g

mean(mammals$adult_body_mass_g, na.rm = TRUE)

mammals_group_order <- group_by(mammals, order)
#groups mammals by order

glimpse(mammals_group_order)

mammals_summarize <- summarize(mammals_group_order, mean_mass = mean(adult_body_mass_g, na.rm = TRUE))
#data frame with 1 column: summarized mean mass
mammals_summarize

mammals_summarize <- summarize(mammals_group_order,
                               mean_mass = mean(adult_body_mass_g, na.rm = TRUE),
                               mean_len = mean(adult_head_body_len_mm, na.rm = TRUE))
##data frame with 2 columns: summarize mean_mass and mean_len
mammals_summarize

#now we will pipe together the above

#plot it!
ggplot(mammals_summarize, aes)

#simple example
a <- c(1,2,3)
a
mean(a)
# is the sam as

a%>%
  mean()

b <- range(a)
b
c <- diff(b)
c
c <- diff(range(a))

c <- a %>%
  range() %>%
  diff()
c

#back to mammals

mammal %>%
  #group by order
  group_by(order) %>%
  #find the mean mass and mean length for each order
  summarize(mean_mass = mean(adult_body_mass_g, na.rm = TRUE),
            mean_len = mean(adult_head_bodu_len_mm, na.rm = TRUE)) %>%
  #plot mean mass bz mean length
  ggplot(aes(x = mean_mass, y = mean_len)) + geom_point()


#scatter plot of weight vs litter size
#only with orders Rodentia and Cetacea
#set the color of the ponts bz order
#log-transform both axes
#use pipes

mammals %>% 
  #filter Rodents and Cetacea
  filter(order=="Rodentia" | order=="Cetacea") %>%
  #plot
  ggplot(aes(x=adult_body_mass_g, y = litter_size, color=order)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()
  
ggplot(mammals, aes(x = adult_head_body_len_mm, y = adult_body_mass_g)) +
  geom_point(aes(color=order)) +
  scale_y_log10() + scale_x_log10() +
  facet_grid(.~habitat)
#this splits data in columns to split by row ~.habitat

# facet_wrap(~order)


+
  theme_minimal()

install.packages('stringi')
library(stringi)

ggplot(mammals, aes(x = adult_head_body_len_mm, y = adult_body_mass_g)) +
  geom_point(aes(color=order)) +
  scale_y_log10() + scale_x_log10() +
  facet_grid(.~habitat) +
  theme_classic()

ggplot(mammals, aes(x = adult_head_body_len_mm, y = adult_body_mass_g)) +
  geom_point(aes(color=order)) +
  scale_y_log10() + scale_x_log10() +
  facet_grid(.~habitat) +
  theme_minimal()

ggsave("testplot.pdf")
ggsave("testplot.jpg")
ggsave("testplot.tiff")
##here you can also add more arguments such as setting the size of the plot
