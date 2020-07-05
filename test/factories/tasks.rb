FactoryBot.define do
  factory :task do
    name
    description
    author { nil }
    assignee { nil }
    state
    expired_at

    trait :author do
      association :author, factory: :manager
    end

    trait :assignee do
      association :assignee, factory: :developer
    end
  end
end
