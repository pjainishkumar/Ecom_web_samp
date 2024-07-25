class ActiveStorage::Attachment < ApplicationRecord
  # Other model code...
  belongs_to :record, polymorphic: true, inverse_of: :active_storage_attachments

  def self.ransackable_attributes(auth_object = nil)
    ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
  end
end
