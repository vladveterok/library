# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'reader'

puts author1 = Author.new('Foo Barovich', 'born,lived,died')
puts author2 = Author.new('Foo Barovich', 'born,lived,died')
puts author3 = Author.new('Veniamin Fuck', 'born,lived,died')
puts 'Authors============='
puts Author.all_authors
puts 'Books ============'
puts book1 = Book.new('New book', 'Foo Barovich')
puts 'Authors============='
puts Author.all_authors

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
  city: "Kyiv",
  street: "Shoto st",
  house: "lol"
)

puts Reader.all_readers