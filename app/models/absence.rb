class Absence < ApplicationRecord
  belongs_to :absence_type
  belongs_to :absence_status
  belongs_to :user
end
