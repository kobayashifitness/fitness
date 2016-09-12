json.array!(@diaries) do |diary|
  json.extract! diary, :id, :weight, :num, :set, :note
  json.url diary_url(diary, format: :json)
end
