class Timer
  constructor: (id_of_element)->
    @el = $ "##{id_of_element}"
    stage = @el.data 'stage'
    @stage_type = stage.stage_type
    if @stage_type is 'ideal_time'
      @direction = 'down'
      @time = new Date stage.end_time*1000
    else
      @direction = 'up'
      @time = new Date stage.start_time*1000
    @paused = false
  run: -> setTimeout @display_time, 1000
  stop: ->
    @paused = true
    current_time = new Date
    Rampage.overtime false
    if @direction is "down"
      elapsed_time = @time - current_time
    else
      elapsed_time = current_time - @time
    elapsed_time

  format_time: (time)->
    pad_numbers = (n)-> if (n<10) then "0#{n}" else "#{n}"
    h = time.getHours()
    m = pad_numbers time.getMinutes()
    s = pad_numbers time.getSeconds()
    "#{h}:#{m}:#{s}"
  display_time: =>
    unless @paused
      current_time = new Date
      if @direction is "down"
        elapsed_time = @time - current_time
        if elapsed_time < 0
          @el.html "- " + @format_time(new Date -elapsed_time + 28801000)
          Rampage.overtime()
        else
          @el.html @format_time(new Date elapsed_time + 28800000)
      @run()

window.Timer = Timer
