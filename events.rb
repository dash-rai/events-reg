require 'sinatra'
require 'sinatra/activerecord'
require 'haml'

set :database, "sqlite3:reg.db"

class Event < ActiveRecord::Base
  validates :name, presence: true
end

class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :events
end

before do
  content_type :json
end

get '/' do
  # brief description among other things.
  { message: "hello" }.to_json
end

get '/events' do
  # list all events
  @events = Event.order(name: :asc)
  @events.to_json
end

get '/events/categories' do
  # list all categories
  Category.order(name: :asc).to_json
end

get '/events/categories/:category' do
  # list events in this category
  Event.where(category_id: params[:category]).to_json
end

post '/events' do
  # admins get to make new events
  data = params[:post]          # get all the parameters
  Event.new(data).save.to_s     # returns true is save to database works, else false.
end

put '/events/:id' do
  # admins get to edit events as well
  event = Event.find(params[:id])
  begin
    event.update(params[:post])
  rescue => e
    e.message.to_json
  end
end

delete '/events/:id' do
  # and delete them
end

get '/events/search/:query' do
  # provide a search feature.
end

get '/events/:id' do
  # get particular event
  Event.find(params[:id]).to_json
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
