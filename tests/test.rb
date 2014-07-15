ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative '../events.rb'
 
include Rack::Test::Methods
 
def app
  Sinatra::Application
end

describe "remove... temporary test" do
  it "should say hello" do
    get '/'
    last_response.body.must_equal "hello"
  end
end
