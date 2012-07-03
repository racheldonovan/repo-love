RepoLove::Application.routes.draw do
  
  get "favorites/index"
  post "favorites/create"

  resource :favorites, :only => [:destroy]

  get "repos/index"
  post "repos/search", :as => :search

  get "home/index"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => 'home#index'
end
