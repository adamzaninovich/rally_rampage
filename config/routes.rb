RallyRampage::Application.routes.draw do
  resources :teams, only: [:index, :show]

  resources :stages, only: [:index, :show] do
    member do
      post 'done'
    end
    collection do
      get 'current'
    end
  end

  resources :sessions, only: [:create, :destroy]
  get 'logout', to: 'sessions#destroy', as: :logout

  root 'teams#index'
end
