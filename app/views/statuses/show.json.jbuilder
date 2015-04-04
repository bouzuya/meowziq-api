json.text @status.text
if @status.song
  json.song do
    json.id @status.song.id
    json.artist @status.song.artist
    json.title @status.song.title
    json.url song_url(@status.song)
  end
else
  json.song nil
end
