LingoAmigo::Application.routes.draw do

  root "questions#index"
  
  resources :questions do
  	resources :answers
  end
  
  resources :users

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
