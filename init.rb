ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require "rubygems"

begin
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  require "rubygems"
  require "bundler"
  Bundler.require
end

require "monk/glue"
require "json"
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'dm-timestamps'
require 'haml'

class Main < Monk::Glue
  set :app_file, __FILE__
  use Rack::Session::Cookie,
                      :key => 'rack.session',
                      :domain => 'foo.com',
                      :path => '/',
                      :expire_after => 2592000,
                      :secret => 'change_me'
end

# Load all application files.
Dir[Monk::Glue::root_path("app/**/*.rb")].each do |file|
  require file
end

# Connect to sqlite3.
sqlite3_path = Monk::Glue::settings(:sqlite3)[:database]
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/#{sqlite3_path}")


Main.run! if Main.run?
