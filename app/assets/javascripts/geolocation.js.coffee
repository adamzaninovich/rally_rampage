Geolocation =
  get_location: -> navigator.geolocation.getCurrentPosition @success, @error
  success: (location) =>
    alert "#{location.coords.longitude}, #{location.coords.latitude}"
  error: (error) =>
    alert error

window.Geolocation = Geolocation
