# frozen_string_literal: true

require_relative 'book'
require_relative 'reader'

# Orders are made by readers who want to pick up a book
class Order
  def initialize(book = 'test', reader = 'test', date = Time.new.strftime('%d/%m/%Y'))
    # Some code here
    @book = add_book(book)
    @reader = add_reader(reader)
    @date = date
  end

  private

  def add_book(book)
    Book.all_books.find { |b| b.title == book }
  end

  def add_reader(reader)
    Reader.all_readers.find { |r| r.name == reader }
  end

  def to_s
    "type: #{self.class.name},\n
    book: #{@book},\n
    reader: #{@reader},\n
    date: #{@date}"
  end
end

# Books
book1 = Book.new("Book 1", "Foo")

# Readers
reader1 = Reader.new(
  name: "Alex",
  email: "alex@gmail.com",
  city: "Kyiv",
  street: "Shoto st",
  house: "kek"
)

# Orders 
order1 = Order.new("Book 1", "Alex")
puts order1
