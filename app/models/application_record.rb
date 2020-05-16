# frozen_string_literal: true
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.human_enum_name(enum_name, enum_value)
    return unless enum_value.present?
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name}.#{enum_value}")
  end

  def self.human_enum_selectable(enum_name, enum)
    enum.map { |key, _value| [human_enum_name(enum_name, key), key] }.to_h
  end
end
