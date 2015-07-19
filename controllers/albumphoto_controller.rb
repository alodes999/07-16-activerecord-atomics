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

get "/albumphoto-view-top-photos" do
  photos = Photo.all
  @top_photo_list = []
  
  photos.each do |p|
    if p.top_photo?
      @top_photo_list << p
    end
  end
  
  erb :"/albumphoto/top-photos"
end

get "/albumphoto-delete" do
  @photo = Photo.all
  erb :"/albumphoto/delete"
end

get "/albumphoto-delete-step2" do
  @photo = Photo.find(params["photo"]["id"])
  @albumlist = @photo.albums
  
  erb :"/albumphoto/delstep2"
end

get "/albumphoto-delete-action" do
  photo_to_del = Photo.find(params["album"]["photo_id"])
  album_to_remove = Album.find(params["album"]["id"])
  
  photo_to_del.albums.delete(album_to_remove)
  
  erb :"/success/success"
end