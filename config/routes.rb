CDCollection::Application.routes.draw do
  root :to=>"home#index"
  resources :ratings, only: :update
  resources :users
  resources :ligneliste, only: :create

  get "profil/show"
  get "profil/collection"
  get "profil/wantlist"


  get "ratings/update"
  get "artiste/index"

  get "sign_in" => "authentication#sign_in"
  get "signed_out" => "authentication#signed_out"
  get "change_password" => "authentication#change_password"
  get "forgot_password" => "authentication#forgot_password"
  get "new_user" => "authentication#new_user"
  get "password_sent" => "authentication#password_sent"

  get "profil" => "profil#show"
  get "collection" => "profil#collection"
  get "plus_tard" => "profil#wantlist"

  get "fiche_artiste" => "artiste#fiche"

  post "sign_in" => "authentication#login"
  post "new_user" => "authentication#register"

  post "suppRating" => "profil#suppRating"
  post "changerListe" => "profil#changerListe"

  delete "supprimerListe" => "ligneliste#destroy"


end
