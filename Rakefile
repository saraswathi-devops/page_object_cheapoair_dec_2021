require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end
Cucumber::Rake::Task.new(:rake_cheapoair_smoke) do |t|
  t.profile = 'smoke'
end

task :default => :features