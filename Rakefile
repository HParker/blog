require 'rake'

files = Rake::FileList.new("posts/**/*.md")

task default: :html
task html: files.ext('.html')

rule '.html' => '.md' do |t|
  sh "pandoc -o #{t.name} #{t.source}"
end
