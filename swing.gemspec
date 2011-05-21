# Gemspecs should not be generated, but edited directly.
# Refer to: http://yehudakatz.com/2010/04/02/using-gemspecs-as-intended/

Gem::Specification.new do |gem|
  gem.name        = "swing"
  gem.version     = File.open('VERSION').read.strip # = ::Swing::VERSION # - conflicts with Bundler
  gem.summary     = "FIXME: New project swing"
  gem.description = "FIXME: New project swing"
  gem.authors     = ["arvicco"]
  gem.email       = "arvitallian@gmail.com"
  gem.homepage    = "http://github.com/arvicco/swing"
  gem.platform    = Gem::Platform::RUBY
  gem.date        = Time.now.strftime "%Y-%m-%d"

  # Files setup
  versioned         = `git ls-files -z`.split("\0")
  gem.files         = Dir['{bin,lib,man,spec,features,tasks}/**/*', 'Rakefile', 'README*', 'LICENSE*',
                      'VERSION*', 'CHANGELOG*', 'HISTORY*', 'ROADMAP*', '.gitignore'] & versioned
  gem.executables   = (Dir['bin/**/*'] & versioned).map{|file|File.basename(file)}
  gem.test_files    = Dir['spec/**/*'] & versioned
  gem.require_paths = ["lib"]

  # RDoc setup
  gem.has_rdoc = true
  gem.rdoc_options.concat %W{--charset UTF-8 --main README.rdoc --title swing}
  gem.extra_rdoc_files = ["LICENSE", "HISTORY", "README.rdoc"]
    
  # Dependencies
  gem.add_development_dependency("rspec", [">= 2.0.0"])
  gem.add_development_dependency("cucumber", [">= 0"])
  gem.add_dependency("bundler", [">= 1.0.0"])

  # gem.rubyforge_project = ""
  # gem.rubygems_version  = `gem -v` # - Seems to conflict with Bundler
  # gem.required_rubygems_version = ">= 1.3.6"
end