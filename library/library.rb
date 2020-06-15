# frozen_string_literal: true

# Library class collects entities, saves library state into library.yaml and loads it
class Library
  include Loader

  LIBRARY_FILE_NAME = 'library.yaml'

  def initialize
    @authors = []
    @books   = []
    @readers = []
    @orders  = []

    load_from_yaml
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

  def load_from_yaml
    add_to_library(*load.flatten(2))
  end

  def top_readers(num = 1)
    @orders.group_by(&:reader).max(num) { |this, later| this[1].length <=> later[1].length }
           .flatten.select { |entity| entity.is_a? Reader }
  end

  def top_books(num = 1)
    @orders.group_by(&:book).max(num) { |this, later| this[1].length <=> later[1].length }
  end

  def count_top_books_readers(num = 3)
    top_books(num).flatten.select { |entity| entity.is_a?(Order) }.uniq(&:reader).count
  end

  private

  def in_library?(entity)
    all_entities.any? { |ent| ent == entity } ? true : false
  end
end
