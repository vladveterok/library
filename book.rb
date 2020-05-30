# frozen_string_literal: true

require_relative 'author'

# Well, that's a book. You can read it (actually, you can't)
class Book
  attr_reader :title

  def initialize(title, author)
    raise ArgumentError, 'Title should exist & should be a String' unless title.is_a?(String) && !title.strip.empty?
    @all_readers = []
    @title = title
    @author = add_author(author)
    Book.add_to_books(self)
  end

  def self.all_books
    @all_books ||= []
  end

  def self.add_to_books(book)
    @all_books ||= []
    @all_books << book
  end

  def add_to_readers(reader)
    @all_readers << reader
  end

  def all_readers
    @all_readers || []
  end

  private

  def add_author(author)
    Author.all_authors.find { |auth| auth.name == author } || Author.new(author)
  end

  def to_s
    "type: #{self.class.name}, " \
    "title: #{@title}, " \
    "author: #{@author}."
  end
end
