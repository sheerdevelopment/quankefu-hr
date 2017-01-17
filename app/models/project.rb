class Project < ApplicationRecord
  belongs_to :status, class_name: "ProjectStatus", foreign_key: :project_status_id
  has_many :diaries
end
