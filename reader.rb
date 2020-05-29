# frozen_string_literal: true

# This is Reader. Readers read books
class Reader
  def initialize(args)
    @name   = args[:name]
    @email  = args[:email]
    @city   = args[:city]
    @street = args[:street]
    @house  = args[:house] if args[:house].is_a? Integer
  end

  private

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "email: #{@email}, " \
    "city: #{@city}, " \
    "street: #{@street}, " \
    "house: #{@house}, "
  end
end
