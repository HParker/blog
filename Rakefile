require 'rake'
require 'shellwords'

article_files = Rake::FileList.new("posts/**/*.md")
slide_files = Rake::FileList.new("slides/**/*.md")

task default: :compile
namespace :compile do
  task all: [:articles, :slides]
  task articles: article_files.ext('.html')
  task slides: slide_files.ext('.html')

  rule '.html' => '.md' do |t|
    sh "pandoc -s --highlight-style pygments -c /pandoc.css --toc -o #{t.name.shellescape} #{t.source.shellescape}"
  end
end


namespace :publish do
  task all: [:articles, :slides]

  task :articles do
    sh "rsync -vz posts/*.html adam@ocean:~/blog/posts/"
  end

  task :slides do
    sh "rsync -vz slides/*.html adam@ocean:~/blog/slides/"
  end
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
