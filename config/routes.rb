CDCollection::Application.routes.draw do
  get "artiste/index"
  root :to=>"home#index"

  get "sign_in" => "authentication#sign_in"
  get "signed_out" => "authentication#signed_out"
  get "change_password" => "authentication#change_password"
  get "forgot_password" => "authentication#forgot_password"
  get "new_user" => "authentication#new_user"
  get "password_sent" => "authentication#password_sent"

  get "fiche_artiste" => "artiste#fiche"

  post "sign_in" => "authentication#login"
  post "new_user" => "authentication#register"

end
