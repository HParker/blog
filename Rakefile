require 'rake'
require 'shellwords'

source_files = Rake::FileList.new("posts/**/*.md")

task default: :compile
task compile: source_files.ext('.html')

rule '.html' => '.md' do |t|
  sh "pandoc -s --highlight-style pygments -c /pandoc.css --toc -o #{t.name.shellescape} #{t.source.shellescape}"
end

task :publish do
  sh "rsync -vz posts/*.html adam@ocean:~/blog/posts/"
end
