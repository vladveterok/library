# frozen_string_literal: true

# Well, that's a book. You can read it (actually, you can't)
class Book
  def initialize(title, author)
    raise ArgumentError, 'Title should exist & should be a String' unless title.is_a?(String) && !title.strip.empty?

    @title = title
    @author = add_author(author)
  end

  private

  def add_author(author)
    Author.authors.find { |auth| auth.name == author } || Author.new(author)
  end

  def to_s
    "type: #{self.class.name}, " \
    "title: #{@title}, " \
    "author: #{@author}, "
  end
end
