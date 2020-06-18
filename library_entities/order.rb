# frozen_string_literal: true

# Orders only possible if reader and book exist
class Order
  include Validation

  attr_reader :book
  attr_reader :reader
  attr_reader :date

  def initialize(book, reader, date = Date.today)
    validate_class(Book, book)
    validate_class(Reader, reader)

    @book = book
    @reader = reader
    @date = date
  end

  def ==(other)
    (other.is_a? Order) && (@book == other.book) && (@reader == other.reader) && (@date == other.date)
  end

  private

  def to_s
    "type: #{self.class.name},\n
    book: #{@book},\n
    reader: #{@reader},\n
    date: #{@date}"
  end
end
