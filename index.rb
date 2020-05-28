# frozen_string_literal: true

require_relative 'author.rb'

puts author1 = Author.new('Foo Barovich', 'born,lived,died')
puts author2 = Author.new('Foo Barovich', 'born,lived,died')
puts author3 = Author.new('Veniamin Fuck', 'born,lived,died')
puts '============='
puts Author.authors
