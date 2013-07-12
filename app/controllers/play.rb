get '/play' do
  erb :play  
end

post '/play' do
  client = Twitter::Client.new(:oauth_token => current_user.token,
                               :oauth_token_secret => current_user.secret)
  @mutuals = mutuals?(client, params[:user1], params[:user2])
  @shared = shared(client, params[:user1], params[:user2])
  @user1 = params[:user1]
  @user2 = params[:user2]
  erb :play
end

def mutuals?(client, handle1, handle2)
  client.friendship?(handle1, handle2) && client.friendship?(handle2, handle1)
end

def shared(client, handle1, handle2)
  ids = client.friend_ids(handle1).all & client.friend_ids(handle2).all
  ids.map { |id| client.user(id).handle }
end