class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :gender

  delegate :username, to: :user

  has_attached_file :avatar,
    :styles => { medium: "128x128#" },
    :path => "#{::PAPERCLIP_PATH}/avatars/:id/:style/:filename",
    :url => "/avatars/:id/:style/:filename"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
