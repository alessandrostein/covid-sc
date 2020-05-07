class EmailFormatValidator < ActiveModel::EachValidator
  REGEX = /\A[\w\.\+\-_]+\w@[\w\-]+(\.[\w]+)*\.[\w]+\z/

  def validate_each(record, attribute, value)
    return if valid?(value)
    record.errors.add(attribute, options[:message] || :invalid)
  end

  private

  def valid?(value)
    value.blank? || value =~ REGEX
  end
end
