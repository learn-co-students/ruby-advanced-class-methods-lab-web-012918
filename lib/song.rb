require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.uniq.sort_by {|song| song.name}
    #binding.pry
  end

  def self.new_from_filename(file)
    song = Song.new
    array = file.split(" - ")
    song_name = array[1].chomp(".mp3")
    artist_name = array[0]
    #binding.pry
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    song = Song.new
    array = file.split(" - ")
    song_name = array[1].chomp(".mp3")
    artist_name = array[0]
    #binding.pry
    song.name = song_name
    song.artist_name = artist_name
    @@all << song
    song
  end


  def self.destroy_all
    self.all.clear
  end


  def save
    self.class.all << self
  end

end
