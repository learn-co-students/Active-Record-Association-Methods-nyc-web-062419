class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    find_drake = Artist.find_by(name: "Drake")
    if find_drake
      self.artist = find_drake
    else
      create_drake = Artist.create(name:"Drake")
      self.artist = create_drake 
    end
  end
end