# frozen_string_literal: true

# This is Reader. Readers order books
class Reader
  include Validation

  attr_reader :email

  def initialize(name:, email:, city:, street:, house:)
    validate(name, email, city, street, house)

    @name   = name
    @email  = email
    @city   = city
    @street = street
    @house  = house
  end

  def ==(other)
    (other.is_a? Reader) && (@email == other.email)
  end

  private

  def validate(name, email, city, street, house)
    validate_strings(name, email, city, street)
    validate_integers(house)
  end

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "email: #{@email}, " \
    "city: #{@city}, " \
    "street: #{@street}, " \
    "house: #{@house}."
  end
end
