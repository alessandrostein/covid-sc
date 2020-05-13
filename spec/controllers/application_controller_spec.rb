require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'Redirect to correct page' do
    let(:user) { create(:user) }
    let(:admin_user) { create(:admin) }

    context 'when is a common user' do
      it 'return hospitals index page' do
        expect(controller.after_sign_in_path_for(user)).to eq(root_path)
      end
    end

    context 'when is a admin user' do
      it 'return activeadmin index page' do
        expect(
          controller.after_sign_in_path_for(admin_user)
        ).to eq(admin_root_path)
      end
    end
  end
end
