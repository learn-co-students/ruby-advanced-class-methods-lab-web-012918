require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    # self.create
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    # song.save <<THIS IS WHAT NEXT METHOD IS TESTING FOR
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
    title = file_name.gsub('.mp3', "").split(' - ')[1]
    artist = file_name.gsub('.mp3', "").split(' - ')[0]
    song = self.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    title = file_name.gsub('.mp3', "").split(' - ')[1]
    artist = file_name.gsub('.mp3', "").split(' - ')[0]
    song = create_by_name(title)
    song.artist_name = artist
  end


  def self.destroy_all
    @@all.clear
  end


  

end
