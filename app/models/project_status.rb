class ProjectStatus < ApplicationRecord
  translates :name

  IN_PROGRESS = 1
  FINISHED = 2
end
