# frozen_string_literal: true

require_relative '../bootstrap'

# Well, that's a book. You can read it (actually, you can't, but let's say you can)
class Book
  attr_reader :title
  attr_reader :all_readers

  def initialize(title, author)
    raise ArgumentError, 'Title should exist & should be a String^^' unless title.is_a?(String) && !title.strip.empty?

    @title = title
    @author = author

    @all_readers = []
  end

  def add_reader(reader)
    @all_readers << reader
  end

  private

  def to_s
    "type: #{self.class.name}, " \
    "title: #{@title}, " \
    "author: #{@author}."
  end
end
