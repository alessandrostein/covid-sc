# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(Report, type: :model) do
  context('when valid') do
    subject { build(:report) }

    it { is_expected.to(be_valid) }
  end

  context('associations') do
    it { should belong_to(:hospital) }
    it { should belong_to(:user) }
  end

  describe('informant_name') do
    subject { Report.new }

    it { is_expected.to(validate_presence_of(:informant_name)) }
  end
end
