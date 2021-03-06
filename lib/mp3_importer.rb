class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir["#{self.path}/**/*.mp3"].collect {|file| file.gsub("#{self.path}/", "")}
  end


  def import
    self.files.each{|f| Song.new_by_filename(f)}
  end

end
