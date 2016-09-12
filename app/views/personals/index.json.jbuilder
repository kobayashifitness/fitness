json.array!(@personals) do |personal|
  json.extract! personal, :id, :age, :datetime, :fat, :goal, :height, :muscle, :name, :sex, :weight
  json.url personal_url(personal, format: :json)
end
