class ProfilController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @rating = Rating.where(:user_id => current_user.id).where.not(:rating => 0).order(rating: :desc)
    @collection =  LigneListe.where(:user_id => current_user.id, :typeListe => 1).all
    @plustard = LigneListe.where(:user_id => current_user.id, :typeListe => 2).all
  end

  def collection
    @liste = LigneListe.where(:user_id => current_user.id, :typeListe => 1).joins(:album).order("albums.name").all
  end

  def wantlist
    @liste = LigneListe.where(:user_id => current_user.id, :typeListe => 2).joins(:album).order("albums.name").all
  end

  def suppRating
    session[:return_to] ||= request.referer
    @rating = Rating.find(params[:id])
     @rating.update_attributes(rating: 0)
    redirect_to session.delete(:return_to)
  end

  def changerListe
    session[:return_to] ||= request.referer
    @liste = LigneListe.find(params[:id])
    @liste.update_attributes(typeListe: 1)
    redirect_to session.delete(:return_to)
  end
end
