get "/album-main" do
  erb :"/main/album-main"
end

get "/album-view" do
  @album = Album.all
  erb :"/album/view"
end

get "/album-add" do
  erb :"/album/add"
end

get "/album-to-database" do
  add_hash = {"title": "#{params["album"]["title"]}"}
  
  a = Album.add(add_hash)
  
  if a.save
    erb :"/success/success"
  else
    @errors = a.errors.messages
  end
  
end

get "/album-edit" do
  @album = Album.all
  erb :"/album/edit"
end

get "/edit-album-in-database" do
  album_to_edit = Album.find(params["album"]["id"])
  
  album_to_edit.title = params["album"]["title"]
  
  if album_to_edit.save
    erb :"/success/success"
  else
    @errors = album_to_edit.errors.messages
    erb :"/failure/failure"
  end
  
end

get "/album-delete" do
  @album = Album.all
  erb :"/album/delete"
end

get "/album-delete-action" do
  Album.delete(params["album"]["id"])
  erb :"/success/success"
end