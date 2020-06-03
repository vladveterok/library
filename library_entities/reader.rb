# frozen_string_literal: true

# This is Reader. Readers order books
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

  def ==(other)
    if other.is_a? Reader
      @email == other.email
    else
      false
    end
  end

  private

  def validate_arguments(*args)
    strings = args.select { |v| v.is_a?(String) }
    nums = args.select { |v| v.is_a?(Integer) }

    strings.each do |v|
      raise ArgumentError, 'String souldn\'t be empty^^' if v.strip.empty?
    end

    nums.each do |v|
      raise ArgumentError, 'Number should be positive^^' unless v.positive?
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
