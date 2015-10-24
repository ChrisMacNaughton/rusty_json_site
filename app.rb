require 'rubygems'
require 'sinatra'
require 'rusty_json'
require 'cgi'
require 'erb'

get '/' do
  erb :index, layout: :application
end

post '/' do
  json = params[:json]
  @rusty = CGI::escapeHTML(RustyJson.parse(json))
  erb :rust, layout: :application
end