get "/albumphoto-main" do
  erb :"/main/albumphoto-main"
end

get "/albumphoto-view" do
  erb :"/albumphoto/view"
end

get "/albumphoto-add" do
  @photo = Photo.all
  @album = Album.all 
  erb :"/albumphoto/add"
end

get ""

get "/albumphoto-edit" do
  erb :"/albumphoto/edit"
end

get "/albumphoto-delete" do
  erb :"/albumphoto/delete"
end