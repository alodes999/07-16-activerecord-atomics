get "/photo-main" do
  erb :"/main/photo-main"
end

get "/photo-view" do
  @photo = Photo.all
  erb :"/photo/view"
end

get "/photo-add" do
  erb :"/photo/add"
end

get "/photo-to-database" do
  add_hash = {"name": "#{params["photographer"]["name"]}", "cameratype": "#{params["photographer"]["cameratype"]}", "employer": "#{params["photographer"]["employer"]}"}
  
  a = Photo.add(add_hash)
  
  if a.save
    erb :"/success/success"
  else
    @errors = a.errors.messages
  end
  
end
 
get "/photo-edit" do
  @photo = Photo.all
  erb :"/photo/edit"
end

get "/edit-photo-in-database" do
  photo_to_edit = Photo.find(params["photo"]["id"])
  
  photo_to_edit.title = params["photo"]["title"]
  photo_to_edit.photographer_id = params["photo"]["photographer_id"]
  
  if photo_to_edit.save
    erb :"/success/success"
  else
    @errors = photo_to_edit.errors.messages
    erb :"/failure/failure"
  end
  
end

get "/photo-delete" do
  @photo = Photo.all
  erb :"/photo/delete"
end