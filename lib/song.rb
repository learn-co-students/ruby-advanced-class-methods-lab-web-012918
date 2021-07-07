require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name.downcase }
  end

  def self.new_from_filename(filename)
    song_title = filename.split(' - ')[1].chomp('.mp3')
    artist = filename.split(' - ')[0]
    new_song = self.create_by_name(song_title)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    song_title = filename.split(' - ')[1].chomp('.mp3')
    artist = filename.split(' - ')[0]
    @new_song = self.create_by_name(song_title)
    @new_song.artist_name = artist
    @new_song.save
  end

  def self.destroy_all
    @@all = []
    @@all
  end



end
