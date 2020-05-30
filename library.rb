# frozen_string_literal: true

require 'yaml'

# Library class
class Library
  attr_reader :lib_db
  attr_reader :all_entities

  def initialize
    @lib_db = 'library.yaml'
    @all_entities = File.exist?(lib_db) ? load_yaml : File.open(lib_db, 'w')
  end

  def save_to_yaml(object, file)
    File.open(file, 'a') do |f|
      f.write(object.to_yaml)
    end
  end

  def load_yaml
    File.open(lib_db, 'r') do |f|
      YAML.load_stream(f)
    end
  end
end

# Add Array of entities
# Change save method so it just saves into yaml all the entities from the array
