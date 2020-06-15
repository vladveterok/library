# frozen_string_literal: true

require_relative 'bootstrap'
require 'date'
require 'yaml'

puts '=========== 1) INSTANTIATE LIBRARY AND CLEAR ENTITIES FOR THE TEST PURPOSE ============'

library = Library.new
library.all_entities.clear if library.all_entities

puts '=========== 2) CREATE BASIC ENTITIES ============'

puts author1 = Author.new('Jack Kerouac')
puts author2 = Author.new('Viktor Pelevin')
puts author3 = Author.new('Ken Kesey')
puts author4 = Author.new('Ken Kesey')
puts
puts book1 = Book.new('Sailor Song', author3)
puts book2 = Book.new('On The Road', author1)
puts book3 = Book.new('Big Sur', author1)
puts book4 = Book.new('Generation P', author2)
puts
puts reader1 = Reader.new(
  name: 'One Alex',
  email: 'alex@gmail.com',
  city: 'Kyiv',
  street: 'Shoto st',
  house: 5
)
# name:, email:, city:, street:, house:
puts reader2 = Reader.new(
  name: 'Two Maria',
  email: 'maria@gmail.com',
  city: 'LA',
  street: 'Shoto st',
  house: 7
)

puts reader3 = Reader.new(
  name: 'Three John',
  email: 'joh@gmail.com',
  city: 'NY',
  street: 'Rich st',
  house: 4
)

puts reader4 = Reader.new(
  name: 'Four Lil',
  email: 'lil@gmail.com',
  city: 'WG',
  street: 'Bitch st',
  house: 159
)

puts reader5 = Reader.new(
  name: 'Four Lil',
  email: 'lil@gmail.com',
  city: 'WG',
  street: 'Bitch st',
  house: 159
)
puts

puts order1 = Order.new(book1, reader1)
puts order2 = Order.new(book2, reader1)
puts order3 = Order.new(book2, reader1)
puts order4 = Order.new(book2, reader2)
# puts order5 = Order.new(book2, reader4)
# puts order6 = Order.new(book2, reader4)
# puts order7 = Order.new(book3, reader3)
puts order8 = Order.new(book3, reader3)
puts order9 = Order.new(book3, reader3)
puts order10 = Order.new(book3, reader3)
# puts order11 = Order.new(book3, reader3)
puts

puts '=========== 3) ADD ENTITIES TO LIBRARY ============'

library.add_to_library(author1, author2, author3, author4,
                       book1, book2, book3, book4,
                       reader1, reader2, reader3, reader4, reader5,
                       order1, order2, order3, order4, order8, order9, order10)

puts library.all_entities

puts '=========== 4) SAVE LIBRARY ============'

library.save

puts '=========== TOP READERS ============'
puts 'The top reader is: '
puts library.top_readers
puts
puts 'Two top readers are: '
puts library.top_readers(2)
puts
puts '=========== TOP BOOKS ============'
puts 'The top book is: '
puts library.top_books
puts
puts 'Two top books are: '
puts library.top_books(2)
puts
puts '=========== NUM OF READERS OF TOP BOOKS ============'
puts 'The very number of readers of two top books is: '
puts library.count_top_books_readers(2)
