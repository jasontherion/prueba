require 'faker'
FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    last_name Faker::Name.last_name
    adress Faker::Address.street_address
    dni Faker::Number.number(4)
    tel Faker::Number.number(4)
    email Faker::Internet.email
    password 12345678
    password_confirmation 12345678
    #encrypted_password "$2a$11$vmmyrqGAP5w6XSwnnNHQ/OaFdXmtER4xyRpxKnhJJOsZ17nwlPmH2"
    #reset_password_sent_at Faker::Business.credit_card_expiry_date
  end
end
