class LignelisteController < ApplicationController

  def create
    session[:return_to] ||= request.referer
    @elementListe = LigneListe.new
    @elementListe.typeListe = params[:typeListe]
    @elementListe.album_id = params[:album_id]
    @elementListe.user_id = params[:user_id]

    if @elementListe.save
      redirect_to session.delete(:return_to)
    end
  end

  def destroy
    session[:return_to] ||= request.referer
    @liste = LigneListe.where(:album_id => params[:id_album], :user_id => params[:id_user], :typeListe => params[:typeListe]).first
    @liste.destroy
    redirect_to session.delete(:return_to)
  end

end
