class Certificate < ApplicationRecord
  belongs_to :doc_type
  belongs_to :user

  validates_presence_of :name, :expiry_date, :doc_type_id

  scope :endings, -> { where("now() BETWEEN (expiry_date - INTERVAL '2 months') AND expiry_date") }

  has_attached_file :file,
    :path => ":rails_root/public/:url",
    :url  => "files/:user_id/:type/:name.:extension"

  validates_attachment :file,
    :content_type => {
      :content_type => %w(
        application/pdf application/msword
        application/vnd.openxmlformats-officedocument.wordprocessingml.document
        text/plain image/jpeg image/gif image/png
      )
    }

  Paperclip.interpolates :user_id do |attachment, _|
    attachment.instance.user_id
  end

  Paperclip.interpolates :type do |attachment, _|
    attachment.instance.doc_type.name
  end

  Paperclip.interpolates :name do |attachment, _|
    attachment.instance.name
  end

  def expire_soon?
    ((expiry_date - 2.months)..expiry_date).cover?(Time.now.utc)
  end
end
