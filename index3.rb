# frozen_string_literal: true

require_relative 'bootstrap'

library = Library.new

library.add_to_library(Author.new("One Fitzjerald"),
        Author.new("Two Pelevin"),
        Author.new("Two Pelevin"),
        Book.new("Book1", "One Fitzjerald"),
        Book.new("Book2", "Three Dali")
      )


puts library.all_entities
puts
puts Author.all_authors
puts
