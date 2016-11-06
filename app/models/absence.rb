class Absence < ApplicationRecord
  belongs_to :absence_type
  belongs_to :absence_status
end
