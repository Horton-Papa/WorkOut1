Work Out 1
================
Horton Papa
10/1/2018

Analysis of NBA data
====================

### Basic Ranking

#### Rank the teams according to salary and arrange in decreasing order

``` r
teams = read_csv('../data/nba2018-teams.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   team = col_character(),
    ##   total_experience = col_integer(),
    ##   total_salary = col_double(),
    ##   total_points3 = col_integer(),
    ##   total_points2 = col_integer(),
    ##   total_points1 = col_integer(),
    ##   total_points = col_integer(),
    ##   total_off_rebounds = col_integer(),
    ##   total_def_rebounds = col_integer(),
    ##   total_assists = col_integer(),
    ##   total_steals = col_integer(),
    ##   total_blocks = col_integer(),
    ##   total_turnovers = col_integer(),
    ##   total_fouls = col_integer(),
    ##   total_efficiency = col_double()
    ## )

``` r
ggplot(teams) + 
  geom_bar(
    aes(x= reorder(team,total_salary), y = total_salary), 
    stat = 'identity', 
    width = .825, 
    fill =rgb(128/255,128/255,128/255)) + 
  coord_flip() + 
  xlab('Team') + 
  ylab('Salary in Millions') +
  ggtitle('NBA Teams Ranked by Total Salary') + 
  geom_hline(aes(yintercept = mean(total_salary)), color = 'red')
```

![](workout01-horton-papa_files/Total%20Salary%20Ranking-1.png)

#### Create another bar chart using `total_points`

``` r
ggplot(teams) +
  geom_bar(aes(x = reorder(team, total_points), y = total_points),
           stat = 'identity',
           width = .825,
           fill = rgb(128,128,128, maxColorValue = 255)) + 
  coord_flip() + 
  xlab('Team') +
  ylab('Total Points Scored') + 
  ggtitle("NBA Teams Ranked by Total Points") + 
  geom_hline(aes(yintercept = mean(total_points)), color = 'red')
```

![](workout01-horton-papa_files/total%20points%20ranking-1.png)

#### Create another bar chart using `efficiency`

``` r
ggplot(teams) +
  geom_bar(aes(x  = reorder(team, total_efficiency), y = total_efficiency),
           stat = 'identity',
           width = .825,
           fill = rgb(128,128,128, maxColorValue = 255)) +
  coord_flip() +
  xlab('Team') +
  ylab('Efficiency (percent)') +
  ggtitle("NBA Teams Ranked by Efficiency") +
  geom_hline(aes(yintercept = mean(total_efficiency)), color = 'red')
```

![](workout01-horton-papa_files/efficiency%20ranking-1.png)

#### Create a bar chart using another index

-   I think the next natural ranking that comes to mind, is by how much total player experience each team has. Total experience is calculated by adding up the experience of each player for their respective teams. So, the graph will show the cumulative experience of the players for each team. Shown below is the ranking mentioned:

``` r
ggplot(teams) +
  geom_bar(aes(x = reorder(team, total_experience), y = total_experience),
           stat = 'identity',
           width = .825,
           fill = rgb(128,128,128, maxColorValue = 255)) +
  coord_flip() +
  xlab('TEam') +
  ylab('Experience (in Years') +
  ggtitle('NBA Teams Ranked by Cumulative Experience') +
  geom_hline(aes(yintercept = mean(total_experience)), color = 'red')
```

![](workout01-horton-papa_files/total%20experience%20ranking-1.png)

Comments and Reflections
------------------------

-   Yes, this is the first time I am working on this type of file structure. I think it is useful since it promotes an organized workspace, and not just have files all over the place.

-   This is my first time using relative paths in this class, but not this assignment. It is important since the file structure and directories you have in your computer is not the same as anyone else's. When you need to forward or send projects, it is less likely to have an error.

-   This is the first time I am using an R script to write all the code. I like it because all the codes are contained in one area, and not embedded into an .Rmd file; it is much easier and quicker to find which part of code I need to edit, or correct for debugging purposes.

-   formatting decimals was surprisingly tricky with regards to which command to use, also creating the barchart with a certain order was a bit tricky as well.

-   The `sink()` function was fairly intuitive. It was much easier than I initially thought.

-   This HW took me approximately 6 hrs to complete.

-   Seeing the rankings was really interesting. I didnt expect the LA Clippers to have the second highest total salary and experience.
