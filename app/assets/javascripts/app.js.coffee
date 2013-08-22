class Timer
  constructor: (id_of_element)->
    @el = $ "##{id_of_element}"
  run: -> setTimeout @display_time, 1000
  pad_numbers: (n)-> if (n<10) then "0#{n}" else "#{n}"
  get_time: ->
    time = new Date()
    h = time.getHours()
    m = @pad_numbers time.getMinutes()
    s = @pad_numbers time.getSeconds()
    "#{h}:#{m}:#{s}"
  display_time: =>
    @el.html @get_time()
    @run()

window.Timer = Timer
