# frozen_string_literal: true

# Orders are made by readers who want to pick up a book
class Order
  def initialize(book = 'test', reader = 'test', date = Time.new.strftime('%d/%m/%Y'))
    # Some code here
    @book = add_book(book)
    @reader = add_Reader(reader)
    @date = date
  end

  private

  def add_book(book)
    # Some code here
  end

  def add_reader(reader)
    # Some code here
  end

  def to_s
    "type: #{self.class.name}, " \
    "book: #{@book}, " \
    "reader: #{@reader}, " \
    "date: #{@date}"
  end
end

order1 = Order.new
puts order1
