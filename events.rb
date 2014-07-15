require 'sinatra'
require 'sinatra/activerecord'
require 'haml'

set :database, "sqlite3:reg.db"

#setup activerecord class

# probably has too many methods. You might want to cut down some of the possibilities that the admin has.

get '/' do
  # brief description among other things.
  "hello"
end

get '/events' do
  # list all events
end

get '/events/categories' do
  # list all categories
end

get '/events/categories/:category' do
  # list events in this category
end

post '/events' do
  # admins get to make new events
end

put '/events/:id' do
  # admins get to edit events as well
end

delete '/events' do
  # and delete them
end

get '/events/search/:query' do
  # provide a search feature.
end

get '/events/:id' do
  # get particular event
end

post '/categories' do
  # create a new category. Is this necessary? Or do we just parse all events and make up a list of categories on the fly?
end

put '/categories/:category' do
  # edit that category. Is this necessary? Just delete, remake? Depends on what is done with post '/categories'
end

delete '/categories/:category' do
  # delete a particular category (and remove all references to it?)
end

get '/volunteers/:volunteer' do
  # see details of particular volunteer. Auth reqd.
end

post '/volunteers' do
  # make a new volunteer
end

put '/volunteers/:volunteer' do
  # edit volunteer details
end

delete '/volunteers/:volunteer' do
  # delete the volunteer (DO NOT REMOVE DATA, might lead to discrepancies)
end
