module SharedConcepts
  extend ActiveSupport::Concern

  ABSENCE_PRELOAD_FEILDS = [
    { absence_type: [:translations] },
    { absence_status: [:translations] }
  ]
end
