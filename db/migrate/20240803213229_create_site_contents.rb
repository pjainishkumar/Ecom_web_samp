# frozen_string_literal: true

class CreateSiteContents < ActiveRecord::Migration[7.0]
  def change
    create_table :site_contents do |t|
      t.text :about_us
      t.text :contact_us
      t.text :career
      t.text :general

      t.timestamps
    end
  end
end
