class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, class_name: "UserRole", foreign_key: "user_role_id"
  delegate :admin?, to: :role

  def username
    email
  end
end
