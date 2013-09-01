Rampage =
  initialize: (timer_id) ->
    console.log 'initializing'
    @el = $ "##{timer_id}"
    @stage = new Stage @el
    @timer = new Timer @el
    @start_button = $ '.button.start'
    @finish_button = $ '.button.finish'
    @continue_stage()
  continue_stage: () ->
    if @stage.start_time is 0
      console.log 'waiting'
      @timer.el.text 'Press Start to Begin the Stage'
      @start_button.show()
    else if @stage.finish_time is 0
      console.log 'continuing'
      @timer.run()
      @finish_button.show()
    else
      console.log 'ending'
      @finish_stage @stage.start_time, @stage.finish_time
  start_stage: (start_time, end_time) ->
    console.log 'starting'
    @start_button.hide()
    @stage.start_time = start_time
    @stage.end_time = end_time
    @timer.set()
    @timer.run()
    @finish_button.show()
  finish_stage: (start_time, finish_time) ->
    console.log 'finishing'
    @stage.start_time = start_time
    @stage.finish_time = finish_time
    @finish_button.hide()
    @timer.stop()
    @timer.display_final start_time, finish_time
    $('#stage-finished').show()
    $('.button.next').show()
    # send the time and geo to the server
    #Geolocation.get_location()
  overtime: (is_overtime=true) ->
    if is_overtime
      $('body').addClass 'warning'
      $('#stage-info').hide()
      $('#overtime').show()
    else
      $('body').removeClass 'warning'
      $('#overtime').hide()
  show_install: ->
    $('#application').hide()
    $('#install').show()
  is_iphone:    -> window.navigator.userAgent.indexOf('iPhone')!= -1
  is_installed: -> window.navigator.standalone()
  is_online:    -> window.navigator.onLine()

window.Rampage = Rampage
