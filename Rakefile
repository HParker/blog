require 'rake'

source_files = Rake::FileList.new("posts/**/*.md")
compiled_files = Rake::FileList.new("posts/**/*.html")

task default: :compile
task compile: source_files.ext('.html')

rule '.html' => '.md' do |t|
  sh "pandoc -o #{t.name} #{t.source}"
end

task :publish do
  sh ""
end
