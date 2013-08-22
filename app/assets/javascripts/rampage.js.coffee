Rampage =
  initialize: ->
    timer = new Timer "timer", Date.now()/1000 + 5, "down"
    timer.run()
    $('.button.finish').on 'click', (e) ->
      e.preventDefault()
      Geolocation.get_location()
  overtime: ->
    $('body').addClass 'warning'
    $('#overtime').show()
  show_install: ->
    $('#application').hide()
    $('#install').show()
  is_iphone:    -> window.navigator.userAgent.indexOf('iPhone')!= -1
  is_installed: -> window.navigator.standalone()
  is_online:    -> window.navigator.onLine()

window.Rampage = Rampage
