require 'sinatra'
require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/json'
# require 'sinatra/respond_with'
require 'pry'
require 'pony'
require 'twitter'
require 'thin'


class Hunter < Sinatra::Base
  register Sinatra::ConfigFile

  set :server, %w(webrick mogrel unicorn)
  set :environment, :development
  set :logging, true
  set :port, ENV['PORT']

  config_file './config.yml'

  before '/' do
    @tw = Twitter::REST::Client.new do |config|
      config.consumer_key        = settings.twitter_consumer_key
      config.consumer_secret     = settings.twitter_consumer_secret
      config.access_token        = settings.twitter_access_token
      config.access_token_secret = settings.twitter_access_secret
    end
  end

  # before '/music' do
  #   @lastfm = Lastfm.new(settings.lastfm_api_key, settings.lastfm_api_secret)
  #   @scloud = Soundcloud.new(:client_id => settings.soundcloud_client_id)
  # end

  get '/' do
    erb :prophecies
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
