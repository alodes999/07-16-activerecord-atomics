# get "/home" do
#   if session[:user_id]
#     redirect "/mainpage"
#   else
#     redirect "/login"
#   end
#
# end
get "/" do
  session["id"] = nil
  erb :"/main/login"
end

get "/login" do
  erb :"/main/login"
end

get "/logintype" do
  if !params["login"].include?("newuser")
    erb :"/main/loginform"
  else
    erb :"/main/newuserform" 
  end
end


get "/login-validation" do
  array = User.where("name" => params["login"]["username"])
  
  if array == []
    @errors = "Login Failed."
    return erb :"main/loginform"
  end
  
  user = array[0]
  
  if user.valid_password?(params["login"]["password"])
    session[:id] = user.id
    return erb :"main/home"
  else
    @errors = user.errors.messages["login"]
    erb :"main/loginform"
  end
  
end

get "/home" do
  if session[:id] = nil
    redirect "/login"
  else
    erb :"main/home"
  end
end


get "/add-user" do
  password = BCrypt::Password.create(params["login"]["password"])
  username = params["login"]["username"]
  
  newuser = User.new("name": username, "password": password)
  
  if newuser.valid?
    newuser.save
    session[:id] = user.id
    redirect "/home"
  else
    @errors = newuser.errors.messages
    return erb :"/main/newuserform"
  end
  
end