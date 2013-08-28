RallyRampage::Application.routes.draw do
  resources :teams, only: [:index, :show]

  resources :stages, only: [:index, :show] do
    post 'done'
  end
  get 'stages/current' => 'stages#current', as: :current_stage

  resources :sessions, only: [:create, :destroy]
  get 'logout', to: 'sessions#destroy', as: :logout

  root 'teams#index'
end
