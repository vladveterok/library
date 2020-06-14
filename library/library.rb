# frozen_string_literal: true

# Library class collects entities, saves library state into library.yaml and loads it
class Library
  attr_reader :lib_db
  attr_reader :authors

  LIBRARY_FILE_NAME = 'library.yaml'

  def initialize
    @all_entities = []
    @authors = []
    @books   = []
    @readers = []
    @orders  = []

    File.exist?("./db/#{LIBRARY_FILE_NAME}") ? load_yaml : File.open("./db/#{LIBRARY_FILE_NAME}", 'w')
  end

  def add_to_library(*entities)
    entities.each do |entity|
      next if in_library?(entity)

      @authors.push entity if entity.is_a?(Author)
      @books.push entity if entity.is_a?(Book)
      @readers.push entity if entity.is_a?(Reader)
      @orders.push entity if entity.is_a?(Order)
    end
  end

  def all_entities
    @authors + @books + @readers + @orders
  end

  def top_readers(num = 1)
    # @all_entities.select { |entity| entity.is_a?(Reader) }
    #             .max_by(num) { |reader| reader.all_books.uniq.length }
    @readers.max_by(num) { |reader| reader.all_books.uniq.length }
  end

  def top_books(num = 1)
    # @all_entities.select { |entity| entity.is_a?(Book) }
    #             .max_by(num) { |book| book.all_readers.uniq.length }
    @books.max_by(num) { |book| book.all_readers.uniq.length }
  end

  def count_top_books_readers(num = 3)
    top_books(num).flat_map(&:all_readers).uniq.length
  end

  # In File.open() replace flag 'w' with 'a' for a dynamic record to the library.yaml.
  # Now, for the purpose of testing, db rewrites itself each time
  def save
    File.open("./db/#{LIBRARY_FILE_NAME}", 'w') do |file|
      all_entities.each do |ent|
        file.write(ent.to_yaml)
      end
    end
  end

  def load_yaml
    File.open("./db/#{LIBRARY_FILE_NAME}", 'r') do |file|
      @all_entities.push(*YAML.load_stream(file))
    end
  end

  private

  def in_library?(entity)
    all_entities.any? { |ent| ent == entity } ? true : false
  end
end

# rewrite sttistics
# rewrite save/load
# remove @all_entities
