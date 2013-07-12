get '/' do
  erb :index
end

get '/login' do
  redirect request_token.authorize_url
end

get '/logout' do
  session.clear
  redirect '/'
end