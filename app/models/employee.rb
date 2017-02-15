class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :gender
  has_many :diaries

  delegate :username, to: :user

  before_save :set_default_department

  has_attached_file :avatar,
    :styles => { medium: "128x128#", small: "56x56#" },
    :path => "avatars/:id/:style/:filename"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end

  def address
    [line1, line2, city, county, postcode, country].compact.join(" ")
  end

  def work_hours(start_date = Time.now.beginning_of_week, end_date = Time.now.end_of_week)
    @work_hours ||= diaries.where("start >= ? AND 'end' <= ?", start_date, end_date).sum(:hours) || 0
  end

  private

  def set_default_department
    self.department ||= Department.find_by(name: "Staff")
  end
end
