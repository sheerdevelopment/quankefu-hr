class Project < ApplicationRecord
  belongs_to :status, class_name: "ProjectStatus", foreign_key: :project_status_id
  has_many :diaries

  def participation
    @participation ||= diaries.reduce(Hash.new(0)) do |result, diary|
      result[diary.employee] += diary.hours
      result
    end
  end
end
