class Require
  class << self
    def require_directory(directory)
      directory = '../' + directory.partition('../').last
      Dir[File.dirname(__FILE__) + '/' + directory + '/*'].each do |sub_directory|
        require sub_directory if !File.directory?(sub_directory)
        require_directory(sub_directory) if File.directory?(sub_directory)
      end
    end
  end
end