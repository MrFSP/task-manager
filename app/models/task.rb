class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates :name, presence: true
  validates :author, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  state_machine initial: :new_task do
    event :switch_in_development do
      transition [:new_task, :in_qa, :in_code_review] => :in_development
    end

    event :switch_in_qa do
      transition in_development: :in_qa
    end

    event :switch_code_review do
      transition in_qa: :in_code_review
    end

    event :switch_ready_for_release do
      transition in_code_review: :ready_for_release
    end

    event :switch_release do
      transition ready_for_release: :released
    end

    event :switch_archive do
      transition [:new_task, :released] => :archived
    end
  end
end
