class Timer
  constructor: (@el)->
    @paused = false
    @show_ms = true
    @set()
  set: () ->
    if Rampage.stage.stage_type is 'ideal_time'
      @direction = 'down'
      @time = new Date Rampage.stage.end_time*1000
    else
      @direction = 'up'
      @time = new Date Rampage.stage.start_time*1000
  run: -> setTimeout @display_time, 10
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
    m = if h>0
      pad_numbers time.getMinutes()
    else
      time.getMinutes()
    s = pad_numbers time.getSeconds()
    ms = pad_numbers parseInt(time.getMilliseconds()/10)
    time = "#{m}:#{s}"
    time = if h>0 then "#{h}:#{time}" else time
    if @show_ms then "#{time}.#{ms}" else time
  display_time: =>
    unless @paused
      current_time = new Date
      if @direction is "down"
        elapsed_time = @time - current_time
        if elapsed_time < 0
          elapsed_time = current_time - @time
          @el.html "- " + @format_time(new Date elapsed_time + 28801000)
          Rampage.overtime()
        else
          @el.html @format_time(new Date elapsed_time + 28800000)
      else
        elapsed_time = current_time - @time
        @el.html @format_time(new Date elapsed_time + 28800000)
      @run()

window.Timer = Timer
