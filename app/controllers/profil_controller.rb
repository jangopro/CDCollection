class ProfilController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rating = Rating.where("rating != 0").order(rating: :desc)
  end

  def collection

  end

  def wantlist
  end
end
