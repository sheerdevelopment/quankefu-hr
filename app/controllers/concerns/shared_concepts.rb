module SharedConcepts
  extend ActiveSupport::Concern

  ABSENCE_PRELOAD_FEILDS = [
    { type: [:translations] },
    { status: [:translations] }
  ]
end
