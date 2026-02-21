class GraphqlStableConnection < GraphQL::Pagination::Connection
  # Available instance variables
  # @items - ActiveRecord Relation
  # @first - Int value of the forward going pagination record limit
  # @after - String value of the forward going pagination cursor
  # @last - Int value of the backward going pagination record limit
  # @before - String value of the backward going cursor

  # returns a paginated slice of @items based on the given arguments
  def nodes
    @nodes ||= load_nodes
  end

  # returns true if there are items after the ones in #nodes
  def has_next_page
    if first
      nodes
      @has_next_page
    else
      false
    end
  end

  # returns true if there are items before the ones in #nodes
  def has_previous_page
    if last
      nodes
      @has_previous_page
    else
      false
    end
  end

  # returns a String to serve as the cursor for item
  def cursor_for(node)
    Base64.strict_encode64(node.id.to_s)
  end

  private

  def load_nodes
    relation = sliced_relation

    if last
      sliced = relation.reorder("#{table}.id DESC").limit(last + 1).to_a
      @has_previous_page = sliced.size > last
      sliced.first(last).reverse
    elsif first
      sliced = relation.limit(first + 1).to_a
      @has_next_page = sliced.size > first
      sliced.first(first)
    else
      @has_next_page = false
      @has_previous_page = false
      relation.to_a
    end
  end

  def sliced_relation
    relation = items.reorder("#{table}.id ASC")

    if after.present?
      after_id = Base64.strict_decode64(after).to_s
      relation = relation.where("#{table}.id > ?", after_id)
    end

    if before.present?
      before_id = Base64.strict_decode64(before).to_s
      relation = relation.where("#{table}.id < ?", before_id)
    end

    relation
  end

  def table
    @table ||= items.table_name
  end
end
