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

get "/login-validation" do
  
end

get "/home" do
  erb :"/main/home"
end


get "/add-user" do
  
end