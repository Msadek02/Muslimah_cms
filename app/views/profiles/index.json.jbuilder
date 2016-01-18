json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :gender, :birth_date, :country
  json.url profile_url(profile, format: :json)
end
