class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :gender

  delegate :username, to: :user

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
