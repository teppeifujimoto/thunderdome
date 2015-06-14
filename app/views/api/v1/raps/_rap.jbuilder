json.rap do
  json.id rap.id
  json.title rap.title
  json.created_at rap.created_at
  json.track do
    json.url rap.track.url
    json.size rap.track_file_size
  end

  json.beat do
    json.id rap.beat_id
    json.title rap.beat.title
  end
end
