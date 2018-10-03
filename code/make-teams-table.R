#Title: NBA 2018 teams table
#Description: This code creates a team table from nba2018.csv
#input(s):  data from nba2018.csv
#output(s): Creates new tibble and writes to a file nba2018-teams.csv. Also creates a new tibble teaams containg totals of attributes of vectors from nba2018.csv, new files for summary of the teams tibble and a summary of efficiency.

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

#data aggregration := creating a data frame, group by team, with total values for experience, salary, points3, points2 points1, points, off_rebounds, def_rebounds, assists, steals, blocks, turnovers, fouls, efficiency,  
#must convert experience column to integer first, and replace all intances of R to a 0

nba$experience[nba$experience == "R"] = 0
nba$experience = as.integer(nba$experience)

options(digits = 7)

teams = summarise(
  group_by(nba, team), 
  total_experience = round(sum(experience, digits = 2)), #round decimals
  total_salary = round(sum(salary), digits = 2),#round decimals 
  total_points3 = sum(points3), 
  total_points2 = sum(points2), 
  total_points1 = sum(points1), 
  total_points = sum(points), 
  total_off_rebounds = sum(off_rebounds), 
  total_def_rebounds = sum(def_rebounds), 
  total_assists = sum(assists), 
  total_steals = sum(steals), 
  total_blocks = sum(blocks), 
  total_turnovers = sum(turnovers), 
  total_fouls = sum(fouls), 
  total_efficiency = mean(efficiency)
  )

#send R output of the teams summary to a text file in data

sink('../output/teams-summary.txt')

summary(teams)

sink()

#export teams file to data folder

write_csv(teams, '../data/nba2018-teams.csv')




