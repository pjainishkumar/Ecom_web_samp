# app/admin/categories.rb

ActiveAdmin.register Category do
  # Permitted parameters
  permit_params :name

  # Index page configuration
  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  # Form configuration
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  # Show page configuration
  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
