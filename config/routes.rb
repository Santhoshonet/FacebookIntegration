FaceBookAPI::Application.routes.draw do
  resources :users

  root :controller => "welcome", :action => "index"
  match "assignrfid", :controller => "users",  :action => "assignrfid"
  match ":controller/:action(/:id)"
  match ":controller/:action:id.:format"

end
