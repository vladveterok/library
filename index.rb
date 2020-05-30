# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'
require_relative 'library'

puts '===========INSTANTIATE LIBRARY============'
library = Library.new
puts '===========CHECK DB============'
puts library.load_yaml
puts '===========CHECK ALL_ENTITIES============'
puts library.all_entities[0].reader.class
