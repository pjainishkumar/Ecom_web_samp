# app/admin/orders.rb
ActiveAdmin.register Order do
  # Permit the necessary parameters
  permit_params :status, :total_price, :user_id, :created_at, :updated_at

  # Define the index view
  index do
    selectable_column
    id_column
    column :total_price
    column :created_at
    column :updated_at
    actions
  end

  # Define filters for the index view
  filter :created_at
  filter :updated_at

  # Define the form view
  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: Order.statuses.keys # Assuming you have statuses defined as an enum
      f.input :total_price
      f.input :user_id # Assuming you have a user_id model associated
    end
    f.actions
  end

  # Define the show view
  show do
    attributes_table do
      row :status
      row :total_price
      row :user_id
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
