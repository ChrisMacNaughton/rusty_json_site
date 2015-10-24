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
  begin
    JSON.parse(json)
  rescue
    @alert = "You submitted badly formatted JSON, please try again!"
    return erb :index, layout: :application
  end
  @rusty = CGI::escapeHTML(RustyJson.parse(json))
  erb :rust, layout: :application
end