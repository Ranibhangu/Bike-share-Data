install.packages("tidyverse")
library(tidyverse)
#DF=list.files(path="Project_data",full.names = TRUE) %>%
 # lapply(read_csv) %>%
 # bind_rows()
df=read_csv("202301-divvy-tripdata.csv")
summary(df)
nrow(df)
df2=df[df$member_casual=='member',]
nrow(df2)
df3 <- mutate(df, time_difference_hours = difftime(ended_at, started_at, units = "hours"))
df3$time_difference_hours
range(df3$time_difference_hours)
mean(df3$time_difference_hours)
install.packages("geosphere")                # Install & load geosphere
library("geosphere")
df4=mutate(df,distance_km = distHaversine(cbind(start_lng, start_lat), cbind(end_lng, end_lat))*0.001)
df4$distance_km
range(df4$distance_km)
min(df4$distance_km)
summary(df4$distance_km)

factor(df$start_station_name)
df5=mutate(df,l=list(levels(start_station_name)))
df5$l
df6=df[df$member_casual=='casual',]

df7 <- mutate(df6, time_difference_hours = difftime(ended_at, started_at, units = "hours"))
df7$time_difference_hours
range(df7$time_difference_hours)
mean(df7$time_difference_hours)
sum(df7$time_difference_hours>5)

