class ArtisteController < ApplicationController
  before_action :authenticate_user!
  def index
    @artistes = Artiste.search(params[:search])
  end

  def fiche
    @artiste =  Artiste.find(params[:id])
    @albums = Album.find(:all, :conditions => ["artiste_id = ? AND typeAlbum = ?", @artiste.id, 1], :order => 'anneeSortie DESC')
    @eps = Album.find(:all, :conditions => ["artiste_id = ? AND typeAlbum = ?", @artiste.id, 2], :order => 'anneeSortie DESC')
  end

end
