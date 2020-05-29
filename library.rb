# frozen_string_literal: true

require 'yaml'

# Library class
class Library
  def initialize
    # Some code here
  end

  def save_to_yaml(object, file)
    File.open(file, 'a') do |f|
      f.write(object.to_yaml)
    end
  end

  def load_yaml(file)
    File.open(file, 'r') do |f|
      YAML.load_stream(f)
    end
  end
end
