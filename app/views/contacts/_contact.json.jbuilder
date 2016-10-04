json.extract! contact, :id, :name, :parents, :phonenumber1, :phonenumber2, :created_at, :updated_at
json.url contact_url(contact, format: :json)