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

task :deploy do
  sh "ssh adam@ocean '(cd blog; rake server:deploy)'"
end

namespace :server do
  task deploy: [:update_code, :kill_unicorns, :start_unicorns]

  task :update_code do
    sh "git pull"
  end

  task :kill_unicorns do
    sh "cat tmp/pids/unicorn.pid | xargs kill"
  end

  task :start_unicorns do
    sh "unicorn -c ./unicorn.rb -E production -D"
  end
end
