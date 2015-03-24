json.array!(@songs) do |song|
  json.extract! song, :id, :artist, :title, :deleted_at
  json.url song_url song
end
