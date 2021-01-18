# frozen_string_literal: true

# Well, that's a book. You can read it (actually, you can't, but let's say you can)
class Book
  include Validation

  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    validate_strings(title)
    validate_class(Author, author)

    @title = title
    @author = author
  end

  def ==(other)
    (other.is_a? Book) && (@title == other.title) && (@author == other.author)
  end

  private

  def to_s
    "type: #{self.class.name}, " \
    "title: #{@title}, " \
    "author: #{@author}."
  end
end
