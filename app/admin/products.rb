# frozen_string_literal: true

ActiveAdmin.register Product do
  # Permit the image parameter along with other attributes
  permit_params :name, :description, :price, :category, :on_sale, :new, :image

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    column :on_sale
    column :new
    column :image do |product|
      if product.image.attached?
        image_tag product.image, size: '100x100' # Adjust size as needed
      else
        'No image'
      end
    end
    actions
  end

  filter :name
  filter :category
  filter :price
  filter :on_sale
  filter :new
  filter :created_at
  filter :updated_at

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category, as: :select, collection: Category.all.map { |category| [category.name, category.name] }, include_blank: false
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
        if product.image.attached?
          image_tag product.image, size: '200x200' # Adjust size as needed
        else
          'No image'
        end
      end
    end
    active_admin_comments
  end
end
