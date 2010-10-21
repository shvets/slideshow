# To use with thin 
#  thin start -p PORT -R config.ru
require File.join(File.dirname(__FILE__), 'lib', 'slideshow')

#trap(:INT) { exit }

app = Rack::Builder.new {
 use Rack::CommonLogger
 run Slideshow::App
}.to_app

run app


