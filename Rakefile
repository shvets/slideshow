require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'bundler'
  
  begin
    require 'jeweler'
    Jeweler::Tasks.new do |gemspec|
      gemspec.name = "slideshow"
      gemspec.summary = "Opens list of image files as slideshow in browser's window."
      gemspec.description = "Opens list of image files as slideshow in browser's window."
      gemspec.email = "alexander.shvets@gmail.com"
      gemspec.homepage = "http://github.com/shvets/slideshow"
      gemspec.authors = ["Alexander Shvets"]
      gemspec.files = FileList["CHANGES", "slideshow.gemspec", "Rakefile", "README", "VERSION", 
        "lib/**/*", "bin/**", "public/**", "views/**"]
    
      gemspec.executables = ['slideshow']
      gemspec.requirements = ["none"]
      gemspec.bindir = "bin"
    
      gemspec.add_bundler_dependencies
    end
  rescue LoadError
    puts "Jeweler not available. Install it s with: [sudo] gem install jeweler"
  end
rescue LoadError
  puts "Bundler not available. Install it s with: [sudo] gem install bundler"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test
