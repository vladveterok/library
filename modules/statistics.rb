# frozen_string_literal: true

# top_readers -- returns n top readers of books in library
# top_books -- returns n top books in library
# count_top_books_readers -- counts the number of unique readers of n books
# and returnes the number
module Statistics
  def top_readers(orders, num = 1)
    orders.group_by(&:reader).max(num) { |this, later| this[1].length <=> later[1].length }
          .flatten.select { |entity| entity.is_a? Reader }
  end

  def top_books(orders, num = 1)
    orders.group_by(&:book).max(num) { |this, later| this[1].length <=> later[1].length }
  end

  def count_top_books_readers(orders, num = 3)
    top_books(orders, num).flatten.select { |entity| entity.is_a?(Order) }.uniq(&:reader).count
  end
end
