module Models
  class Post
    attr_reader :name, :time
    def self.all
      Dir['posts/**/*.html'].map { |post| new(post) }
    end
    def initialize(file_path)
      @name = File.basename(file_path, '.html')
      @time = File.atime(file_path)
    end
  end
end
