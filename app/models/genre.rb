class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
    # return the number of artists associated with the genre
    Song.all.select { |artti| artti.genre == self }.uniq { |song| song.artist_id }.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    Song.all.select { |artti| artti.genre == self }.uniq { |song| song.artist_id }.map { |song| song.artist.name }
  end
end
