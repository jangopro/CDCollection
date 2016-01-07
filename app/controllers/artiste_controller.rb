class ArtisteController < ApplicationController
  def index
    @artistes = Artiste.search(params[:search])
    redirect_to fiche_artiste_path(:id => 1) if @artistes.size == 1
  end

  def fiche
    @artiste =  Artiste.find(params[:id])
    @albums = Album.find(:all, :conditions => ["artiste_id = ? AND typeAlbum = ?", @artiste.id, 1], :order => 'anneeSortie DESC')
    @eps = Album.find(:all, :conditions => ["artiste_id = ? AND typeAlbum = ?", @artiste.id, 2], :order => 'anneeSortie DESC')
  end

end
