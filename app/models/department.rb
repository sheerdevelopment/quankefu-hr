class Department < ApplicationRecord
  translates :name

  has_many :employees
end
