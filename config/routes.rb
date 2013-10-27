RallyRampage::Application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :teams, only: [:index, :show]
    end
  end

  get 'stages/current' => 'stages#current', as: :current_stage
  resources :stages, only: [:index, :show] do
    post 'start'
    post 'finish'
  end

  resources :results, only: [:index]

  resources :sessions, only: [:create, :destroy]
  get 'logout', to: 'sessions#destroy', as: :logout

  resources :teams, only: [:index, :show]

  root 'teams#index'
end
