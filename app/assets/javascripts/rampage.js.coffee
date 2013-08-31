Rampage =
  initialize: (timer_id) ->
    start_button = $ '.button.start'
    finish_button = $ '.button.finish'
    console.log 'initializing!'
    timer = new Timer timer_id
    start_button.show()
    start_button.on 'click', (e) ->
      e.preventDefault()
      timer.run()
      start_button.hide()
      finish_button.show()
      finish_button.on 'click', (e) ->
        e.preventDefault()
        time = timer.stop()
        finish_button.hide()
        $('#stage-finished').show()
        $('.button.next').show()
        # send the time and geo to the server
        Geolocation.get_location()
    timer
  overtime: (is_overtime=true) ->
    if is_overtime
      $('body').addClass 'warning'
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
