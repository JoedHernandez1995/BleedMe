json.array!(@requests) do |request|
  json.extract! request, :id, :name, :phone_number, :email, :needed_for, :blood_type_needed, :blood_units_needed, :date_needed, :compatible_blood_types, :message
  json.url request_url(request, format: :json)
end
