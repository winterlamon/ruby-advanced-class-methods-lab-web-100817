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
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(song)
      if self.find_by_name(song) == nil
        self.create_by_name(song)
      else
        self.find_by_name(song)
      end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    file_format_array = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = file_format_array[1]
    song.artist_name = file_format_array[0]
    return song
  end

=begin HELPER METHOD - SORT OF...

def filename_to_song_artist_format(filename)
  filename.chomp(".mp3").split(" - ")
  artist_name = filename[0]
  name = filename[1]
end

=end

  def self.create_from_filename(filename)
    file_format_array = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = file_format_array[1]
    song.artist_name = file_format_array[0]
    song.save
    return song
  end

  def self.destroy_all
    self.all.clear
  end

end
