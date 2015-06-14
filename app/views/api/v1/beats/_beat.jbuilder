json.beat do
  json.id beat.id
  json.title beat.title
  json.created_at beat.created_at
  json.track do
    json.url beat.track.url
    json.size beat.track_file_size
  end
end
