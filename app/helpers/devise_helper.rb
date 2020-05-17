# frozen_string_literal: true
module DeviseHelper
  def devise_flash_type_to_bts(type)
    "alert-dismissible fade show alert alert-#{type == 'alert' ? 'danger' : 'info'}"
  end
end
