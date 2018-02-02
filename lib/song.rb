require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize

  end

  def self.create
    # @@all << self.new
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name= name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name= name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{ |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    # binding.pry
    hash = {}
    @@all.each{ |song|
      hash[song.name] = song
    }
    Hash[hash.sort].values
  end

  def self.new_from_filename(filename)

    song = self.new_by_name(filename.split(" - ")[1][0...-4])
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create_by_name(filename.split(" - ")[1][0...-4])
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end
