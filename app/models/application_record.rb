# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob] # Add other associations if needed
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[name description price category on_sale new created_at updated_at] # Add other attributes if needed
  end
end
