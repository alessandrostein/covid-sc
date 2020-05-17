# frozen_string_literal: true
ActiveAdmin.register(Hospital) do
  permit_params :acronym,
                :city,
                :email,
                :private,
                :name,
                :phone_number,
                hospital_beds_attributes: %I[id bed_type total total_covid]

  index do
    selectable_column
    id_column
    column :name
    column :acronym
    column :city
    column :phone_number
    column :email
    column :private
    actions
  end

  show do
    attributes_table do
      row :acronym
      row :name
      row :city
      row :phone_number
      row :email
      row :private
      row :created_at
      row :updated_at
    end

    panel('Capacidade Instalada') do
      table_for(hospital.hospital_beds) do
        column(:bed_type) { |bed| HospitalBed.human_enum_name(:bed_type, bed.bed_type) }
        column :total
        column :total_covid
      end
    end
  end

  form do |f|
    f.inputs('Dados do Hospital') do
      f.input(:name)
      f.input(:acronym)
      f.input(:city)
      f.input(:phone_number)
      f.input(:email)
      f.input(:private)
    end

    f.inputs('Capicidade Instalada') do
      f.has_many(
        :hospital_beds,
        new_record: false,
        allow_destroy: false,
        heading: false,
      ) do |b|
        b.input(:bed_type)
        b.input(:total)
        b.input(:total_covid)
      end
    end

    f.actions
  end
end
