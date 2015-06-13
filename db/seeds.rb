track_dir = Rails.root.join('db/seeds/tracks/')
Beat.destroy_all
Dir.open(track_dir).each do |f|
  next if f =~ /^\./
  Beat.create(title: 'foo', track: File.new(track_dir.join(f)))
end
