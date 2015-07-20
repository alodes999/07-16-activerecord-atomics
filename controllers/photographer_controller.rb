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

get "/photographer_to_database" do
  add_hash = {"name" => "#{params["photographer"]["name"]}", "cameratype" => "#{params["photographer"]["cameratype"]}", "employer" => "#{params["photographer"]["employer"]}"}
  
  Photographer.create(add_hash)
  erb :"/success/success"
end

get "/photographer-edit" do
  @photographer = Photographer.all
  erb :"/photographer/edit"  
end

get "/edit_photographer_to_database" do
  photog_to_edit = Photographer.find(params["photographer"]["id"])
  
  photog_to_edit.name = params["photographer"]["name"]
  photog_to_edit.cameratype = params["photographer"]["cameratype"]
  photog_to_edit.employer = params["photographer"]["employer"]
  
  if photog_to_edit.save
    erb :"/success/success"
  else
    @errors = photog_to_edit.errors.messages
    erb :"/failure/failure"
  end
  
end

get "/photographer-delete" do
  @photographer = Photographer.all
  erb :"/photographer/delete"  
end

get "/photographer-delete-action" do
  Photographer.delete(params["photographer"]["id"])
  erb :"/success/success"
end