# frozen_string_literal: true
ActiveAdmin.register(User) do
  permit_params :email, :password, :password_confirmation, :role

  controller do
    def update_resource(object, attributes)
      attributes.each do |attr|
        if attr[:password].blank? && attr[:password_confirmation].blank?
          attr.delete(:password)
          attr.delete(:password_confirmation)
        end
      end

      object.send(:update_attributes, *attributes)
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    actions
  end

  filter :email

  form do |f|
    f.inputs do
      f.input(:email)
      f.input(:role)
      f.input(:password)
      f.input(:password_confirmation)
    end
    f.actions
  end
end
