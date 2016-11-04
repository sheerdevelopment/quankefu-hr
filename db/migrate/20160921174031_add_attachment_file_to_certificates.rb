class AddAttachmentFileToCertificates < ActiveRecord::Migration[5.0]
  def self.up
    change_table :certificates do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :certificates, :file
  end
end
