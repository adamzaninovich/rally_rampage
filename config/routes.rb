RallyRampage::Application.routes.draw do
  get "teams/index"
  get "static/index"
  root 'static#index'
end
