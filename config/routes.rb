RalleyRampage::Application.routes.draw do
  get "static/index"
  get "static/install"
  root 'static#index'
end
