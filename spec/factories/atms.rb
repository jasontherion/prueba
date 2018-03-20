require 'faker'
FactoryGirl.define do
  factory :atm do
    fecha_retiro Faker::Business.credit_card_expiry_date
     valor_retiro Faker::Number.number(4)
     cliente_id  Faker::Number.number(1)
  end
end
