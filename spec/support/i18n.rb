RSpec.configure do |config|
  config.before(:each) do
    I18n.available_locales = %i[en pt-BR en-US]
  end
end
