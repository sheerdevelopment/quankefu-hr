module SharedConcepts
  extend ActiveSupport::Concern

  ABSENCE_PRELOAD_FIELDS = [
    { type: [:translations] },
    { status: [:translations] }
  ]

  PROJECT_PRELOAD_FIELDS = [
    {
      diaries: [{ employee: [:user] }]
    },
    { status: [:translations] }
  ]

  EMPLOYEE_RELOAD_FIELDS = [
    { user: [{ role: [:translations] }] },
    { department: [:translations] },
    { gender: [:translations] }
  ]
end
