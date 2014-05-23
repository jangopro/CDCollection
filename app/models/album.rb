class Album < ActiveRecord::Base
  has_many :ratings
  belongs_to :artiste
  def get_rating(id_album, id_user)
    @rating = Rating.where(album_id: id_album, user_id: id_user).first
    unless  @rating
      @rating = Rating.create(album_id: id_album, user_id: id_user, rating: 0)
    end
    return @rating
  end


  def average_rating
    if ratings.size != 0
      #ratings.sum(:rating) / ratings.size
    else
      0
    end
  end
end
