class SiteContent < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[about_us contact_us career general]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
