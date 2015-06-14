track_dir = Rails.root.join('db/seeds/tracks/')
Beat.destroy_all
Rap.destroy_all
Dir.open(track_dir).each_with_index do |f, i|
  next if f =~ /^\./

  track = File.new(track_dir.join(f))
  beat = Beat.create(title: "beat#{i}", track: track)
  Rap.create(title: "rap#{i}", track: track, beat: beat)
end
