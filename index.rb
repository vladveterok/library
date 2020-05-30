# frozen_string_literal: true

require_relative 'author'
require_relative 'book'
require_relative 'reader'
require_relative 'order'
require_relative 'library'

puts '===========INSTANTIATE LIBRARY============'
library = Library.new
puts '===========CHECK DB============'
puts library.load_yaml[0].class
