## Progression


-- 1. **Write a query to display the team details. Display the records sorted in the order of team name.**

select * from team
order by name;

-- 2. **Write a query to display the player details whose name starts with a letter `S` and who do not belong to the country 'South Africa'. Display the records sorted in descending order based on player name.**

select * from player
where name like 's%' and not country='south Africa'
order by name desc;


-- 3. **Write a query to display the event number and the seconds taken for each event. Display the records sorted in ascending order based on event number.**

select event_no,clock_in_seconds from event
order by event_no asc;

-- 4. **Write a query to display the event numbers of those events which has sum of raid points and defending points greater than or equal to 3. Display the records sorted in ascending order based on event_no.**

select event_no from event
where raid_points>=3 and defending_points>=3
order by event_no asc;


-- 5. **Write a query to display the name of all the players who belong to the country India or Iran. Display the records sorted in ascending order based on player name.**

select name from players
where country='india' or country='iran'
order by name asc;


-- 6. **Write a query to display the name of all the players who does not belong to the country India and Iran. Display the records sorted in ascending order based on player name.**

select name from players
where not country='india' and not country='iran'
order by name asc;


-- 7. **Write a query to display the names of all the skills that start with `Defend`. Display the records sorted in ascending order based on skill name.**

select name from skill
where name like 'Defend%' //finds something starting with
order by name asc;

-- 8. **Write a query to display all the stadium names that ends with `Complex`. Display the records sorted in ascending order based on stadium names.**

select stadium_name from venue
where name like '%Complex' //finds something ending with
order by stadium_name asc;

-- 9. **Write a query to display the winner team ids and the scores of those teams whose scores are less than 35. Display the records sorted in descending order based on outcome id.**

select winner_team_id,score  
from outcome where score<=35
order by outcome_id desc;

-- 10. **Write a query to display the game details of those games that were played between January and March of 2020. Display the records sorted in descending order based on id.**

select * from game
where Month(game_date) in (1,3) and year(game_date)=2020
order by id desc;


-- 11. **Write a query to display the names of players who are Raiders. Display the records sorted in ascending order based on player name.**

select player.name
from player
where event.raider_id=players.id
order by player.name asc;

-- 12. **Write a query to display the event number, raid points and defence points scored in the first innings of the game that was played on `2020-01-26`. Display the records sorted in ascending order based on event number.**

select event.event_no,event.raid_points,event.defending_points
from event ,innings,game
where game.game_date='06-10-2020' and event.innings_id=innings.id
order by event_no desc


-- 13. **Write a query to display the name of the winner team in the game played on `2020-03-09`. Display the records sorted in ascending order based on team name.**

select team.name
from team,game,outcome,player
where game_date='09-03-2020' and 
outcome.winner_team_id=player.team_id
order by team.name in asc;

-- 14. **Write a query to display the names of players who were the player of the match in the game played on 2020-03-09'. Display the records sorted in ascending order based on player name.**

select player.name
from player ,event,game
where player.id=event.raider_id and game_date='09-03-2020' 
order by player.name asc;


-- 15. **Write a query to display the names of players who are All rounders. Display the records sorted in ascending order based on player name.**

select player.name
from player,skill,event
where player.skill_id=skill.id and player.id=raider.id;
order by player.name asc;


-- 16. **Write a query to display the venue names for all the games that were played on `2020-03-09`. Display the records sorted in ascending order based on venue name.**

select venue.stadium_name from 
venue,game where venue.id=game.venue_id
and game.game_date='09-03-2020';


-- 17. **Write a query to display the Coach's name of the team `Iran`**

select team.coach
from team,city
where team.home_city=city.id and city.name='iran';

-- 18. **Write a query to display the event number and the defence points of `Fazel Atrachali` in each event. Display the records sorted in ascending order based on event number.**

select event.event_no,event.defending_points
from event,player,extra_event
where player.name='Fazel atrachali' 
and event.event_no=extra_event.event_id
order by event.event_no desc;

-- 19. **Write a query to display the names of the Winning teams in the month of March 2020. Display the records sorted in ascending order based on team name.**

select team.name
from team,outcome,game
where team.id=winner_team_id and game.(Month)game_date=3
and game.year(game_date)=2020 
order by team.name asc;

-- 20. **Write a query to display the names of players who were the player of the match in the games held in March 2020. Display the records sorted in ascending order based on player name.**

select player.name
from player,outcome,game
where player.id=outcome.player_of_match
and game.(month)game_date=3 and game.(year)game_date=2020
order by player.name asc;
