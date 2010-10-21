require 'rubygems' unless RUBY_VERSION =~ /1.9.*/

require 'sinatra/base'
require 'haml'
require 'sass'

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__))))

module Slideshow
  class App < Sinatra::Base
    set :haml, {:format => :html5, :attr_wrapper => '"'}
    set :views, "#{File.expand_path(File.dirname(__FILE__))}/../../views"
    set :public, "#{File.expand_path(File.dirname(__FILE__))}/../../public"

#   get '/javascripts/*' do
#     open("#{File.dirname(__FILE__)}/../public/javascripts/#{params[:splat]}")
#   end

    get '/stylesheet.css' do
      headers 'Content-Type' => 'text/css; charset=utf-8'
      sass :stylesheet
    end

    get '/images/*' do
      if(params[:splat][0][-4..-1] == '.jpg')
        headers 'Content-Type' => 'image/jpeg'
        open("#{Dir.pwd}/images/#{params[:splat][0]}")
      else
        nil
      end
    end

    get '/' do
      haml :index, :locals => {:images => collect_images}
    end

    def collect_images
      images = []
      dir = "images"

      Dir[dir + "/**/*.*"].each do |name|
        images << name
      end

      images
    end
  end
end

