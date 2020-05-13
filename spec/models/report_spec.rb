# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(Report, type: :model) do
  context('when valid') do
    subject { build(:report) }

    it { is_expected.to(be_valid) }
  end

  describe('informant_name') do
    subject { Report.new }

    it { is_expected.to(validate_presence_of(:informant_name)) }
  end

  describe('informant_function') do
    subject { Report.new }

    it { is_expected.to(validate_presence_of(:informant_function)) }
  end

  describe('report_date') do
    subject { Report.new }

    it { is_expected.to(validate_presence_of(:report_date)) }
  end
end
