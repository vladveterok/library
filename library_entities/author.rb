# frozen_string_literal: true

# Author stores all the created authors if not stored already
class Author
  attr_reader :name

  def initialize(name, biography = 'empty')
    raise ArgumentError, 'Name should exist & should be a String^^' if !name.is_a?(String) || name.strip.empty?

    @name = name
    @biography = biography
  end

  def ==(other)
    if other.is_a? Author
      @name == other.name
    else
      false
    end
  end

  private

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "bio: #{@biography}."
  end
end
