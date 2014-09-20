json.array!(@pics) do |pic|
  json.extract! pic, :id, :tag
  json.url pic_url(pic, format: :json)
end
