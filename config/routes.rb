RallyRampage::Application.routes.draw do

  get 'stages/current' => 'stages#current', as: :current_stage
  resources :stages, only: [:index, :show] do
    post 'done'
  end

  resources :sessions, only: [:create, :destroy]
  get 'logout', to: 'sessions#destroy', as: :logout

  resources :teams, only: [:index, :show]

  root 'teams#index'
end
