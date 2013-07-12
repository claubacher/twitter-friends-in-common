get '/play' do
  erb :play  
end

post '/play' do
  client = Twitter::Client.new(:oauth_token => current_user.token,
                               :oauth_token_secret => current_user.secret)
  
  @user1 = params[:user1]
  @user2 = params[:user2]

  @mutuals = mutuals?(client, @user1, @user2)
  @shared = shared(client, @user1, @user2)

  erb :results, :layout => false
end