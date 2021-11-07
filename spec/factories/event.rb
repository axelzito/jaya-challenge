# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    issue
    payload { Faker::Json.shallow_json }
  end
end
