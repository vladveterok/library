# frozen_string_literal: true

require 'yaml'

# Library class collects entities, saves and loads library state into library.yaml
class Library
  attr_reader :lib_db
  attr_reader :all_entities

  def initialize
    @lib_db = 'library.yaml'
    @all_entities = []
    File.exist?(lib_db) ? load_yaml : File.open(lib_db, 'w')
  end

  def add_to_library(*entities)
    @all_entities.push(*entities)
  end

  def top_readers(num = 1)
    @all_entities.select { |ent| ent.is_a?(Reader) }
                 .max_by(num) { |r| r.all_books.uniq.length }
  end

  def top_books(num = 1)
    @all_entities.select { |e| e.is_a?(Book) }
                 .max_by(num) { |book| book.all_readers.uniq.length }
  end

  def count_top_books_readers(num = 3)
    top_books(num).flat_map(&:all_readers).uniq.length
  end

  # In File.open() replace flag 'w' with 'a' for a dynamic record to the library.yaml.
  # Now, for the purpose of testing, db rewrites itself each time
  def save
    File.open(lib_db, 'w') do |f|
      all_entities.each do |ent|
        f.write(ent.to_yaml)
      end
    end
  end

  def load_yaml
    File.open(lib_db, 'r') do |f|
      YAML.load_stream(f)
    end
  end
end
