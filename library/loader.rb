# frozen_string_literal: true

# save -- saves all the entities passed as an argument into a .yaml file
# load -- loads all the entities from a .yaml file if exists.
# Otherwise load creates a new .yaml.
module Loader
  LIBRARY_FILE_NAME = 'library.yaml'

  def save(all_entities)
    store = YAML::Store.new "./db/#{LIBRARY_FILE_NAME}"
    store.transaction do
      store['Authors'] = all_entities.select { |author| author.is_a? Author }
      store['Books']   = all_entities.select { |book| book.is_a? Book }
      store['Readers'] = all_entities.select { |reader| reader.is_a? Reader }
      store['Order']   = all_entities.select { |order| order.is_a? Order }
    end
  end

  def load
    save(all_entities) unless File.exist?("./db/#{LIBRARY_FILE_NAME}")

    File.open("./db/#{LIBRARY_FILE_NAME}", 'r') do |file|
      YAML.safe_load file, %i[Author Book Reader Order Date], [], true
    end
  end
end
