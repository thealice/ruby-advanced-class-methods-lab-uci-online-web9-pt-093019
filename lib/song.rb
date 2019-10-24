require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@artists = []
  @@names = []
  def self.create
    song = self.new
    self.all << song
    song
  end
  def self.all
    @@all
  end
  def save
    self.class.all << self
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by {|song_instance| song_instance.name}
  end
  def self.new_from_filename(filename)
    song = self.new
    song_array = filename[/[^.]+/].split(" - ")
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  def self.create_from_filename(filename)
    song = self.new #if I use self.create here will it save the instance to 
    # @@all without associated song.name and song.artist_name? 
    song_array = filename[/[^.]+/].split(" - ") #this won't work if there is a - in the song name
    # but if i target the .mp3 it won't work with other file types
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song.save
  end
  def self.destroy_all
    self.all.clear
  end

end
