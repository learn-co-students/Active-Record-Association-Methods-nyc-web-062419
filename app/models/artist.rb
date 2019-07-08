class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    Song.all.first.genre
  end

  def song_count
    #return the number of songs associated with the artist
    Song.all.select { |song| song.artist == self }.count
  end

  def genre_count
    #return the number of genres associated with the artist
    Song.all.select { |song| song.artist == self }.uniq { |song| song.genre_id }.count
  end
end
