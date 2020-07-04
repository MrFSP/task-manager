FactoryBot.define do
  sequence :string, aliases: [
    :first_name,
    :last_name,
    :password,
    :avatar,
    :name,
    :description,
    :state,
    :expired_at,
  ] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end
end
