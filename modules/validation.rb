# frozen_string_literal: true

# validate_strings -- raises AE if an argument is not of String class
# validate_integer -- raises AE if an argument is not of Integer class
# validate class -- raises AE if 'argument' is not of a 'clas'
module Validation
  def validate_strings(*args)
    args.each do |argument|
      raise ArgumentError, 'Argument should be a String^^' unless argument.is_a? String
      raise ArgumentError, 'Argument should not be empty^^' if argument.strip.empty?
    end
  end

  def validate_integers(*args)
    args.each do |argument|
      raise ArgumentError, 'Argument should be an Integer^^' unless argument.is_a? Integer
      raise ArgumentError, 'Argument should be positive^^' unless argument.positive?
    end
  end

  def validate_class(clas, argument)
    raise ArgumentError, "Argument should be of the #{clas} class^^" unless argument.is_a?(clas)
  end
end
