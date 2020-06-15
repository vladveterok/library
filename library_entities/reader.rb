# frozen_string_literal: true

# This is Reader. Readers order books
class Reader
  attr_reader :name
  attr_reader :email

  def initialize(name:, email:, city:, street:, house:)
    validate_arguments(name, email, city, street, house)

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

  def validate_arguments(*args)
    strings = args.select { |argument| argument.is_a?(String) }
    nums = args.select { |argument| argument.is_a?(Integer) }

    strings.each do |argument|
      raise ArgumentError, 'String souldn\'t be empty^^' if argument.strip.empty?
    end

    nums.each do |argument|
      raise ArgumentError, 'Number should be positive^^' unless argument.positive?
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
