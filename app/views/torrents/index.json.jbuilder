json.array!(@torrents) do |torrent|
  json.extract! torrent, :id, :name, :link
  json.url torrent_url(torrent, format: :json)
end
