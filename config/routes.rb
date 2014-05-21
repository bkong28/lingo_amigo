LingoAmigo::Application.routes.draw do
  root "questions#index"
  resources :questions
end
