json.array!(@bookmark_managers) do |bookmark_manager|
  json.extract! bookmark_manager, :id, :name
  json.url bookmark_manager_url(bookmark_manager, format: :json)
end
