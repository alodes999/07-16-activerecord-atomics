# get "/home" do
#   if session[:user_id]
#     redirect "/mainpage"
#   else
#     redirect "/login"
#   end
#
# end

get "/login" do
  erb :"/main/login"
end

get "/login-validation" do
  
end

get "/home" do
  erb :"/main/home"
end


get "/add-user" do
  
end