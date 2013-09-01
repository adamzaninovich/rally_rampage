# Rally Rampage TODO

## Immediate

* as a rally team, I want to be able to start a stage
  * Acceptance Criteria
    1. js objects correctly initialize an unstarted stage
    2. pressing the start button sends an ajax request to the server
    3. a callback is received with the start time and end time
    4. the timer is started

* as a rally team, I want to be able to open the app mid-stage
  

* figure out how to construct js objects before stage has been started
* start stage button (ajax request + update timer)
* finish stage button
* flow into next stage

## Future

* implement a pin code for team login
* results resource (probably doesn't need AR)
  - /results/:team_id
    - shows results of one team
  - /results
    - shows results of all teams (leaderboard)
* routes resource
  - /routes => /grandstands (alias)
    - shows all teams on a map with routes and live leaderboard
  - /routes/:team_id
    - POST endpoint for geo coordinates
    - can take an array of coords

## Done

* finish flow of picking team and moving into the first stage
