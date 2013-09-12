# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    email "graham.jackson07@gmail.com"
    subject "Where is your location?"
    description "I am looking for your location. Can you tell me what your address is?"
    first_name "Graham"
    last_name "Jackson"
  end
end
