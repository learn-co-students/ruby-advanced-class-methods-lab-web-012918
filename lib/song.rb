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
    self.all << song
    song
  end


  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.new
    song.name = title
    self.all << song
    song
  end

  def self.find_by_name(title)
    self.all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    split = filename.split("-")
    artist_name = split[0].strip
    song_title = split[1].split(".")
    song = self.new_by_name(song_title[0].strip)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split = filename.split("-")
    artist_name = split[0].strip
    song_title = split[1].split(".")
    song = self.create_by_name(song_title[0].strip)
    song.artist_name = artist_name
    song
    #binding.pry
  end
  def self.destroy_all
    self.all.clear
  end
end
