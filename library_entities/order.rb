# frozen_string_literal: true

# Orders only possible if reader and book exist
class Order
  attr_reader :book
  attr_reader :reader
  attr_reader :date

  def initialize(book, reader, date = Date.today)
    validate(book, reader)

    @book = book
    @reader = reader
    @date = date
  end

  def ==(other)
    (other.is_a? Order) && (@book == other.book) && (@reader == other.reader) && (@date == other.date)
  end

  private

  def validate(book, reader)
    validate_book(book)
    validate_reader(reader)
  end

  def validate_book(book)
    raise ArgumentError, 'Book should be an instance of a Book^^' unless book.is_a? Book
  end

  def validate_reader(reader)
    raise ArgumentError, 'Reader should be an instance of a Reader^^' unless reader.is_a? Reader
  end

  def to_s
    "type: #{self.class.name},\n
    book: #{@book},\n
    reader: #{@reader},\n
    date: #{@date}"
  end
end
