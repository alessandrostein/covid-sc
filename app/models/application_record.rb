class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s}.#{enum_value}")
  end

  def self.human_enum_selectable(enum_name, enum)
    enum.map { |key, value| [ human_enum_name(enum_name, key), value ] }.to_h
  end
end
