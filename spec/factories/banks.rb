FactoryGirl.define do
  factory :bank do
    value 0.025
    association :user, factory: :user
  end
end
