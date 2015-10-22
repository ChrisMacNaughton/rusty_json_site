require 'rubygems'
require 'sinatra'
require 'rusty_json'
require 'erb'

get '/' do
  erb :index, layout: :application
end

post '/' do
  json = params[:json]
  @rusty = RustyJson.parse(json)
  erb :rust, layout: :application
end