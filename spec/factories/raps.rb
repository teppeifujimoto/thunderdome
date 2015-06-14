FactoryGirl.define do
  factory :rap do
    title "MyString"
    track { fixture_file_upload( File.join(Rails.root, 'spec', 'fixtures', 'raps', 'tracks', 'remix_asadanousan.mp3'), 'audio/mpeg') }
    beat
  end
end
