class RatingsController < ApplicationController
  def update
    @rating = Rating.find(params[:id])

    @album = @rating.album
    if @rating.update_attributes(rating: params[:rating])
      respond_to do |format|
        format.js
      end
    end
  end

end
