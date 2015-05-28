enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/sign_up' do
  @user = User.create(params["user"])

  redirect to("/login")
end

get '/login' do
  erb :login
end

post '/login' do
  # byebug
  @user = User.authenticate(params["user"]["email"], params["user"]["password"])
  # byebug
  if @user
    session[:id] = @user.id

    redirect to "/secret_page"
  else
    redirect to("/login")
  end
end

get '/secret_page' do
  if session[:id].nil?
    redirect to '/'
  else
    erb :secret_page
  end
end

delete '/logout' do
  session[:id] = nil
  redirect to '/'
end