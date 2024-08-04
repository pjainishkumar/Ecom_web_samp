# frozen_string_literal: true

module ActiveStorage
  class Attachment < ApplicationRecord
    # Other model code...
    belongs_to :record, polymorphic: true
    belongs_to :blob, class_name: 'ActiveStorage::Blob', inverse_of: :attachments

    validates :name, :record, :blob, presence: true
    has_many :image_blob, through: :image_attachment
  end
end
