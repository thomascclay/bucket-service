require 'sinatra'

get '/' do
    '<p style="color:red">Hello Brandon</p>'
end

get '/add2/:num' do
    "that number is #{params[:num]}"
end


