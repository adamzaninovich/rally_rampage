class Timer

  constructor: (@el) ->
    @paused = false
    @show_ms = true
    @set()

  set: () ->
    if Rampage.stage.stage_type is 'ideal_time'
      @direction = 'down'
      @time = new Date Rampage.stage.end_time
    else
      @direction = 'up'
      @time = new Date Rampage.stage.start_time

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

  format_time: (time_in_seconds, addition=0)->
    time = new Date time_in_seconds + 28800000 + addition
    pad_numbers = (n)-> if (n<10) then "0#{n}" else "#{n}"
    h = time.getHours()
    m = if h > 0 then pad_numbers time.getMinutes() else time.getMinutes()
    s = pad_numbers time.getSeconds()
    ms = pad_numbers parseInt(time.getMilliseconds()/10)
    time = "#{m}:#{s}"
    time = if h>0 then "#{h}:#{time}" else time
    @render_time time, ms

  render_time: (time, ms) ->
    find_or_create_element = (target, selector, element) ->
      if target.find(selector).length == 0
        sub_el = $ "#{element}"
        target.append sub_el
        sub_el
      else
        target.find selector

    main_el = find_or_create_element @el, ".main", "<span class='main'>"
    ms_el = find_or_create_element @el, ".ms", "<span class='ms'>"
    main_el.html time
    ms_el.html ".#{ms}" if @show_ms

  display_final: (start, finish) ->
    if @direction is "down"
      expected = @time - start
      actual = finish - start
      difference = expected - actual
      if difference < 0
        difference = actual - expected
        @format_time difference, 1000 # negative
      else
        @format_time difference
    else
      difference = finish - start
      @format_time difference

  display_time: =>
    unless @paused
      current_time = new Date
      if @direction is "down"
        elapsed_time = @time - current_time
        if elapsed_time < 0
          elapsed_time = current_time - @time
          @format_time elapsed_time, 1000
          Rampage.overtime()
        else
          @format_time elapsed_time
      else
        elapsed_time = current_time - @time
        @format_time elapsed_time
      @run()

window.Timer = Timer
