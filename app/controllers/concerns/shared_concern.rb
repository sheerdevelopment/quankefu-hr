module SharedConcern
  extend ActiveSupport::Concern

  ABSENCE_PRELOAD_FIELDS = [
    { type: [:translations] },
    { status: [:translations] },
    { user: [:employee] }
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

  DIARY_RELOAD_FIELDS = [
    { employee: [:user] },
    :project
  ]
end
