# frozen_string_literal: true

require_relative '../bootstrap'

# Orders only possible if reader and book exist
class Order
  attr_reader :book
  attr_reader :reader

  def initialize(book, reader, date = Time.new.strftime('%d/%m/%Y'))
    @book = book # find_book(book)
    @reader = reader # find_reader(reader)
    @date = date

    @book.add_reader(@reader)
    @reader.add_book(@book)
  end

  private

  # def find_book(book)
  #   Book.all_books.find { |b| b.title == book }
  # end

  # def find_reader(reader)
  #  Reader.all_readers.find { |r| r.name == reader }
  # end

  def to_s
    "type: #{self.class.name},\n
    book: #{@book},\n
    reader: #{@reader},\n
    date: #{@date}"
  end
end
