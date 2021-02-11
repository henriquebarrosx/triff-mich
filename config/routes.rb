Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    # This is the same that "/user/:user_id/events". Also, avoid that we need write a new query
    resources :events, only: [:index]
  end

  post '/reset_password', to: 'users#recovery_email'

  resources :events
end
