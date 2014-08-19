require 'sinatra'
require 'pp'
require 'json'

buckets = Hash.new
buckets['z'] = Array.new

get '/' do
    'Hello Brandon'
end

post '/startgame/:bucketid' do |b|
    puts "creating new bucket #{b}"
    buckets[b] = Array.new
end

delete '/endgame/:bucketid' do |b|
    buckets[b] = Array.new
end

post '/submit/:bucketid' do
    puts "Submit was hit for bucket #{params[:bucketid]}"
    bucket = buckets[params[:bucketid]]
    params.each do |key, val|
        puts "#{key}:#{val}"
        if key.start_with?("phrase")
            bucket.push(val)
        end
    end
    puts "bucket[#{params[:bucketid]}] = "
    pp bucket
    puts "end"
end

get 'buckets/:bucketid/' do
    puts "Getting bucket #{params[:bucketid]}"
    buckets[params[:bucketid]].to_json
end