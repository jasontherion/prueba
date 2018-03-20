require 'faker'
FactoryGirl.define do
  factory :cliente do
    user_id  Faker::Number.number(1)
    total_cuenta Faker::Number.number(10)
    id_tipo_cuenta Faker::Number.between(1, 2)
    consignacion_fecha Faker::Business.credit_card_expiry_date
    consignacion_valor Faker::Number.number(10)
  end
end
