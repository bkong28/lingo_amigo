LingoAmigo::Application.routes.draw do
  devise_for :users
	post "/answers/save_file", to: "answers#save_file"

  root "questions#new"
  
  resources :questions do
  	resources :answers
  end

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
