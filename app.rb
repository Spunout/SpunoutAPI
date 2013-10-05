require 'bundler'
Bundler.require
require_relative 'models/sodb.rb'

module SpunoutAPI

  class App < Sinatra::Base
  
    sodb = SoDB.new
  
    get '/' do
      content_type :json
      { error: [ { message: "Vist V1 of the API at /v1/", code: 404 } ] }.to_json
    end
    
    not_found do
      { error: [ { message: "This method does not exists", code: 404 } ] }.to_json
    end
    
    get '/v1' do
      content_type :json
      page = params["page"].to_i
      result = sodb.page(page)
      { total: 2083, page: page, count: result.count, total_pages: 42, services: result}.to_json
    end
    
    get '/v1/service/:id' do
      content_type :json
      result = sodb.find_by_id(params[:id])
      { services: result}.to_json
    end
    
    get '/v1/search/:term' do
      content_type :json
      result = sodb.find(params[:term])
      { services: result}.to_json
    end

    get '/v1/categories' do
      content_type :json
      result = sodb.categories
      { count: result.count, categories: result }.to_json
    end
  end
end