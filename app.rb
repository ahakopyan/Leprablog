#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:leprablog.db"

class Post < ActiveRecord::Base 
end

class Comment < ActiveRecord::Base 
end

get '/' do
	@posts = Post.all 
	erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  content = params[:content]

  if content.length <= 0
  	@error = 'Type post text'
  	return erb :new
  end

  erb "You taped #{content}"
end