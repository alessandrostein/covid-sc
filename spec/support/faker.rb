RSpec.configure do |config|
  config.before(:each) do
    Faker::Config.locale = 'pt-BR'
  end
end
