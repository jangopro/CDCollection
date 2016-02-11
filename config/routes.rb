CDCollection::Application.routes.draw do
  devise_for :users
  root :to=>"home#index"
  resources :ratings, only: :update
  #resources :users
  resources :ligneliste, only: :create

  get "profil/show"
  get "profil/collection"
  get "profil/wantlist"


  get "ratings/update"
  get "artiste/index"

  get "profil" => "profil#show"
  get "collection" => "profil#collection"
  get "plus_tard" => "profil#wantlist"

  get "fiche_artiste" => "artiste#fiche"

  post "suppRating" => "profil#suppRating"
  post "changerListe" => "profil#changerListe"

  delete "supprimerListe" => "ligneliste#destroy"


end
