# frozen_string_literal: true

# God damn, rubocop, what do you want me to describe here?
class Author
  attr_reader :name

  def initialize(name, biography = 'empty')
    raise ArgumentError, 'Name should exist & should be a String' unless name.is_a?(String) && !name.strip.empty?

    @name = name
    @biography = biography
    Author.authors!(self)
  end

  def self.authors
    @authors.uniq || []
  end

  def self.authors!(author)
    @authors ||= []
    @authors << author.name
  end

  private

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "bio: #{@biography}, "
  end
end
