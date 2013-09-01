class Stage
  constructor: (el) ->
    data = el.data 'stage'
    @stage_type = data.stage_type
    @start_time = data.start_time
    @end_time = data.end_time

window.Stage = Stage
