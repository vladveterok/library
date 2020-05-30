# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'
require_relative 'library'

puts '===========INSTANTIATE LIBRARY============'
library = Library.new

puts '===========CHECK DB============'
puts '===========CHECK ALL_ENTITIES BEFORE CREATING NEW============'
puts library.all_entities
puts "the number of entities is #{library.all_entities.size}"

puts '===========CREATE NEW ENTITIES============'
puts '===========AUTHORS============'
author1 = Author.new("Jack Kerouac")
author2 = Author.new("Viktor Pelevin")

puts Author.all_authors

puts '===========BOOKS============'
book1 = Book.new("Sailor Song", "Ken Kesey")
book2 = Book.new("On The Road", "Jack Kerouac")
book3 = Book.new("Big Sur", "Jack Kerouac")

puts Book.all_books
puts Author.all_authors

puts '===========READERS============'
reader1 = Reader.new(
  name: "Alex",
  email: "alex@gmail.com",
  city: "Kyiv",
  street: "Shoto st",
  house: "kek"
)
reader2 = Reader.new(
  name: "Maria",
  email: "maria@gmail.com",
  city: "LA",
  street: "Shoto st",
  house: "big"
)

reader3 = Reader.new(
  name: "Joh",
  email: "joh@gmail.com",
  city: "NY",
  street: "Rich st",
  house: "Not so big"
)

puts Reader.all_readers

puts '===========ORDERS============'
order1 = Order.new(book1.title, reader1.name)
order2 = Order.new(book2.title, reader2.name)
order3 = Order.new(book1.title, reader2.name)

puts '===========add_to_library============'
library.add_to_library(author1, author2, book1, book2, book3, reader1, reader2, order1, order2, order3)
puts library.all_entities

puts '===========SAVE LIBRARY============'
# library.save

puts '===========ALL READERS OF A BOOK============'
puts book1.all_readers
puts 
puts book2.all_readers

puts '===========ALL BOOKS OF A READER============'
puts reader1.all_books
puts
puts reader2.all_books