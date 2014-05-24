class Album < ActiveRecord::Base
  has_many :ratings
  has_many :ligne_listes
  belongs_to :artiste
  def get_rating(id_album, id_user)
    @rating = Rating.where(album_id: id_album, user_id: id_user).first
    unless  @rating
      @rating = Rating.create(album_id: id_album, user_id: id_user, rating: 0)
    end
    return @rating
  end


  def average_rating(id_album)
    @rating = Rating.where(album_id: id_album)
    if @rating.size != 0
      @rating.sum(:rating) / @rating.size
    else
      0
    end
  end
end
