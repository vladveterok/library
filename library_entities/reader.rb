# frozen_string_literal: true

# This is Reader. Readers order books
class Reader
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

  def validate_strings(*args)
    args.each do |argument|
      raise ArgumentError, 'Argument should be a String^^' unless argument.is_a? String
      raise ArgumentError, 'Argument should not be empty^^' if argument.strip.empty?
    end
  end

  def validate_integers(*args)
    args.each do |argument|
      raise ArgumentError, 'Argument should be an Integer^^' unless argument.is_a? Integer
      raise ArgumentError, 'Argument should be positive^^' unless argument.positive?
    end
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
