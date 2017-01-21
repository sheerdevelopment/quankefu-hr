module SharedConcepts
  extend ActiveSupport::Concern

  ABSENCE_PRELOAD_FEILDS = [
    { type: [:translations] },
    { status: [:translations] }
  ]

  PROJECT_PRELOAD_FEILDS = [
    {
      diaries: [{ employee: [:user] }]
    },
    { status: [:translations] }
  ]
end
