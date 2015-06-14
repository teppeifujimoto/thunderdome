include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :beat do
    title "my first beat"
    track { fixture_file_upload( File.join(Rails.root, 'spec', 'fixtures', 'beats', 'tracks', 'remix_asadanousan.mp3'), 'audio/mpeg') }
  end
end
