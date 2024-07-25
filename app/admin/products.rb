ActiveAdmin.register Product do
  permit_params :name, :description, :price, :category, :on_sale, :new

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    column :on_sale
    column :new
    actions
  end

  filter :name
  filter :category
  filter :price
  filter :on_sale
  filter :new
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category
      f.input :on_sale
      f.input :new
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :category
      row :on_sale
      row :new
      row :image do |product|
        image_tag product.image if product.image.attached?
      end
    end
    active_admin_comments
  end
end
