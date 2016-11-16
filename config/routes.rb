Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tweets
  devise_for :users, :controllers => { registrations: "users/registrations", sessions: "users/sessions" }
  root to: "tweets#index"
end
