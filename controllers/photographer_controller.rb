get "/photographer-main" do
  erb :"/main/photographer-main"
end

get "/photographer-view" do
  @photographer = Photographer.all
  erb :"/photographer/view"
end

get "/photographer-add" do
  erb :"/photographer/add"  
end

get "/photographer-edit" do
  erb :"/photographer/edit"  
end

get "/photographer-delete" do
  erb :"/photographer/delete"  
end