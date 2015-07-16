get "/home" do
  if session[:user_id]
  else
    redirect "/login"
  end
end

get "/login" do
  erb :"/main/login"
end

get "/login-validation" do
  
end

get "/mainpage" do
  
end
