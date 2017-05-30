Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :links do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    # by using "resources" it will do all of the RESTFUL routes for you
    resources :comments
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "links#index"
end
