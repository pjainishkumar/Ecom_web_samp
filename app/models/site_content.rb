# frozen_string_literal: true

class SiteContent < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[about_us contact_us career general]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
