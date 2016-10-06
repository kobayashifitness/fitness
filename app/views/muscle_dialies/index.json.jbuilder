json.array!(@muscle_dialies) do |muscle_dialy|
  json.extract! muscle_dialy, :id
  json.url muscle_dialy_url(muscle_dialy, format: :json)
end
