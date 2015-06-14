json.array! @raps do |rap|
  json.rap do
    json.id rap.id
    json.title rap.title
    json.track do
      json.url rap.track.url
      json.size rap.track_file_size
    end
    json.beat do
      json.id rap.beat_id
      json.title rap.beat.title
    end
  end
end
