get '/auth' do
  # the 'request_token' method is defined in 'app/helpers/oauth.rb'
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  handle = @access_token.params[:screen_name]
  token  = @access_token.token
  secret = @access_token.secret

  # create user account and store the access token and secret
  user = User.find_or_create_by_handle(:handle => handle,
                                       :token  => token, 
                                       :secret => secret)

  session[:user_id] = user.id
  
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session.delete(:request_token)
  
  redirect '/play'
end