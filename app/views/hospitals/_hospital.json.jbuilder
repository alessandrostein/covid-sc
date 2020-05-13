# frozen_string_literal: true
json.extract!(hospital, :id, :acronym, :name, :city, :phone_number, :email, :created_at, :updated_at)
json.url(hospital_url(hospital, format: :json))
