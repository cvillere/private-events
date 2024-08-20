Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions'

  }

  devise_scope :user do
    # get 'users/:id', to: 'users/sessions#show', as: 'user'
    # get 'users/sign_out' => "devise/sessions#destroy"
    get 'users/sign_in', to: 'devise/sessions#new'
    get 'sessions/show', to: 'devise/sessions#show', as: 'session'

  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "events#index"

  resources :users
  resources :event_attendees
  resources :events do
    resources :event_attendees
  end



end
