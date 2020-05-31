# frozen_string_literal: true

# This is Reader. Readers read books
class Reader
  attr_reader :name
  attr_reader :email
  attr_reader :all_books

  def initialize(name, email, city, street, house)
    validate_arguments(name, email, city, street, house)

    @name   = name
    @email  = email
    @city   = city
    @street = street
    @house  = house

    Reader.add_to_readers(self)

    @all_books = []
  end

  def self.all_readers
    @all_readers ||= []
  end

  def self.add_to_readers(reader)
    @all_readers ||= []
    @all_readers << reader unless @all_readers.find { |r| r.email == reader.email }
  end

  def add_to_books(book)
    @all_books << book
  end

  private

  def validate_arguments(*args)
    arguments = %i[name email city street house]
    count = 0
    args.each do |arg|
      raise ArgumentError, "#{arguments[count].capitalize} should exist ^^" if arg.is_a?(String) && arg.strip.empty?
      raise ArgumentError, "#{arguments[count].capitalize} should be a positive number^^" if arg.is_a?(Integer) && !arg.positive?

      count += 1
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
