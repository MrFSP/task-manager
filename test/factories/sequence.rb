FactoryBot.define do
  sequence :string, aliases: [
    :first_name,
    :last_name,
    :password,
    :avatar,
    :name,
    :description,
    :expired_at,
  ] do |n|
    "string#{n}"
  end

  sequence :state do |n|
    [
      :new_task,
      :in_development,
      :in_qa,
      :in_code_review,
      :ready_for_release,
      :released,
      :archived
    ][rand(0..6)]
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end
end
