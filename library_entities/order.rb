# frozen_string_literal: true

require_relative '../bootstrap'

# Orders only possible if reader and book exist
class Order
  attr_reader :book
  attr_reader :reader

  def initialize(book, reader, date = Time.new.strftime('%d/%m/%Y'))
    @book = book
    @reader = reader
    @date = date

    @book.add_reader(@reader)
    @reader.add_book(@book)
  end

  private

  def to_s
    "type: #{self.class.name},\n
    book: #{@book},\n
    reader: #{@reader},\n
    date: #{@date}"
  end
end
