require 'bundler'
Bundler::GemHelper.install_tasks
Bundler.setup

require 'rspec/core/rake_task'
require 'office_clerk/testing_support/common_rake'

RSpec::Core::RakeTask.new

task default: [:spec]

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'post_clerk'
  Rake::Task['common:test_app'].invoke
end
