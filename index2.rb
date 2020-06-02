# frozen_string_literal: true

require_relative 'bootstrap'

puts '=========== 1) INSTANTIATE LIBRARY ============'
library = Library.new
puts "Look, it's our library: #{library} :)"
puts
puts '=========== 2) CLEAR ALL ENTITIES ============'
library&.all_entities&.clear if library.all_entities
puts "Here we're cleaning out all the entities from our Library with 'library&.all_entities&.clear' and starting anew..."
puts
puts '=========== 3) CHECK ALL ENTITIES BEFORE CREATING NEW ONES ============'
puts "The number of entities in the Library is #{library.all_entities.size}. Yep, all is clean and shining!"
puts
puts '=========== 4) CREATE BASIC ENTITIES ============'
puts "Let's fill up our Library, shall we?"
puts
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
order2 = Order.new(book1.title, reader1.name)
order3 = Order.new(book1.title, reader2.name)
puts order4 = Order.new(book2.title, reader1.name)
order5 = Order.new(book2.title, reader4.name)
order6 = Order.new(book2.title, reader4.name)
puts order7 = Order.new(book3.title, reader3.name)
order8 = Order.new(book3.title, reader3.name)
order9 = Order.new(book3.title, reader3.name)
order10 = Order.new(book3.title, reader3.name)
order11 = Order.new(book3.title, reader3.name)
puts
puts "There are 11 orders actually, but I don't want to bore you with all this stuff"
puts

puts '=========== 5) ADD ENTITIES TO LIBRARY ============'
library.add_to_library(author1, author2,
                       book1, book2, book3, book4,
                       reader1, reader2, reader3, reader4,
                       order1)

puts "let's hit 'library.add_to_library' and add all these stuff into our library."
puts "Let's see... the number of entities in Library is #{library.all_entities.size}. Library is full!:)"
puts
puts '=========== 6) SAVE LIBRARY ============'
library.save

puts "Here we just hit 'library.save', so you should see our entities in library.yaml from now!^^"
puts
puts '=========== 7) THREE STATISTICAL METHODS: ============'
puts '=========== I TOP READERS ============'
puts 'The top reader is: '
puts library.top_readers
puts
puts 'Two top readers are: '
puts library.top_readers(2)
puts
puts '=========== II TOP BOOKS ============'
puts 'The top book is: '
puts library.top_books
puts
puts 'Two top books are: '
puts library.top_books(2)
puts
puts '=========== III NUM OF READERS OF TOP BOOKS ============'
puts 'The very number of readers of two top books is: '
puts library.count_top_books_readers(2)
puts
puts '=========== THE END ============'
puts 'Thanks for using our shitty library, come again later (or don\'t)!'
puts
