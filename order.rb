# frozen_string_literal: true

require_relative 'bootstrap'

# Orders are made by readers who want to pick up a book
class Order
  attr_reader :book
  attr_reader :reader

  def initialize(book = 'test', reader = 'test', date = Time.new.strftime('%d/%m/%Y'))
    # Some code here
    @book = find_book(book)
    @reader = find_reader(reader)
    @date = date

    @book.add_to_readers(@reader)
    @reader.add_to_books(@book)
  end

  private

  def find_book(book)
    Book.all_books.find { |b| b.title == book }
  end

  def find_reader(reader)
    Reader.all_readers.find { |r| r.name == reader }
  end

  def to_s
    "type: #{self.class.name},\n
    book: #{@book},\n
    reader: #{@reader},\n
    date: #{@date}"
  end
end
