# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'
require_relative 'library'

puts '===========INSTANTIATE LIBRARY============'
library = Library.new

puts '===========CHECK DB============'
puts '===========CHECK ALL_ENTITIES============'
puts library.all_entities

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

puts Reader.all_readers

puts '===========ORDERS============X'
puts '===========add_to_library============'
library.add_to_library(author1, author2, book1, book2, book3, reader1, reader2)
puts library.all_entities

