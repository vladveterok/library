# frozen_string_literal: true

# This is Reader. Readers read books
class Reader
  attr_reader :name
  attr_reader :email
  attr_reader :all_books

  def initialize(args)
    @name   = args[:name]
    @email  = args[:email]
    @city   = args[:city]
    @street = args[:street]
    @house  = args[:house]

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

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "email: #{@email}, " \
    "city: #{@city}, " \
    "street: #{@street}, " \
    "house: #{@house}."
  end
end
