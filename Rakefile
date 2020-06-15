require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :build do
  system "gem build slidr.gemspec"
end

task :install do
  system "gem install slidr-#{ Slidr::VERSION }.gem"
end

task :push do
  system "gem push slidr-#{ Slidr::VERSION }.gem"
end

task :exec do
  # system './bin/slidr'
  system './examples/example04'
end

task :full => [:build, :rspec, :install, :exec]

























