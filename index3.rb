# frozen_string_literal: true

require_relative 'bootstrap'

library = Library.new

author1 = Author.new('One Fitzjerald')
author2 = Author.new('Two Pelevin')
author3 = Author.new('Foo Barovich')
author4 = Author.new('Foo Barovich')


library.add_to_library(author1,
                       author2,
                       author3,
                       author4, # shouldn't be added
                       Book.new('Book1', author1),
                       Book.new('Book2', author2),
                       Book.new('Book3', author3),
                       )

reader1 = Reader.new(
  'One Alex',
  'alex@gmail.com',
  'Kyiv',
  'Shoto st',
  5
)

reader2 = Reader.new(
  'Two Maria',
  'maria@gmail.com',
  'LA',
  'Shoto st',
  7
)

reader3 = Reader.new(
  'Two Maria',
  'maria@gmail.com',
  'LA',
  'Shoto st',
  7
)

library.add_to_library(reader1, reader2, reader3)

puts library.all_entities

