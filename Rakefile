require "rubygems"
require 'rake'

desc "Automatically generate site at localhost:4000"
task :dev do
  system "jekyll serve --watch"
end

desc "Remove _site from directory before committing"
task :clean do
  system "rm -r _site"
end

desc "Remove _site from directory before committing"
task :index do
  system "./create_index.sh && mv _contents-index.html _includes/"
end

