# frozen_string_literal: true

# Author stores all the created authors if not stored already
class Author
  include Validation

  attr_reader :name

  def initialize(name, biography = 'empty')
    validate_strings(name, biography)

    @name = name
    @biography = biography
  end

  def ==(other)
    (other.is_a? Author) && (@name == other.name)
  end

  private

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "bio: #{@biography}."
  end
end
