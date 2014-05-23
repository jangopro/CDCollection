CDCollection::Application.routes.draw do

  get "profil/show"
  get "profil/collection"
  get "profil/wantlist"
  resources :ratings, only: :update
  resources :users

  get "ratings/update"
  get "artiste/index"
  root :to=>"home#index"

  get "sign_in" => "authentication#sign_in"
  get "signed_out" => "authentication#signed_out"
  get "change_password" => "authentication#change_password"
  get "forgot_password" => "authentication#forgot_password"
  get "new_user" => "authentication#new_user"
  get "password_sent" => "authentication#password_sent"

  get "profil" => "profil#show"
  get "collection" => "profil#collection"
  get "plus-tard" => "profil#wantlist"

  get "fiche_artiste" => "artiste#fiche"

  post "sign_in" => "authentication#login"
  post "new_user" => "authentication#register"



end
