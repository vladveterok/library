# frozen_string_literal: true

# God damn, rubocop, what do you want me to describe here?
class Author
  def initialize(name, biography = 'empty')
    raise ArgumentError, 'Name should exist & should be a String' unless name.is_a?(String) && !name.strip.empty?

    @name = name 
    @biography = biography
  end

  def to_s
    "type: #{self.class.name}, " \
    "name: #{@name}, " \
    "bio: #{@biography}, "
  end
end
