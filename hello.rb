require 'sinatra'
require 'pp'

bucket = Array.new

get '/' do
    'Hello Brandon'
end

get '/whatnum/:num' do
    "that number is #{params[:num]}"
end

post '/submit' do
    puts "Submit was hit"
    params.each do |key, val|
        puts "#{key}: #{val}"
        bucket.push(val)
    end
    puts "bucket = "
    pp bucket
    puts "end"
end
