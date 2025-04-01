# 🏏 IPL SEASON ANALYSIS (2008-2022)

![Image](https://github.com/user-attachments/assets/db5b41e5-9bf4-44ad-806e-164b8d5fd6d2)

## 📌 Project Overview

**This project provides a comprehensive analysis of IPL seasons from 2008 to 2022, leveraging SQL and Power BI. The dashboard presents detailed insights into match outcomes, team performances, individual player achievements, and key tournament statistics.**

## 🎯 Key Highlights

✅ Season-wise Champion Teams 🏆  
✅ Orange & Purple Cap Holders 🏅  
✅ Total Sixes & Fours in Each Season 🔥  
✅ Player & Bowler Stats 🎯  
✅ Matches Won by Venue, Toss Decision & Result Type 📊  
✅ Team-wise Win Count in Each Season ⚡ 

## 📂 Dataset & Schema

This project utilizes two tables:
#### 1️⃣ ipl_matches_2008_2022
**Contains match-level details from 2008 to 2022.**

```sql
CREATE TABLE ipl_matches_2008_2022 (
    id INT8 PRIMARY KEY,
    city VARCHAR(50),
    match_date DATE,
    season VARCHAR(50),
    match_number VARCHAR(50),
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    venue VARCHAR(100),
    toss_winner VARCHAR(50),
    toss_decision VARCHAR(50),
    superover VARCHAR(50),
    winning_team VARCHAR(50),
    won_by VARCHAR(50),
    margin VARCHAR(50),
    method VARCHAR(50),
    player_of_match VARCHAR(50),
    umpire1 VARCHAR(50),
    umpire2 VARCHAR(50)
);
```



#### 2️⃣ ipl_ball_by_ball_2008_2022
**Contains ball-by-ball details of every IPL match played.**
```sql
CREATE TABLE ipl_ball_by_ball_2008_2022 (
    id INT8 NOT NULL,
    innings INT8,
    overs INT8,
    ball_number INT8,
    batter VARCHAR(50),
    bowler VARCHAR(50),
    non_striker VARCHAR(50),
    extra_type VARCHAR(50),
    batsman_run INT8,
    extras_run INT8,
    total_run INT8,
    non_boundry INT8,
    iswicket_delivery INT8,
    player_out VARCHAR(50),
    dismisal_kind VARCHAR(50),
    fielders_involved VARCHAR(50),
    batting_team VARCHAR(50)
);
```
## 📊 Power BI Dashboard Insights

🔹 Season Winners & Individual Awards

- Displays the title-winning team each season.

- Shows the Orange Cap (most runs) & Purple Cap (most wickets) holders.

- Highlights the total fours & sixes in each season.

🔹 Batting & Bowling Stats

- Select a batsman to view total runs, sixes, fours, and strike rate.

- Select a bowler to view total wickets, economy rate, and bowling average.

🔹 Team & Match Analysis

- Matches Won by Venue (Runs/Wickets)

- Matches Won by Toss Decision (Field/Bat)

- Matches Won by Result Type (Runs/Wickets)

- Total Wins by a Team in a Season




















