class ArtisteController < ApplicationController
  def index
    @artistes = Artiste.search(params[:search])
  end

  def fiche
    @artiste =  Artiste.find(params[:id])
    @albums = Album.find(:all, :conditions => ["id_artiste = ? AND typeAlbum = ?", @artiste.id, 1])
    @eps = Album.find(:all, :conditions => ["id_artiste = ? AND typeAlbum = ?", @artiste.id, 2] )
  end

end
