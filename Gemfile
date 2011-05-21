# For more information on bundler, please visit http://gembundler.com
## Dependencies in this Gemfile are managed through the gemspec. Add/remove
## depenencies there, rather than editing this file
#
#require 'pathname'
#NAME = 'swing'
#BASE_PATH = Pathname.new(__FILE__).dirname
#GEMSPEC_PATH = BASE_PATH + "#{NAME}.gemspec"
#
## Setup gemspec dependencies
#gemspec = eval(GEMSPEC_PATH.read)
#gemspec.dependencies.each do |dep|
#  group = dep.type == :development ? :development : :default
#  gem dep.name, dep.requirement, :group => group
#end
#gem(gemspec.name, gemspec.version, :path => BASE_PATH)

source :gemcutter

group :test do # Group for testing code on Windows (win, win_gui)
  gem 'rspec', '~>2.6.0', :require => ['rspec', 'rspec/autorun']
end

