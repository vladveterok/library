# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
equire_relative 'reader'

puts author1 = Author.new('Foo Barovich', 'born,lived,died')
puts author2 = Author.new('Foo Barovich', 'born,lived,died')
puts author3 = Author.new('Veniamin Fuck', 'born,lived,died')
puts 'Authors============='
puts Author.authors
puts 'Books ============'
puts book1 = Book.new('New book', 'Foo Barovich')
puts 'Authors============='
puts Author.authors

reader1 = Reader.new(
  name: "Alex",
  email: "alex@gmail.com",
  city: "Kyiv",
  street: "Shoto st",
  house: "kek"
)