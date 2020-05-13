# frozen_string_literal: true
class Report < ApplicationRecord
  belongs_to :hospital

  validates :informant_name, presence: true
  validates :informant_function, presence: true
  validates :report_date, presence: true
end
