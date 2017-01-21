class Gender < ApplicationRecord
  translates :name

  MALE = 1
  FEMALE = 2
end
