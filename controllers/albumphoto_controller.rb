get "/albumphoto-main" do
  erb :"/main/albumphoto-main"
end

get "/albumphoto-view-album" do
  @album = Album.all
  erb :"/albumphoto/view"
end

get "/albumphoto-picked-album" do
  album = Album.find(params["albumphoto"]["id"])
  @list_of_pics = album.photos
  
  @title = album.title
  erb :"albumphoto/viewpics"
end

get "/albumphoto-add" do
  @photo = Photo.all
  @album = Album.all 
  erb :"/albumphoto/add"
end

get "/add-to-bridge-table" do
  album_to_merge = Album.find(params["album"]["id"])
  photo_to_merge = Photo.find(params["photo"]["id"])
  
  album_to_merge.photos << photo_to_merge
  
  erb :"/success/success"
end

get "/albumphoto-edit" do
  erb :"/albumphoto/edit"
end

get "/albumphoto-delete" do
  erb :"/albumphoto/delete"
end