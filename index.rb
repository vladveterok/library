# frozen_string_literal: true

require_relative 'bootstrap'

puts '=========== 1) INSTANTIATE LIBRARY AND CLEAR ENTITIES FOR THE TEST PURPOSE ============'

library = Library.new
library&.all_entities&.clear if library.all_entities

puts '=========== 2) CREATE BASIC ENTITIES ============'

puts author1 = Author.new('Jack Kerouac')
puts author2 = Author.new('Viktor Pelevin')
puts
puts book1 = Book.new('Sailor Song', 'Ken Kesey')
puts book2 = Book.new('On The Road', 'Jack Kerouac')
puts book3 = Book.new('Big Sur', 'Jack Kerouac')
puts book4 = Book.new('Generation P', 'Viktor Pelevin')
puts
puts reader1 = Reader.new(
  'One Alex',
  'alex@gmail.com',
  'Kyiv',
  'Shoto st',
  5
)

puts reader2 = Reader.new(
  'Two Maria',
  'maria@gmail.com',
  'LA',
  'Shoto st',
  7
)

puts reader3 = Reader.new(
  'Three John',
  'joh@gmail.com',
  'NY',
  'Rich st',
  4
)

puts reader4 = Reader.new(
  'Four Lil',
  'lil@gmail.com',
  'WG',
  'Bitch st',
  159
)
puts

puts order1 = Order.new(book1.title, reader1.name)
puts order2 = Order.new(book1.title, reader1.name)
puts order3 = Order.new(book1.title, reader2.name)
puts order4 = Order.new(book2.title, reader1.name)
puts order5 = Order.new(book2.title, reader4.name)
puts order6 = Order.new(book2.title, reader4.name)
puts order7 = Order.new(book3.title, reader3.name)
puts order8 = Order.new(book3.title, reader3.name)
puts order9 = Order.new(book3.title, reader3.name)
puts order10 = Order.new(book3.title, reader3.name)
puts order11 = Order.new(book3.title, reader3.name)
puts

puts '=========== 3) ADD ENTITIES TO LIBRARY ============'

library.add_to_library(author1, author2,
                       book1, book2, book3, book4,
                       reader1, reader2, reader3, reader4,
                       order1)

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