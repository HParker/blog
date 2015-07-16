require 'rake'

source_files = Rake::FileList.new("posts/**/*.md")

task default: :compile
task compile: source_files.ext('.html')

rule '.html' => '.md' do |t|
  sh "pandoc -s --highlight-style pygments -o  #{t.name} #{t.source}"
end

task :publish do
  sh "rsync -vz posts/*.html adam@ocean:~/blog/posts/"
end
