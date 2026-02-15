class GraphqlStableConnection < GraphQL::Pagination::Connection
  # Available instance variables
  # @items - ActiveRecord Relation
  # @first - Int value of the forward going pagination record limit
  # @after - String value of the forward going pagination cursor
  # @last - Int value of the backward going pagination record limit
  # @before - String value of the backward going cursor

  # returns a paginated slice of @items based on the given arguments
  def nodes
  end

  # returns true if there are items after the ones in #nodes
  def has_next_page
  end

  # returns true if there are items before the ones in #nodes
  def has_previous_page
  end

  # returns a String to serve as the cursor for item
  def cursor_for(node)
  end
end
