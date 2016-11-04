class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tenancies
  has_many :certificates

  has_attached_file :avatar,
    :styles => { medium: "128x128#" },
    :path => ":rails_root/public/:url",
    :url  => "/avatars/:id/:style/:filename"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def username
    first_name.blank? ? email : first_name
  end
end
