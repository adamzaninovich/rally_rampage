# Rally Rampage TODO

## Immediate

* as a rally team, I want to be able to start a stage
  * acceptance criteria
    1. js objects correctly initialize an unstarted stage
    2. pressing the start button sends an ajax request to the server
    3. a callback is received with the start time and ideal end time
    4. the timer is started
    5. the finish button is shown

* as a rally team, I want to be able to open the app mid-stage
  * acceptance criteria
    1. js objects correctly initialize a started stage
    2. page is served with start and end times
    3. timer is correct
    4. the finish button is shown

* as a rally team, I want to be able to finish a stage
  * acceptance criteria
    1. pressing the finish button sends an ajax request to the server
    2. a callback is received with end time
    3. stage results are displayed
    4. the next stage button is shown

* as a rally team, after finishing the current stage, I want to be able to see the next stage before it has been started
  * maybe ??? not sure about this one.
  * how should it work when one team has finished and the others have not?
    * finished team could possible see:
      * their results
      * the info for the next stage with the start button disabled
      * the status of the other teams (live leaderboard)

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
