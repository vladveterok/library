# frozen_string_literal: true

# God damn, rubocop, what do you want me to describe here?
class Author
  attr_reader :name

  def initialize(name, biography = 'empty')
    raise ArgumentError, 'Name should exist & should be a String' unless name.is_a?(String) && !name.strip.empty?

    @name = name
    @biography = biography
    Author.add_to_authors(self)
  end

  def self.all_authors
    @all_authors ||= []
  end

  def self.add_to_authors(author)
    @all_authors ||= []
    @all_authors << author unless @all_authors.find { |auth| auth.name == author.name }
  end

  private

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "bio: #{@biography}, "
  end
end
