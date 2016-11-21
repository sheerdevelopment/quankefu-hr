class AbsenceStatus < ApplicationRecord
  translates :name

  PENDING = 1
  APPROVED = 2
  REJECTED = 3
  CANCELLED = 4
end
