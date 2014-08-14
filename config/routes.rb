LingoAmigo::Application.routes.draw do
  devise_for :users
	post "/answers/save_file", to: "answers#save_file"

  root "questions#new"
  
  resources :questions do
  	resources :answers do
      member do
        put "like", to: "answers#upvote"
        put "dislike", to: "answers#downvote"
      end
    end
  end


end
