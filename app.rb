require 'bundler'
Bundler.require
require_relative 'models/sodb.rb'

module SpunoutAPI

  class App < Sinatra::Base
  
    sodb = SoDB.new

    helpers do
      def nearme?(my_lat, my_long, check_lat, check_long, threshold, unit)
        threshold ||= 10
        unit ||= :miles
        GeoKit::default_units = unit
        my = GeoKit::GeoLoc.new :lat => my_lat, :lng => my_long
        check = GeoKit::GeoLoc.new :lat => check_lat, :lng => check_long
        my.distance_to(check) <= threshold
      end
    end
  
    get '/' do
      content_type :json
      { error: [ { message: "Visit V1 of the API at /v1/", code: 404 } ] }.to_json
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
      { services: result }.to_json
    end
    
    get '/v1/search/:term' do
      content_type :json
      fz = FuzzyMatch.new(sodb.query(""))
      result = fz.find_all(params[:term])
      { count: result.count, services: result }.to_json
    end

    get '/v1/search/by_category/:term' do
      content_type :json
      result = sodb.find_by_category(params[:term])
      { count: result.count, services: result }.to_json
    end

    get '/v1/categories' do
      content_type :json
      result = sodb.categories
      { count: result.count, categories: result }.to_json
    end

    get '/v1/categories/search/:term' do
      content_type :json
      fz = FuzzyMatch.new(sodb.categories)
      result = fz.find_all(params[:term])
      { count: result.count, categories: result}.to_json
    end

    get '/v1/nearme' do 
      content_type :json
      
      unless params.has_key? "latitude" and params.has_key? "longitude"
        return { error: [{message: "Client must provide latitude and longitude entries in query string", code: 400}] }.to_json
      end
      result = sodb.query("")
      result = result.select do |row|
        nearme?(params["latitude"].to_f, params["longitude"].to_f, row[:address][:latitude], row[:address][:longitude], params["threshold"] && params["threshold"].to_i, params["unit"] && params["unit"].to_sym)
      end
      return { count: result.count, services: result }.to_json
    end
  end
end
