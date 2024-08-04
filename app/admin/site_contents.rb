# frozen_string_literal: true

ActiveAdmin.register SiteContent do
  permit_params :about_us, :contact_us, :career, :general

  form do |f|
    f.inputs 'Site Content' do
      f.input :about_us, as: :text
      f.input :contact_us, as: :text
      f.input :career, as: :text
      f.input :general, as: :text
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :about_us
    column :contact_us
    column :career
    column :general
    actions
  end

  show do
    attributes_table do
      row :about_us
      row :contact_us
      row :career
      row :general
    end
  end
end
