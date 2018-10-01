#Title: NBA 2018 teams table
#Description: This code creates a team table from nba2018.csv

library(ggplot2)
library(dplyr)
library(tidyverse)


setwd(dir = '~/desktop/stat133/workouts/workout1/code')

nba = read_csv('../data/nba2018.csv',
               col_types = cols(
                 experience = col_character(),
                 position = col_factor(
                   levels = c("C", "PF", "PG", "SF", "SG")
                 )))


#transform salary
nba$salary = nba$salary/1000000

#change position factor levels
levels(nba$position) = c("Center", 'power_fwd', 'point_guard', 'point_guard', 'small_forward','shoot_guard')





#add column missed_fg, missed_ft and efficiency to nba tibble
nba = mutate(nba, 
             missed_fg = field_goals_atts - field_goals,
             missed_ft = points1_atts - points1,
             efficiency = (points + total_rebounds + assists + steals + blocks - missed_fg - missed_ft - turnovers)/ games
             )


#write files to efficiency-summary.txt
sink('../output/efficiency-summary.txt')

summary(nba$efficiency)

sink()








