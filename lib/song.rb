require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

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

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(title)
    song = Song.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    song = nil
    @@all.each do |s|
      # binding.pry
      if s.name == title
        song = s
      end
    end
    song
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
       song = self.find_by_name(title)
     else
       song = self.create_by_name(title)
     end
     song
   end

   def self.alphabetical
     @@all.sort_by {|s| s.name}
   end

   def self.new_from_filename(filename)
     filename = filename.split(" - ")
     song = self.new_by_name(filename.last.chomp('.mp3'))
     song.artist_name = filename.first
     song
   end

   def self.create_from_filename(filename)
     filename = filename.split(" - ")
     song = self.create_by_name(filename.last.chomp('.mp3'))
     song.artist_name = filename.first
     song
   end

   def self.destroy_all
     @@all.clear
   end

end
