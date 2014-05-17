class Artiste < ActiveRecord::Base
  def self.search(search)
    if search
      find(:all, :order => 'nom', :conditions => ['lower(nom) LIKE ?', "%#{search}%".downcase])
    else
      Artiste.order("nom").all
    end
  end
end
