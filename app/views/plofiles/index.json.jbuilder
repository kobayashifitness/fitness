json.array!(@plofiles) do |plofile|
  json.extract! plofile, :id
  json.url plofile_url(plofile, format: :json)
end
