LingoAmigo::Application.routes.draw do
  get "users/new"
  get "users/create"
  get "users/show"
  root "questions#index"
  resources :questions do
  	resources :answers
  end
  resources :users
end
