# frozen_string_literal: true
class Report < ApplicationRecord
  belongs_to :hospital
  belongs_to :user

  validates :informant_name, presence: true
  validates :informant_function, presence: true
end
