RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view

  config.include Devise::Test::IntegrationHelpers, type: :feature

  config.include Warden::Test::Helpers
end
