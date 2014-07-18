LingoAmigo::Application.routes.draw do
	post "/answers/save_file", to: "answers#save_file"

  root "questions#index"
  
  resources :questions do
  	resources :answers
  end
  
  resources :users

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
