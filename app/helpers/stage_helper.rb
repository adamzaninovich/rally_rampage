module StageHelper
  def render_time_in_hms seconds
    hours = seconds / 3600
    seconds -= hours * 3600

    minutes = seconds / 60
    seconds -= minutes * 60

    time = []
    time << pluralize(hours, 'hour')
    time << pluralize(minutes, 'minute')
    time << pluralize(seconds, 'second') if seconds > 0
    time.join ", "
  end
end
